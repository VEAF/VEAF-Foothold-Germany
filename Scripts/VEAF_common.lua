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


-- setup first batch of configuration (no need for any script before this one)
NoSA10AndSA11=false
CreditLosewhenKilled=false -- if true, Blue coalition will lose 100 points for every player death
SplashDamage=false
ShowKills=true -- if true, a message will come up upon kills
StoreLimit = true -- if true, pilots will have to earn points before spending coalition budget
CTLDCost=true -- if the above is false, then ctld stuff wil not cost anything. default is true
RankingSystem = true -- if false, the shop is open to everyone and no ranking will be applied.
InvisibleA10 = false-- if the above is true, then A10 wlll be invisble to the enemy planes, not GROUND UNITS
UseStatics=true
UseC130LoadAndUnload = true -- if the above is true, you will only load stuff what inside the herc using the herc loading system and not the ctld menu to load it into the helicopter.

-- load first batch of scripts
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Moose.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Hercules_Cargo.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "zoneCommander.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "COLDWAR_SETUP.lua")) ()

-- setup second batch of configuration (need to load zoneCommander_moose.lua script before)
GlobalSettings.setDifficultyScaling(1.3,1) --red respawn factor
GlobalSettings.setDifficultyScaling(1.0,2) --blue respawn facto

-- Set the autosuspend for performance
GlobalSettings.autoSuspendNmBlue = 80 -- suspend blue zones deeper than this nm
GlobalSettings.autoSuspendNmRed = 90  -- suspend red zones deeper than this nm

LogisticCommander.allowedTypes = {}
LogisticCommander.allowedTypes['Ka-50'] = false
LogisticCommander.allowedTypes['Ka-50_3'] = false
LogisticCommander.allowedTypes['Mi-24P'] = true
LogisticCommander.allowedTypes['SA342Mistral'] = false
LogisticCommander.allowedTypes['SA342L'] = false
LogisticCommander.allowedTypes['SA342M'] = false
LogisticCommander.allowedTypes['SA342Minigun'] = false
LogisticCommander.allowedTypes['UH-60L'] = true
LogisticCommander.allowedTypes['UH-60L_DAP'] = true
LogisticCommander.allowedTypes['AH-64D_BLK_II'] = false
LogisticCommander.allowedTypes['UH-1H'] = true
LogisticCommander.allowedTypes['Mi-8MT'] = true
LogisticCommander.allowedTypes['Hercules'] = true
LogisticCommander.allowedTypes['OH58D'] = false
LogisticCommander.allowedTypes['CH-47Fbl1'] = true
LogisticCommander.allowedTypes['Bronco-OV-10A'] = false
LogisticCommander.allowedTypes['OH-6A'] = false
LogisticCommander.allowedTypes['C-130J-30'] = true

LogisticCommander.doubleSupplyTypes = {}
LogisticCommander.doubleSupplyTypes['CH-47Fbl1'] = true
LogisticCommander.doubleSupplyTypes['Hercules'] = true
LogisticCommander.doubleSupplyTypes['C-130J-30'] = true

LogisticCommander.maxCarriedPilots = 4

-- load the rest of the scripts
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "WelcomeMessage_CWG.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Foothold_CWG_MANTIS.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "weaponslist.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Zeus.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "EWRS.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "MA_CTLD_CWG.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "Splash_Damage_3.4.1_leka.lua")) ()
assert(loadfile(FOOTHOLD_DYNAMIC_SCRIPTS_PATH .. "AIEN.lua")) ()

-- Silence ATC on all the airdromes
veaf.silenceAtcOnAllAirbases()

function createDirectoryRecursive(path)
    -- Remove trailing slash if present
    path = path:gsub("/$", "")
    
    -- Split path into components
    local parts = {}
    for part in path:gmatch("[^/\\]+") do
        table.insert(parts, part)
    end
    
    -- Create each directory level
    local currentPath = ""
    for _, part in ipairs(parts) do
        currentPath = currentPath .. part .. "/"
        pcall(function() lfs.mkdir(currentPath) end)
    end
end

function writeToFile(filepath, content)
    -- Extract directory path from filepath
    local dir = filepath:match("(.*/)")
    
    -- Create full directory structure if needed
    if dir then
        createDirectoryRecursive(dir)
    end
    
    -- Attempt to open file in write mode
    local file, err = io.open(filepath, "w")
    
    -- Check if file opening succeeded
    if not file then
        env.info("Error opening file " .. filepath .. ": " .. tostring(err))
        return false
    end
    
    -- Attempt to write content
    local success, writeErr = pcall(function()
        file:write(content)
    end)
    
    -- Always close the file, even if an error occurred
    file:close()
    
    -- Check write result
    if not success then
        env.info("Error writing to file " .. filepath .. ": " .. tostring(writeErr))
        return false
    end
    
    return true
end

if lfs and io then
    if bc and bc.saveFile then
        local persistence_filename = bc.saveFile
        local sitac_filename = lfs.writedir() .. [[Missions/Saves/foothold.status]]
        local result = writeToFile(sitac_filename, persistence_filename .. "\n")
        if result then
            env.info("Created SITAC file in " .. sitac_filename)
        end
    else
        env.info("Skipping SITAC file creation: persistence filename unavailable")
    end
end

-- Overload the BattleCommander:getStateTable() to add our own data
-------------------------------------------------------------------

-- Get a reference to the original function
veaf.loggers.get(veaf.Id):info("Getting a reference to the original BattleCommander.getStateTable function")
Original_BattleCommander_getStateTable = BattleCommander.getStateTable
veaf.loggers.get(veaf.Id):info("Got a reference to the original BattleCommander.getStateTable function")

-- This is the new function that will replace BattleCommander:getStateTable()
function BattleCommander_newGetStateTable(self)
    veaf.loggers.get(veaf.Id):info("BattleCommander_newGetStateTable() - Starting custom getStateTable")

    local stateTable = Original_BattleCommander_getStateTable(self)

    -- add the zone details
    veaf.loggers.get(veaf.Id):info("Adding zone details to state table")
    if not veaf.foothold_zonesDetails_cache then
        veaf.loggers.get(veaf.Id):info("Adding zone details to the cache")
        veaf.foothold_zonesDetails_cache = {}
        local zonesCount = 0
        for i,v in ipairs(self.zones) do
            local cleanFlavorText = nil
            if v.flavorText then
                -- Remove trailing newlines and whitespace from flavorText
                cleanFlavorText = v.flavorText:gsub("[\n\r]+$", ""):gsub("^%s+", ""):gsub("%s+$", "")
            end
            veaf.foothold_zonesDetails_cache[v.zone] = {
                flavorText = cleanFlavorText,
                hidden     = v.isHidden or false
            }
            zonesCount = zonesCount + 1
        end
        veaf.loggers.get(veaf.Id):info("Added zone details to %d zones", zonesCount)
    end
    stateTable.zonesDetails = veaf.foothold_zonesDetails_cache or {}

    -- add the active missions
    veaf.loggers.get(veaf.Id):info("Adding active missions to state table")
    if mc and mc.missions then
        stateTable.missions = {}
        local activeMissionCount = 0
        for i, mission in ipairs(mc.missions) do
            if mission.isRunning or (mission.isActive and mission:isActive()) then
                local missionTitle = type(mission.title) == "function" and mission.title() or mission.title
                local missionInfo = {
                    title = missionTitle,
                    description = "PLACEHOLDER until LUA export can handle multiline strings", -- mission.description,
                    isRunning = mission.isRunning,
                    isEscortMission = mission.isEscortMission or false
                }
                table.insert(stateTable.missions, missionInfo)
                activeMissionCount = activeMissionCount + 1
                veaf.loggers.get(veaf.Id):trace("Added mission: %s (running=%s)", missionTitle, mission.isRunning)
            end
        end
        veaf.loggers.get(veaf.Id):info("Added %d active missions to state table", activeMissionCount)
    else
        veaf.loggers.get(veaf.Id):info("MissionCommander (mc) not available or has no missions")
    end

    -- add the arrows schema
    veaf.loggers.get(veaf.Id):info("Adding arrows schema to state table")
    if not veaf.foothold_connections_cache then
        veaf.loggers.get(veaf.Id):info("Adding arrows schema to the cache")
        veaf.foothold_connections_cache = {}
        if self.connections then
            local connectionCount = 0
            for i, connection in ipairs(self.connections) do
                table.insert(veaf.foothold_connections_cache, {
                    from = connection.from,
                    to = connection.to
                })
                connectionCount = connectionCount + 1
            end
            veaf.loggers.get(veaf.Id):info("Computed %d connections for the state table", connectionCount)
        else
            veaf.loggers.get(veaf.Id):info("No connections available in BattleCommander")
        end
    end
    stateTable.connections = veaf.foothold_connections_cache or {}

    -- add the players positions
    veaf.loggers.get(veaf.Id):info("Adding players position to state table")
    stateTable.players = {}
    local nbPlayers = 0
    local nbPlayersOK = 0
    for _, unit in pairs(mist.DBs.humansByName) do
        nbPlayers = nbPlayers + 1
        local coalitionId = 0
        if unit.coalition then
            if unit.coalition:lower() == "red" then
                coalitionId = coalition.side.RED
            elseif unit.coalition:lower() == "blue" then
                coalitionId = coalition.side.BLUE
            end
        end
        local dcsUnit = Unit.getByName(unit.unitName)
        if dcsUnit then
            local playerTable = {}
            playerTable.coalition = unit.coalition
            playerTable.playerName = dcsUnit:getPlayerName()
            playerTable.unitType = dcsUnit:getTypeName()
            local point = dcsUnit:getPoint()
            if point then
                playerTable.latitude, playerTable.longitude, playerTable.altitude = coord.LOtoLL(point)
            end
            table.insert(stateTable.players, playerTable)
            nbPlayersOK = nbPlayersOK + 1
        end
    end
    veaf.loggers.get(veaf.Id):info("Added %s active players data out of %s players slots to state table", nbPlayersOK, nbPlayers)

    -- add the ejected pilots positions
    veaf.loggers.get(veaf.Id):info("Adding ejected pilots position to state table")
    stateTable.ejectedPilots = {}
    local nbEjectedPilots = 0
    if lc and lc.ejectedPilots then
        for _, ejectedPilot in pairs(lc.ejectedPilots) do
            local ejectedPilotTable = {
                playerName = "Unknown",
                lostCredits = 0
            }
            local objectID = ejectedPilot:getObjectID()
            local pilotData = landedPilotOwners and landedPilotOwners[objectID]
            if pilotData then
                ejectedPilotTable.playerName = pilotData.playerName or "Unknown"
                ejectedPilotTable.lostCredits = pilotData.lostCredits or 0
            end
            local point = ejectedPilot:getPoint()
            if point then
                ejectedPilotTable.latitude, ejectedPilotTable.longitude, ejectedPilotTable.altitude = coord.LOtoLL(point)
            end
            table.insert(stateTable.ejectedPilots, ejectedPilotTable)
            nbEjectedPilots = nbEjectedPilots + 1
        end
    end
    veaf.loggers.get(veaf.Id):info("Added %s ejected pilots data to state table", nbEjectedPilots)

    veaf.loggers.get(veaf.Id):info("BattleCommander_newGetStateTable() - Completed")
    return stateTable
end

-- Replace the BattleCommander:getStateTable() function with ours
BattleCommander.getStateTable = BattleCommander_newGetStateTable
