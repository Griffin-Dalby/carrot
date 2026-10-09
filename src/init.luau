--[[
    Carrot Core
    
    Entry-point for all carrot framework usage, aggregates all systems
    into a singular, clean interface that allows the developer to pick
    which sub-system they want to interact with.

    Copyright 2026 Griffin Dalby
    "Carrot" is licensed under MIT
--]]

--[[ SERVICES ]]--
--#region


--#endregion

--[[ IMPORTS ]]--
--#region

local Definitions = require(script.definitions)

--#endregion

--[[ CONSTANTS ]]--
--#region


--#endregion

--[[ FUNCTIONS ]]--
--#region


--#endregion

--[[ TYPE DEFINITION ]]--
--#region

export type CarrotCore = Definitions.CarrotCore
export type Version = Definitions.Version

--#endregion

--[[ UTILITY OBJECT ]]--
--#region

local Carrot = {} :: CarrotCore

--[=[
    @function parse
    @within CarrotCore

    Parses a version string, and deconstructs it into a format usable
    with the framework.

    @param version Version
    @return Version
]=]
function Carrot.parse(version)
    
end

--[=[
    @function satisfies
    @within CarrotCore

    Checks if a specific version fits a semver range requirement

    @param version ConvertibleVersion
    @param requirement string
    @return boolean
]=]
function Carrot.satisfies(version, requirement)

end

--[=[
    @function format
    @within CarrotCore

    Reconstructs a Version table back into a semver string

    @param version Version
    @return string
]=]
function Carrot.format(version)

end

--#endregion

return Carrot