# VEAF Foothold Germany v3.93

## Presentation

This is a modification of the original Foothold Germany mission by Leka, that I adapted to make it load all the script files and config directly from the server.

**Done using the latest version updated on 2025.12.11.**

## Update

### Triggers

#### For Foothold

Add this triggers on MissionStart:

**Modern:**
name: `Foothold loading`
do_script:
```lua
FOOTHOLD_DYNAMIC_PATH = [[C:\Users\veaf\Saved Games\DCS.missions\_servers\_TEMPLATES\Missions\foothold\Germany\Modern\]]
env.info("FOOTHOLD LOADING")
assert(loadfile(FOOTHOLD_DYNAMIC_PATH .. "VEAF_loader.lua")) ()
```

**Cold War:**
name: `Foothold loading`
do_script:
```lua
FOOTHOLD_DYNAMIC_PATH = [[C:\Users\veaf\Saved Games\DCS.missions\_servers\_TEMPLATES\Missions\foothold\Germany\Coldwar\]]
env.info("FOOTHOLD LOADING")
assert(loadfile(FOOTHOLD_DYNAMIC_PATH .. "VEAF_loader.lua")) ()
```

### Code

Merge code in zoneCommander.lua (BattleCommander:getStateTable()) :
```lua
			hidden            = v.isHidden or false,
```


## Things to do

- [x] prepare mission
- [x] prepare presets
- [x] add the VEAF scripts with no radio menu
- [x] add the waypoint numbers to the LUA persistence file
- [x] add the active missions to the LUA persistence file
- [x] add the arrows description to the LUA persistence file
- [ ] add the players position to the LUA persistence file
