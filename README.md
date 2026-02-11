# VEAF Foothold Germany v4.1.6

## Presentation

This is a modification of the original Foothold Germany mission by Leka, that I adapted to make it load all the script files and config directly from the server.

**Done using the latest version updated on 2026.02.11.**

## Update

### Triggers

#### For Foothold

Add this triggers on MissionStart:

**Modern:**
name: `Foothold loading`
do_script:
```lua
FOOTHOLD_DYNAMIC_PATH = [[C:\Users\veaf\Saved Games\DCS.missions\_TEMPLATES\Missions\foothold\Germany\Modern\]]
env.info("FOOTHOLD LOADING")
assert(loadfile(FOOTHOLD_DYNAMIC_PATH .. "VEAF_loader.lua")) ()
```

**Cold War:**
name: `Foothold loading`
do_script:
```lua
FOOTHOLD_DYNAMIC_PATH = [[C:\Users\veaf\Saved Games\DCS.missions\_TEMPLATES\Missions\foothold\Germany\Coldwar\]]
env.info("FOOTHOLD LOADING")
assert(loadfile(FOOTHOLD_DYNAMIC_PATH .. "VEAF_loader.lua")) ()
```

### Code


## Things to do


