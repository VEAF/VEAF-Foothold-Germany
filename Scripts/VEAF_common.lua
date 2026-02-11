--[[

# PASSWORDS

- scripts execution (markers, etc.) : veaf_foothold_2026
- game master slots : veaf_foothold_gamemaster

]]


local FOOTHOLD_DYNAMIC_SCRIPTS_PATH = FOOTHOLD_DYNAMIC_PATH .. [[..\scripts\]]

-- load the VEAF scripts
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "mist.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "veaf-scripts.lua")) ()

-- configure the VEAF scripts
veaf.config.MISSION_NAME = "Foothold_Germany"
veaf.config.MISSION_EXPORT_PATH = nil -- use default folder
veaf.loggers.get(veaf.Id):info("init - veafRadio")
veafRadio.initialize(true, true)
veaf.loggers.get(veaf.Id):info("init - veafSpawn")
veafSpawn.initialize()
veaf.loggers.get(veaf.Id):info("init - veafWeather")
veafWeather.initialize()
veaf.loggers.get(veaf.Id):info("init - veafShortcuts")
veafShortcuts.initialize()
veafSecurity.password_L9["2a4efd2397e081bcacb82b3e447c584c65cc83ee"] = true -- password is "veaf_foothold_2026"
veafSecurity.password_L1["2a4efd2397e081bcacb82b3e447c584c65cc83ee"] = true -- password is "veaf_foothold_2026"
veaf.loggers.get(veaf.Id):info("Loading configuration")
veaf.loggers.get(veaf.Id):info("init - veafSecurity")
veafSecurity.initialize()
veaf.loggers.get(veaf.Id):info("init - veafRemote")
veafRemote.initialize()

assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Moose_2026-02-06.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Foothold Config.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "zoneCommander.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "COLDWAR_SETUP.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "WelcomeMessage.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Zeus.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "EWRS.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Foothold CTLD.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Splash_Damage_3.4.1_leka.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "AIEN.lua")) ()

-- Silence ATC on all the airdromes
veaf.silenceAtcOnAllAirbases()