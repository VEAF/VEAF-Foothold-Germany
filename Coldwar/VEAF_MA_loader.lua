local MA_DYNAMIC_SCRIPTS_PATH = MA_DYNAMIC_PATH .. [[..\scripts\]]

-- setup first batch of configuration (no need for any script before this one)
Era = 'Coldwar' -- Era can be 'Coldwar' or 'Modern'
UseStatics=true
CreditLosewhenKilled=false -- if true, Blue coalition will lose 100 points for every player death
NoSA10AndSA11=false
SplashDamage=false
ShowKills=true -- if true, a messagw will come up upon kills
StoreLimit = false
CTLDCost=true -- if the above is false, then ctld stuff wil not cost anything. default is true

-- load first batch of scripts
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "Moose_2025-08-14.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "Hercules_Cargo.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "zoneCommander_moose.lua")) ()

-- setup second batch of configuration (need to load zoneCommander_moose.lua script before)
GlobalSettings.setDifficultyScaling(1.4,1) -- red respawn factor
GlobalSettings.setDifficultyScaling(1.1,2) -- blue respawn factor

-- load the rest of the scripts
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "MA_Setup_CWG.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "WelcomeMessage_CWG.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "Zeus.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "weaponslist.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "Foothold_CWG_MANTIS.lua")) ()
--assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "noFlyZone Caucasus.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "EWRS.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "MA_CTLD_CWG.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "Splash_Damage_3.4.1_leka.lua")) ()
assert(loadfile(MA_DYNAMIC_SCRIPTS_PATH .. "AIEN.lua")) ()

