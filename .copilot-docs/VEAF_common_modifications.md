# VEAF_common.lua Modifications Documentation

This document details the custom modifications made to the Foothold Germany mission through the `VEAF_common.lua` script, with particular focus on the persistence file enhancements.

## Overview

The `VEAF_common.lua` script serves as the main configuration and initialization file for the Foothold Germany mission. It has been extensively modified to enhance the mission's persistence capabilities and provide additional data for external tools and interfaces.

## Mission Configuration

### Basic Settings
- **Mission Name**: "Foothold_Germany"
- **Security Passwords**: 
  - Scripts execution: "veaf_foothold_2026" 
  - Game master slots: "veaf_foothold_gamemaster"

### Core Features Configuration
- **Splash Damage**: Disabled
- **Kill Notifications**: Enabled
- **Store Limit**: Enabled (pilots must earn points)
- **CTLD Cost**: Enabled
- **Ranking System**: Enabled
- **Warehouse Logistics**: Enabled
- **Auto Resource Fill**: 5 items every 15 minutes
- **AI Delivery Amount**: 20 warehouse items per supply run

### Aircraft Configuration
The script defines detailed aircraft permissions for logistics operations, including:
- Allowed aircraft types for logistics operations
- Double supply capacity aircraft (CH-47Fbl1, Hercules, C-130J-30)
- Maximum carried pilots limit (4)

## Utility Functions

### File System Operations
Two new utility functions have been added:

#### `createDirectoryRecursive(path)`
- Creates directory structures recursively
- Cross-platform path handling (supports both `/` and `\`)
- Uses `pcall` for error handling

#### `writeToFile(filepath, content)`
- Writes content to files with automatic directory creation
- Comprehensive error handling and logging
- Returns boolean success indicator

### SITAC File Creation
The script automatically creates a SITAC (Situation Tactical) status file:
- **Location**: `%DCS_HOME%/Missions/Saves/foothold.status`
- **Content**: Path to the current persistence file
- **Purpose**: Enables external tools to locate the current mission state

## Persistence Enhancements

The most significant modifications involve overriding core DCS functions to enhance the persistence file with additional mission data.

### Utils.serializeValue() Override

The original `Utils.serializeValue()` function has been completely replaced to provide better control over data serialization:
- Maintains original functionality for basic types (number, boolean, string)
- Enhanced table serialization with proper formatting
- Support for both compact (oneLine) and formatted output
- Improved handling of trailing commas and spacing

### BattleCommander.getStateTable() Override

The core persistence function has been extended to include five major data categories:

#### 1. Zone Details (`zonesDetails`)
**Purpose**: Provides comprehensive information about each zone in the mission.

**Data Structure**:
```lua
zonesDetails = {
    ["ZoneName"] = {
        flavorText = "Cleaned description text",
        hidden = false
    }
}
```

**Features**:
- Cached for performance (populated once)
- Automatic cleanup of flavor text (removes trailing newlines/whitespace)
- Hidden zone status tracking

#### 2. Active Missions (`missions`)
**Purpose**: Tracks currently active or running missions for external monitoring.

**Data Structure**:
```lua
missions = {
    {
        title = "Mission Title",
        description = "Mission Description", 
        isRunning = true,
        isEscortMission = false
    }
}
```

**Features**:
- Dynamic title/description evaluation (supports function callbacks)
- Filters only active or running missions
- Special escort mission flag tracking

#### 3. Connection Schema (`connections`)
**Purpose**: Maps the strategic connections between zones for tactical planning.

**Data Structure**:
```lua
connections = {
    {
        from = "SourceZone",
        to = "DestinationZone"
    }
}
```

**Features**:
- Cached for performance
- Represents the tactical flow and dependencies between zones

#### 4. Player Positions (`players`)
**Purpose**: Real-time tracking of active player locations and status.

**Data Structure**:
```lua
players = {
    {
        coalition = 2,
        playerName = "PlayerName",
        unitType = "F/A-18C_hornet",
        latitude = 49.123456,
        longitude = 8.123456,
        altitude = 1500.0
    }
}
```

**Features**:
- Real-time coordinate conversion (DCS to Lat/Lon)
- Coalition and aircraft type tracking
- Altitude information

#### 5. Ejected Pilots (`ejectedPilots`)
**Purpose**: Tracks pilots who have ejected and need rescue operations.

**Data Structure**:
```lua
ejectedPilots = {
    {
        playerName = "PlayerName",
        lostCredits = 100,
        latitude = 49.123456,
        longitude = 8.123456,
        altitude = 150.0
    }
}
```

**Features**:
- Links ejected pilots to original player names
- Tracks financial penalties (lost credits)
- Real-time position tracking for rescue coordination
- Handles both landed and ejected pilot scenarios

## Technical Implementation Details

### Function Override Pattern
1. **Backup Original**: Store reference to original function
2. **Implement Enhanced**: Create new function with extended capabilities  
3. **Replace Reference**: Assign new function to original location

### Error Handling
- Comprehensive logging throughout all operations
- Graceful degradation when optional components are unavailable
- Null checks for all external dependencies

### Performance Considerations
- **Caching Strategy**: Zone details and connections are cached after first computation
- **Conditional Processing**: Only processes available data sources
- **Selective Updates**: Players and ejected pilots updated each persistence cycle

### Data Integrity
- **Type Safety**: Explicit type checking and conversion
- **Default Values**: Fallback values for missing data
- **Validation**: Input validation before processing

## External Integration

The enhanced persistence file enables:
- **Web Dashboards**: Real-time mission monitoring
- **Mobile Apps**: Player tracking and mission status
- **Administrative Tools**: Advanced mission management
- **Analytics**: Mission performance and player behavior analysis

## Logging and Debugging

Extensive logging is implemented throughout:
- Initialization phases logged with INFO level
- Data processing logged with INFO/TRACE levels  
- Error conditions logged appropriately
- Performance metrics (counts, processing times)

## Future Considerations

The modular design allows for easy extension:
- Additional data sources can be integrated
- New persistence categories can be added
- External API integration possibilities
- Enhanced filtering and data processing capabilities