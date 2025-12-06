# VEAF Foothold Germany v3.90

## Presentation

This is a modification of the original Foothold Germany mission by Leka, that I adapted to make it load all the script files and config directly from the server.

**Done using the latest version updated on 2025.12.06.**

## Update

### Triggers

Add this triggers on MissionStart:

**Modern:**
name: `mission start - dynamic`
do_script:
```lua
FOOTHOLD_DYNAMIC_PATH = [[C:\Users\veaf\Saved Games\DCS.missions\_servers\_TEMPLATES\Missions\foothold\Germany\Modern\]]
env.info("DYNAMIC LOADING")
assert(loadfile(FOOTHOLD_DYNAMIC_PATH .. "VEAF_loader.lua")) ()
```

**Cold War:**
name: `mission start - dynamic`
do_script:
```lua
FOOTHOLD_DYNAMIC_PATH = [[C:\Users\veaf\Saved Games\DCS.missions\_servers\_TEMPLATES\Missions\foothold\Germany\Coldwar\]]
env.info("DYNAMIC LOADING")
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

