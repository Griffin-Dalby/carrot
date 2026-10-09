--[[
    Carrot Version API
    
    ClassDescription
--]]

--[[ IMPORTS ]]--
--#region

local CarrotRoot = script.Parent.Parent
local Definitions = require(CarrotRoot.definitions)

--#endregion

--[[ CONSTANTS ]]--
--#region


--#endregion

--[[ FUNCTIONS ]]--
--#region


--#endregion

--[[ TYPE DEFINITION ]]--
--#region

type VersionApi = Definitions.VersionApi

--#endregion

--[[ UTILITY OBJECT ]]--
--#region

local Version = {} :: VersionApi

--[ Constructors ]--
--#region

function Version.FromString(version)
    local wildcard = version:sub(1,1)
    local wildcardPresent = wildcard=="~" or wildcard=="^"
    if wildcardPresent then version = version:sub(2); end

    local major, minor, patch = table.unpack(version:split("."))
    major = major and tonumber(major) or nil
    minor = minor and tonumber(minor) or 0
    patch = patch and tonumber(patch) or 0

    

    return {major = major, minor = minor, patch = patch}
end

function Version.ToString(version)
    local major, minor, patch = version.major, version.minor, version.patch
end

--#endregion

--#endregion

return Version