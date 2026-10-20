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

--[ Version Utilities ]--
--#region

--[=[
    @function valid
    @within CarrotCore
    @tag Version

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#functions)
    
    Return the parsed version, or null if it's not valid.

    @param version String
    @return string
]=]
function Carrot.valid(version)

end

--[=[
    @function inc
    @within CarrotCore
    @tag Version

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#functions)

    Return the version incremented by the release type (`major`, `minor`, or `patch`), or null if it's not valid.

    @param version string
    @param release ReleaseType
    @return string
]=]
function Carrot.inc(version, release)

end


--[=[
    @function major
    @within CarrotCore
    @tag Version

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#functions)

    Return the major version number

    @param version string
    @return number
]=]
function Carrot.major(version)

end

--[=[
    @function minor
    @within CarrotCore
    @tag Version

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#functions)

    Return the minor version number

    @param version string
    @return number
]=]
function Carrot.minor(version)

end

--[=[
    @function patch
    @within CarrotCore
    @tag Version

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#functions)

    Return the patch version number

    @param version string
    @return number
]=]
function Carrot.patch(version)

end


--[=[
    @function parse
    @within CarrotCore
    @tag Version

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#functions)
    
    Attempt to parse a string as a semantic version, returning either a `Version`
    object, or `null`.

    @param version string
    @return Version?
]=]
function Carrot.parse(version)

end

--#endregion

--[ Comparison ]--
--#region

--[=[
    @function gt
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)

    Compares if v1 is **greater than** v2. `(v1 > v2)`

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.gt(v1, v2)

end

--[=[
    @function gte
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)
    
    Compares if v1 is **greater than or equal to** v2. `(v1 >= v2)`

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.gte(v1, v2)

end

--[=[
    @function lt
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)
    
    Compares if v1 is **less than** v2. `(v1 < v2)`

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.lt(v1, v2)

end

--[=[
    @function lte
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)
    
    Compares if v1 is **less than or equal to** v2. `(v1 <= v2)`

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.lte(v1, v2)

end

--[=[
    @function eq
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)
    
    Compares if v1 is **equal to** v2. `(v1 == v2)`

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.eq(v1, v2)

end

--[=[
    @function neq
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)
    
    Compares if v1 is **not equal to** v2. `(v1 != v2)`

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.neq(v1, v2)

end

--[=[
    @function cmp
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)

    Pass in a comparison string, and it'll call the corresponding comparison
    function. Throws if an invalid comparison string is provided.<br>
    `"==="` and `"!=="` do simple string comparison, but are included for completeness.

    @param v1 ConvertibleVersion
    @param comp Comparator
    @param v2 ConvertibleVersion
    @return boolean
]=]
function Carrot.cmp(v1, comp, v2)

end

--[=[
    @function compare
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)

    Return `0` if `v1 == v2`, `1` if `v1` is greater, or `-1` if `v2` is greater.
    Unlike a JavaScript Array.sort comparator, this numeric result cannot be passed directly
    to Luau `table.sort()`, whose comparator must return a boolean. Use `lt` as the sort
    comparator for ascending semantic-version order (for example, `table.sort(versions, lt)`).

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return number
]=]
function Carrot.compare(v1, v2)

end

--[=[
    @function rcompare
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)

    The reserse of compare. Comes with the same limitations.

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return number
]=]
function Carrot.rcompare(v1, v2)

end

--[=[
    @function diff
    @within CarrotCore
    @tag Comparison

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#comparison)

    Returns difference between two versions by the release type (`major`, `minor`, or `patch`),
    or `null` if the versions are the same.

    @param v1 ConvertibleVersion
    @param v2 ConvertibleVersion
    @return ReleaseType
]=]
function Carrot.diff(v1, v2)

end

--#endregion

--[ Ranges ]--
--#region

--[=[
    @function validRange
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return the valid range, or null if it's not valid.

    @param range string
    @return string
]=]
function Carrot.validRange(range)

end

--[=[
    @function satisfies
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return true if the version satisfies the range.

    @param version ConvertibleVersion
    @param range string
    @return boolean
]=]
function Carrot.satisfies(version, range)

end

--[=[
    @function maxSatisfying
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return the highest version in the list that satisfies the range, or
    `null` if none of them do.

    @param version {ConvertibleVersion}
    @param range string
    @return string?
]=]
function Carrot.maxSatisfying(versions, range)

end

--[=[
    @function minSatisfying
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return the lowest version in the list that satisfies the range, or
    `null` if none of them do.

    @param versions {ConvertibleVersion}
    @param range string
    @return string?
]=]
function Carrot.minSatisfying(versions, range)

end

--[=[
    @function minVersion
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return the lowest version that can possibly match the given range.

    @param range string
    @return string
]=]
function Carrot.minVersion(range)

end

--[=[
    @function gtr
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return `true` if version is **greater than** all the versions possible in the range.

    @param version ConvertibleVersion
    @param range string
    @return boolean
]=]
function Carrot.gtr(version, range)

end

--[=[
    @function ltr
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)
    
    return `true` if version is **less than** all the versions possible in the range.

    @param version ConvertibleVersion
    @param range string
    @return boolean
]=]
function Carrot.ltr(version, range)

end

--[=[
    @function outside
    @within CarrotCore
    @tag Ranges

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#ranges-1)

    Return `true` if the version is **outside** the bounds of the range in
    either the high or low direction. The `hilo` argument must be either
    the string `'>'` or `'<'`. (This is the function called by `gtr` and `ltr`)

    @param version ConvertibleVersion
    @param range string
    @param hilo '>'|'<'
    @return boolean
]=]
function Carrot.outside(version, range)

end

--#endregion

--[ Coercion ]--
--#region

--[=[
    @function coerce
    @within CarrotCore
    @tag Coercion

    [View this on npm semver docs](https://docs.npmjs.com/cli/v6/using-npm/semver#coercion)

    Coerces a string to semver if possible.

    Aims to provide a very forgiving translation of a non-semver string
    to semver. It looks for the first digit in a string, and consumes
    all remaining characters which satisfy at least a partial semver, up
    to the maximum permitted length (256 characters).

    Maximum length for any semver component considered for coercion is
    16 characters; longer components will be ignored (
    `10000000000000000.2.3.4` becomes `2.3.4`).

    @param version string
    @return string
]=]

function Carrot.coerce(version)

end

--#endregion

--#endregion

return Carrot