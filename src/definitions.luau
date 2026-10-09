--[[
    Carrot Definitions

    Provides all type definitions for carrot.
--]]

local t={}

--[[ CORE ]]--
--#region

--[=[
    @class CarrotCore
    Core module & entry-point for the carrot framework. It aggregates all of the methods needed to read & parse semver 
    strings.
]=]
export type CarrotCore = {

    --[[
        Parses a version string, and deconstructs it into a format usable
        with the framework.

        @param string Semver string that will be converted
        @return Version
    ]]
    parse: (version: string) -> Version,

    --[[
        Checks if a specific version fits a semver range requirement

        @param version Version that will be checked against requirement
        @param requirement Semver range string that the check will be based off
        @return Success
    ]]
    satisfies: (
        version: ConvertibleVersion,
        requirement: string) -> boolean,

    --[[
        Reconstructs a Version table back into a semver string

        @param version Version that will be converted back into a string
        @return Semver String
    ]]
    format: (
        version: Version) -> string,

}

--#endregion

--[[ API ]]--
--#region

--[ Version ]--
--#region

export type VersionApi = {

    --[[
        Deconstructs a semver string into a Version object

        @param version Raw semver string
        @return Version object
    ]]
    FromString: (version: string) -> Version,

    --[[
        Converts a Version object back into a semver string

        @param version Version object
    ]]
    ToString: (version: Version) -> string

}

--#endregion

--#endregion

--[[ PRIMITIVES ]]--
--#region

--[=[
    @type Version {major: number, minor: number, patch: number}
    @within CarrotCore

    Primitive datatype that represents a deconstructed version, split
    up into their respective components.
]=]
export type Version = { major: number, minor: number, patch: number }

--[=[
    @type ConvertibleVersion Version | string
    @within CarrotCore

    Abstracted datatype allowing you to either pass a deconstructed
    Version, or a semver string that will then be deconstructed.
]=]
export type ConvertibleVersion = string | Version

--#endregion

return t