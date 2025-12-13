# VEAF Foothold Germany - AI Agent Instructions

## Communication & Collaboration

- **Language:** Français (speak to the developer in French)
- **Tone:** Treat the developer as an equal (direct, practical, no obsequiousness)
- **Style:** Brief explanations in chat, let code/docs speak for themselves

### Documentation Standards
- **English only:** All source code, comments, and documentation files
- **Harmonize:** Match existing patterns, conventions, and tone in the repository
- **Reuse:** Existing solutions first; ask before proposing alternatives
- **Avoid:** Meta-documentation ("What was done", "Implementation summary", etc.)

### File Naming Conventions
- Be specific: `BUILD_AND_RELEASE_GUIDE.md` ✅, not `IMPLEMENTATION_SUMMARY.md` ❌
- Standards: `README.md`, `QUICKSTART.md`, `ARCHITECTURE.md` ✅

### Code Quality
- Type hints on all functions, docstrings for public methods
- Follow existing code style, include error handling
- Test cross-platform compatibility when possible
- Remove old/unused scripts when replacing them

---

## Project Overview

This is a **DCS World mission repository** for a modified "Foothold Germany" dynamic campaign by Leka. The mission uses **dynamic script loading** from a server directory rather than embedding scripts directly in the .miz files. It supports both Modern and Cold War eras through configuration.

**NOT to be confused with**: The VEAF Mission Creation Tools project (Python/Lua toolset). This repo contains a specific DCS mission that *uses* those tools.

## Architecture & Critical Patterns

### Dynamic Script Loading (CRITICAL)

The mission loads Lua scripts at runtime from a server path. Understanding this flow is essential:

1. **Mission Trigger** (MissionStart) sets `FOOTHOLD_DYNAMIC_PATH` and loads:
   - Modern: `Modern/VEAF_loader.lua`
   - Coldwar: `Coldwar/VEAF_loader.lua`

2. **VEAF_loader.lua** sets `Era` variable and loads `Scripts/VEAF_common.lua`

3. **VEAF_common.lua** orchestrates script loading in **strict order**:
   ```lua
   -- Phase 1: VEAF Framework
   assert(loadfile(path .. "mist.lua")) ()
   assert(loadfile(path .. "veaf-scripts.lua")) ()
   -- VEAF configuration (veafRadio, veafSpawn, veafWeather, etc.)

   -- Phase 2: Core Mission Scripts
   assert(loadfile(path .. "Moose.lua")) ()
   assert(loadfile(path .. "zoneCommander.lua")) ()
   assert(loadfile(path .. "COLDWAR_SETUP.lua")) ()
   -- GlobalSettings configuration (difficulty, auto-suspend, logistics)

   -- Phase 3: Feature Scripts
   assert(loadfile(path .. "MA_CTLD_CWG.lua")) ()
   assert(loadfile(path .. "Zeus.lua")) ()
   assert(loadfile(path .. "EWRS.lua")) ()
   -- etc.
   ```

**Why order matters**: Later scripts depend on globals/functions from earlier ones. Never reorder without testing.

### Zone Persistence System

**IMPORTANT**: `zonePersistance = {}.lua` in the repo root is an **example/template** file showing the persistence format, NOT the actual live mission state. The real persistence file is generated at runtime by zoneCommander and saved to the DCS mission directory.

The persistence file structure:
```lua
zonePersistance = {
  zones = {
    ['ZoneName'] = {
      side = 2,              -- 0=neutral, 1=red, 2=blue
      level = 3,             -- Current upgrade level
      active = true,         -- Zone is spawned
      hidden = false,        -- Hidden from F10 map
      upgradesUsed = 0,      -- Extra upgrades purchased
      remainingUnits = {},   -- Units alive per level
      triggers = {},         -- Trigger states
      lat_long = {},         -- Zone coordinates
      -- ... more fields
    }
  },
  accounts = {},           -- Coalition funds
  shops = {},              -- Shop inventory
  playerStats = {},        -- Player progression
  -- ... more global state
}
```

`BattleCommander:loadFromDisk()` ([zoneCommander.lua:8653](../Scripts/zoneCommander.lua#L8653)) reads this file on mission start to restore state. `BattleCommander:getStateTable()` generates it for saving.

### Era Configuration Pattern

Single codebase supports Modern/Coldwar through `Era` global:
```lua
Era = 'Modern'  -- or 'Coldwar' (Gulfwar aliases to Coldwar)
```

Scripts like `zoneCommander.lua` check `Era` to spawn era-appropriate units. The `COLDWAR_SETUP.lua` script handles era-specific initialization.

### zoneCommander.lua Deep Dive (13k+ lines)

This is the **core system** managing zones, economy, logistics, and persistence. Three main components:

#### 1. GlobalSettings (Static Configuration)
Global functions for mission-wide settings:
- `GlobalSettings.setDifficultyScaling(value, coalition)` - Adjusts spawn difficulty ([line 2025](../Scripts/zoneCommander.lua#L2025))
- `autoSuspendNmBlue/Red` - Performance: suspend zones far from players
- Set in [VEAF_common.lua:56-61](../Scripts/VEAF_common.lua#L56-L61)

#### 2. BattleCommander (Mission Controller)
Manages the entire campaign:
- **Zone Management**: `zones` table, `getZoneByName()`, `activateNeutralStartZones()`
- **Economy**: `accounts` (coalition funds), `shops` (purchasable items), `credit()`/`debit()`
- **Persistence**: `loadFromDisk()` ([line 8653](../Scripts/zoneCommander.lua#L8653)), `saveToFile()`, `getStateTable()`
- **Player Progression**: `playerStats`, ranking system if `RankingSystem=true`
- **Difficulty Scaling**: Dynamic difficulty based on captures (`increaseDifficulty()`, `decreaseDifficulty()`)
- **Shop System**: `registerShopItem()`, `buyShopItem()`, FARP placement, airstrikes

**Key patterns**:
```lua
-- Create the commander
bc = BattleCommander:new(savepath, updateFreq, saveFreq, difficulty)

-- Add zones
bc:RegisterZone(ZoneCommander:new{zone='Fulda', side=2, level=3, ...})

-- Start the mission
bc:start()
```

#### 3. ZoneCommander (Individual Zone)
Represents a single capturable zone:
- **State**: `zone` (name), `side` (0/1/2), `level` (upgrade tier), `active` (spawned)
- **Units**: `groups` (spawned groups), `remainingUnits` (persistence), `built` (tracking)
- **Upgrades**: `upgrades.blue`/`upgrades.red` (group names per upgrade level)
- **Spawning**: Builds units based on level, cleans up on capture
- **Persistence**: Coordinates (`lat_long`), triggers, destroyed units

**Upgrade system**:
- Each zone has levels 0-N (N often = 8 for airbases)
- Higher level = more units/defenses spawned
- `upgradesUsed` tracks extra purchased upgrades beyond base level

#### 4. LogisticCommander (Transport System)
Handles supply/pilot transport via helicopters/cargo aircraft:
- `allowedTypes` - Aircraft whitelist ([VEAF_common.lua:63-81](../Scripts/VEAF_common.lua#L63-L81))
- `doubleSupplyTypes` - Heavy lifters carry 2x ([line 83-86](../Scripts/VEAF_common.lua#L83-L86))
- `loadSupplies()`, `unloadSupplies()` - Cargo operations
- `loadPilot()`, `unloadPilot()` - CSAR operations

### Logistics Configuration

See [VEAF_common.lua:63-87](../Scripts/VEAF_common.lua#L63-L87) for `LogisticCommander` settings:
- `allowedTypes`: Which aircraft can load supplies (Ka-50 = false, UH-1H = true)
- `doubleSupplyTypes`: Heavy lifters (CH-47, C-130) carry 2x supplies
- `maxCarriedPilots`: Passenger limit for CSAR

When adding/removing aircraft mods, update these tables.

## File Structure

```
VEAF-Foothold-Germany/
├── Modern/
│   └── VEAF_loader.lua          # Era=Modern, loads VEAF_common.lua
├── Coldwar/
│   └── VEAF_loader.lua          # Era=Coldwar, loads VEAF_common.lua
├── Scripts/
│   ├── VEAF_common.lua          # MAIN CONFIG - script loading orchestrator
│   ├── zoneCommander.lua        # Core zone control system (13k+ lines)
│   ├── veaf-scripts.lua         # VEAF framework bundle
│   ├── mist.lua, Moose.lua      # DCS utility frameworks
│   └── [feature scripts]        # CTLD, EWRS, Zeus, Hercules, etc.
├── src/
│   ├── presets.yaml             # Radio preset configuration (VEAF tools)
│   ├── presets.md               # Documentation for radio presets
│   └── options                  # Mission options file
├── zonePersistance = {}.lua     # EXAMPLE persistence format (not live state)
└── MA_Foothold_GCW_V*.miz       # Mission files (Modern/Coldwar variants)
```

## Step-by-Step Workflows

### Workflow 1: Adding a New Third-Party Script

**Goal**: Integrate a new Lua script (e.g., `SkynetIADS.lua` for improved SAM AI)

**Steps**:
1. **Place the script** in `Scripts/` directory:
   ```bash
   cp path/to/SkynetIADS.lua Scripts/
   ```

2. **Edit VEAF_common.lua** to load it in the correct phase:
   - If it depends on Moose → Phase 2 or 3
   - If standalone → Phase 1 (after mist/veaf-scripts)
   ```lua
   -- In Scripts/VEAF_common.lua, add after existing loadfile calls:
   assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "SkynetIADS.lua")) ()
   ```

3. **Add initialization code** below the loadfile (if needed):
   ```lua
   -- Configure the new system
   local iads = SkynetIADS:create('IADS Network')
   iads:activate()
   ```

4. **Test BOTH eras**:
   - Open `MA_Foothold_GCW_V3.93_Modern_ICAO_EDFH.miz` in DCS Mission Editor
   - Run mission → Check for errors in DCS.log
   - Repeat for Coldwar variant

5. **Commit changes**:
   ```bash
   git add Scripts/SkynetIADS.lua Scripts/VEAF_common.lua
   git commit -m "Add SkynetIADS for advanced SAM integration"
   ```

### Workflow 2: Adding an Aircraft to Logistics Whitelist

**Goal**: Allow the new AH-64D Apache to load supplies

**Steps**:
1. **Find the DCS type name**:
   - In DCS Mission Editor, place an AH-64D unit
   - Check the mission file or use `veaf-tools.exe` to inspect
   - Type name is typically: `AH-64D_BLK_II`

2. **Edit VEAF_common.lua**:
   ```lua
   # In Scripts/VEAF_common.lua, around line 73:
   LogisticCommander.allowedTypes['AH-64D_BLK_II'] = true
   ```

3. **Optional: Set as heavy lifter** (if it should carry double supplies):
   ```lua
   # Around line 85:
   LogisticCommander.doubleSupplyTypes['AH-64D_BLK_II'] = true
   ```

4. **Test in-game**:
   - Load a Modern mission (Apache not in Coldwar)
   - Fly the Apache near a supply crate
   - Verify cargo menu appears (F10 → CTLD)

### Workflow 3: Modifying Zone Initial State

**Goal**: Change Fulda airbase to start at level 5 instead of 3, Blue side

**Steps**:
1. **Edit the example persistence file** (used as template):
   ```lua
   # In zonePersistance = {}.lua, find Fulda zone:
   ['Fulda'] = {
     side = 2,        -- Keep Blue (2)
     level = 5,       -- Change from 3 to 5
     active = true,
     # ... rest unchanged
   }
   ```

2. **OR edit in zoneCommander.lua** (if defining zones in code):
   - Search for `RegisterZone.*Fulda` in Scripts/
   - Modify the `level` parameter in the zone definition

3. **Delete old save files** on the server:
   - The mission loads saved state, overriding defaults
   - Remove old `zonePersistance*.lua` from DCS mission directory
   - Mission will use new defaults on first run

4. **Verify in-game**:
   - Start mission → Check Fulda has 5 upgrade levels active
   - Use F10 map markers or in-game status

### Workflow 4: Adjusting Difficulty Settings

**Goal**: Make Red forces respawn faster (increase pressure on Blue)

**Steps**:
1. **Edit VEAF_common.lua**:
   ```lua
   # Around line 56-57:
   GlobalSettings.setDifficultyScaling(1.5, 1)  -- Red: was 1.3, now 1.5
   GlobalSettings.setDifficultyScaling(1.0, 2)  -- Blue: unchanged
   ```

2. **Understand the parameters**:
   - First arg: multiplier (1.0 = normal, 1.5 = 50% more units)
   - Second arg: coalition (1 = Red, 2 = Blue)

3. **Optional: Adjust auto-suspend** (performance vs immersion):
   ```lua
   # Lines 60-61:
   GlobalSettings.autoSuspendNmBlue = 60  -- Reduced from 80 (more active zones)
   GlobalSettings.autoSuspendNmRed = 70   -- Reduced from 90
   ```

4. **Test balance**:
   - Run mission for 30-60 mins
   - Monitor server performance (suspend helps if slow)
   - Check if Red captures zones faster

### Workflow 5: Adding Hidden Field to Zones (README TODO)

**Goal**: Implement the code merge from README to support hidden zones in state

**Steps**:
1. **Locate `BattleCommander:getStateTable()` in zoneCommander.lua**:
   - This function generates the persistence data
   - Search for `function BattleCommander:getStateTable`

2. **Find the zone serialization loop**:
   ```lua
   # Look for code like:
   for i, v in pairs(self.zones) do
     table.insert(t.zones, {
       side = v.side,
       level = v.level,
       # ... other fields
     })
   end
   ```

3. **Add the hidden field**:
   ```lua
   # Insert this line with other fields:
   hidden = v.isHidden or false,
   ```

4. **Verify loading** (already implemented):
   - Check `BattleCommander:loadFromDisk()` around line 8658
   - Should already handle `hidden` field when loading

5. **Test persistence**:
   - Mark a zone as hidden in-game (if mechanism exists)
   - Save mission state
   - Reload mission → Verify zone stays hidden

## Common Tasks

### Modifying Script Load Order
1. Edit [Scripts/VEAF_common.lua](../Scripts/VEAF_common.lua)
2. Place new scripts in correct phase (Framework → Core → Features)
3. Test both Modern AND Coldwar variants

### Adding/Removing Aircraft from Logistics
Edit [Scripts/VEAF_common.lua:63-87](../Scripts/VEAF_common.lua#L63-L87):
```lua
LogisticCommander.allowedTypes['NewHelicopter'] = true
```

### Changing Difficulty Settings
Edit [Scripts/VEAF_common.lua:56-61](../Scripts/VEAF_common.lua#L56-L61):
```lua
GlobalSettings.setDifficultyScaling(1.3,1) -- Red respawn multiplier
GlobalSettings.setDifficultyScaling(1.0,2) -- Blue respawn multiplier
GlobalSettings.autoSuspendNmBlue = 80      -- Performance optimization
```

### Updating Radio Presets
1. Edit [src/presets.yaml](../src/presets.yaml) following the structure in [src/presets.md](../src/presets.md)
2. Use veaf-tools.exe (in repo root) to inject into .miz:
   ```bash
   veaf-tools.exe radio-presets --mission MA_Foothold_*.miz
   ```

### Understanding Zone Mechanics
- Read [zoneCommander.lua](../Scripts/zoneCommander.lua) - the core system
- `BattleCommander:getStateTable()` (saves state) requires `hidden` field (see README merge code)
- Landing zones: Zones ending in `-land` or `-land-N` are auto-detected
- `PrecomputeLandingSpots()` ([line 73](../Scripts/zoneCommander.lua#L73)) finds valid helicopter LZ positions

## Key Conventions

### Passwords (Hardcoded)
- Script execution markers: `veaf_foothold_2026` (SHA in [VEAF_common.lua:28-29](../Scripts/VEAF_common.lua#L28-L29))
- Game master slots: `veaf_foothold_gamemaster`

### Global Configuration Flags
See [Scripts/VEAF_common.lua:38-47](../Scripts/VEAF_common.lua#L38-L47):
- `NoSA10AndSA11=false` - Allow high-threat SAMs
- `CreditLosewhenKilled=false` - Point penalty for deaths
- `RankingSystem=true` - Enable progression/shop restrictions
- `UseC130LoadAndUnload=true` - Hercules cargo system

### Mission Versioning
Version in mission filename: `MA_Foothold_GCW_V3.93_Modern_ICAO_EDFH.miz`

Current: v3.93 (updated 2025.12.11 per README)

## Tools Integration

### veaf-tools.exe (Present in Repo)
CLI tool for mission manipulation (weather, radio, waypoints, etc.). See logs in `veaf-tools.log`.

### VEAF Framework Modules
Initialized in [VEAF_common.lua:18-34](../Scripts/VEAF_common.lua#L18-L34):
- `veafRadio` - Radio menu system (disabled for Foothold - no radio menus)
- `veafSpawn` - Unit spawning
- `veafWeather` - Dynamic weather
- `veafShortcuts` - Quick commands
- `veafSecurity` - Password protection
- `veafRemote` - Remote control features

## TODO List (from README)
- [ ] Add waypoint numbers to persistence file
- [ ] Add active missions to persistence file
- [ ] Add arrows description to persistence file
- [ ] Add player positions to persistence file

These require extending `BattleCommander:getStateTable()` in zoneCommander.lua.

## Debugging & Logs

- DCS log: `%USERPROFILE%\Saved Games\DCS\Logs\dcs.log`
- Script errors appear as red messages in DCS mission editor or in-game
- Use `env.info()` for debug output to dcs.log
- `veaf-tools.log` contains tool execution logs

## Important Notes

- **Never modify .miz files directly** - use DCS Mission Editor or veaf-tools.exe
- **Test both eras** after script changes - Era-specific code may behave differently
- **Backup zonePersistance file** before major changes - though note it's an example in repo
- **Script load order is critical** - assert() calls will crash mission if files missing/misordered
- **Zone state is server-side** - Real persistence is on DCS server, not in Git
