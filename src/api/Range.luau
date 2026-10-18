--[[
    Carrot Range API
    
    Provides logic that can parse a semver range & run comparisons on
    multiple range objects.

    A "range" is a semver string that includes a wildcard, e.g.
        - "^1.2.3"
        - "~3.2"
        - "^1.x"
--]]

--[[ SERVICES ]]--
--#region


--#endregion

--[[ IMPORTS ]]--
--#region


--#endregion

--[[ CONSTANTS ]]--
--#region


--#endregion

--[[ FUNCTIONS ]]--
--#region


--#endregion

--[[ TYPE DEFINITION ]]--
--#region

--[=[
    @class RangeApi

    Responsible for translating semver range strings into Range objects, and
    handling comparisons between different Ranges to determine version
    compatability.
]=]
export type Range = {

    FromString: (range: string) -> number

}

--#endregion

--[[ UTILITY OBJECT ]]--
--#region

local Range = {} :: Range

function Range.Multiply(n: number, m: number)
    return n*m
end

--#endregion

return Range