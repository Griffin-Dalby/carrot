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

    --[ Version Utilities ]--
    -- Missing: prerelease, intersects

    --[[
        Return the parsed version, or null if it's not valid.
        @param version String version adhering to semver guidelines
        @return `string` Validated version
    ]]
    valid: (version: string) -> string?,

    --[[
        Return the version incremented by the release type (`major`, `minor`, or `patch`), or null if it's not valid.
        @param version String version adhering to semver guidelines
        @param release Semver release type
        @return `string` Incremented version
    ]]
    inc: (version: string, release: ReleaseType) -> string,


    --[[
        Return the major version number
        @param version String/Parsed version adhering to semver guidelines
        @return `number` Major version number, isolated.
    ]]
    major: (version: ConvertibleVersion) -> number,

    --[[
        Return the minor version number
        @param version String/Parsed version adhering to semver guidelines
        @return `number` Minor version number, isolated.
    ]]
    minor: (version: ConvertibleVersion) -> number,

    --[[
        Return the patch version number
        @param version String/Parsed version adhering to semver guidelines
        @return `number` Patch version number, isolated.
    ]]
    patch: (version: ConvertibleVersion) -> number,

    --[[
        Attempt to parse a string as a semantic version, returning either a
        `Version` object, or `null`.

        @param string Version string that will be parsed
        @return `Version`
    ]]
    parse: (version: string) -> Version?,

    --[ Comparison ]--

    --[[
        Compares if v1 is **greater than** v2. `(v1 > v2)`
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `boolean` v1 > v2
    ]]
    gt: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> boolean,

    --[[
        Compares if v1 is **greater than or equal to** v2. `(v1 >- v2)`
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `boolean` v1 >- v2
    ]]
    gte: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> boolean,


    --[[
        Compares if v1 is **less than** v2. `(v1 < v2)`
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `boolean` v1 < v2
    ]]
    lt: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> boolean,

    --[[
        Compares if v1 is **less than or equal to** v2. `(v1 <= v2)`
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `boolean` v1 <= v2
    ]]
    lte: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> boolean,


    --[[
        Compares if v1 is **exactly equal to** v2. `(v1 == v2)`<br>
        This is true if they're logically equivalent, even if they're not the exact same string.
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `boolean` v1 == v2
    ]]
    eq: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> boolean,
    
    --[[
        Compares if v1 is **not equal to** v2. `(v1 != v2)`<br>
        This is true if they're both not logically equivalent, even if they're not the exact same string.
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `boolean` v1 != v2
    ]]
    neq: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> boolean,


    --[[
        Pass in a comparison string, and it'll call the corresponding comparison
        function. Throws if an invalid comparison string is provided.<br>
        `"==="` and `"!=="` do simple string comparison, but are included for completeness.
        @param v1 First version of comparison
        @param comp Comparator to use
        @param v2 Second version of comparison
        @return `boolean` Result of comparison
    ]]
    cmp: (v1: ConvertibleVersion, comp: Comparator, v2: ConvertibleVersion) -> boolean,


    --[[
        Return `0` if `v1 == v2`, `1` if `v1` is greater, or `-1` if `v2` is greater.
        Unlike a JavaScript Array.sort comparator, this numeric result cannot be passed directly
        to Luau `table.sort()`, whose comparator must return a boolean. Use `lt` as the sort
        comparator for ascending semantic-version order (for example, `table.sort(versions, lt)`).
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `number` Product of comparison
    ]]
    compare: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> number,

    --[[
        The reserse of compare. Comes with the same limitations.
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `number` Product of comparison
    ]]
    rcompare: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> number,

    --[[
        Returns difference between two versions by the release type (`major`, `minor`, or `patch`),
        or `null` if the versions are the same.
        @param v1 First version of comparison
        @param v2 Second version of comparison
        @return `ReleaseType` Highest place that's changed
    ]]
    diff: (v1: ConvertibleVersion, v2: ConvertibleVersion) -> ReleaseType,

    --[ Comparators ]--
    -- Missing: intersects

    --[ Ranges ]--
    -- Missing: intersects

    --[[
        Return the valid range or null if it's not valid
        @param range Range string adhering to semver guidelines
        @return `string` Validated range 
    ]]
    validRange: (range: string) -> string,

    --[[
        Return true if the version satisfies the range.
        @param version Version to check against range
        @param range Range to validate with
        @return `boolean` If the version satisfies the range
    ]]
    satisfies: (version: ConvertibleVersion, range: string) -> boolean,


    --[[
        Return the highest version in the list that satisfies the range, or
        `null` if none of them do.
        @param versions Table of versions to check against range
        @param range Range to validate with
        @return `string` Highest version that satisfies the range
    ]]
    maxSatisfying: (versions: {ConvertibleVersion}, range: string) -> string?,

    --[[
        Return the lowest version in the list that satisfies the range, or
        `null` if none of them do.
        @param versions Table of versions to check against range
        @param range Range to validate with
        @return `string` Lowest version that satisfies the range
    ]]
    minSatisfying: (versions: {ConvertibleVersion}, range: string) -> string?,


    --[[
        Return the lowest version that can possibly match the given range.
        @param range Range to check for version
        @return `string` Lowest version that can match the range
    ]]
    minVersion: (range: string) -> string,


    --[[
        Return `true` if version is **greater than** all the versions possible
        in the range.
        @param version Version to check against range
        @param range Range to validate with
        @return `boolean` If version is greater than range versions
    ]]
    gtr: (version: ConvertibleVersion, range: string) -> boolean,

    --[[
        Return `true` if version is **less than** all the versions possible
        in the range.
        @param version Version to check against range
        @param range Range to validate with
        @return `boolean` If version is less than range versions
    ]]
    ltr: (version: ConvertibleVersion, range: string) -> boolean,

    --[[
        Return `true` if the version is **outside** the bounds of the range in
        either the high or low direction. The `hilo` argument must be either
        the string `'>'` or `'<'`. (This is the function called by `gtr` and `ltr`)
        @param version Version to check against range
        @param range Range to validate with
        @param hilo Direction to check (hi or lo)
        @return `boolean` If version is outside of bounds
    ]]
    outside: (version: ConvertibleVersion, range: string, hilo: '>'|'<') -> boolean,

    --[ Coercion ]--

    --[[
        Coerces a string to semver if possible.

        Aims to provide a very forgiving translation of a non-semver string
        to semver. It looks for the first digit in a string, and consumes
        all remaining characters which satisfy at least a partial semver, up
        to the maximum permitted length (256 characters).

        Maximum length for any semver component considered for coercion is
        16 characters; longer components will be ignored (
        `10000000000000000.2.3.4` becomes `2.3.4`).

        @param version Version to attempt coercion
        @return `string` Coerced version
    ]]
    coerce: (version: string) -> string

}

--#endregion

--[[ API ]]--
--#region

--[ Version ]--
--#region

export type VersionApi = {

    --[[ STRING CONSTRUCTORS ]]--
    --#region

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
    ToString: (version: Version) -> string,

    --#endregion

    --[[ HANDLING METHODS ]]--
    --#region

    BumpAt: (version: Version, place: number) -> Version

    --#endregion

}

--#endregion

--[ Range ]--
--#region

export type RangeApi = {

    --[[ STRING CONSTRUCTORS ]]--
    --#region

    --[[
        Deconstructs a semver range into a Range object

        @param range Raw semver range string
        @return Range object
    ]]
    FromString: (range: string) -> ()

    --#endregion

}

--#endregion

--#endregion

--[[ PRIMITIVES ]]--
--#region

--[ Core ]--
--#region

--[=[
    @type ReleaseType "major"|"minor"|"patch
    @within CarrotCore

    Defines the specific release types defined within the version string.
]=]
export type ReleaseType = "major" | "minor" | "patch"

--[=[
    @type Comparator ">"|">="|"<"|"<="|"=="|"!="
    @within CarrotCore

    Defines any comparator that can be used in a free comparison function, such
    as `cmp(v1, Compartor, v2)`, and it will call the correlating comparison.

    `"==="` and `"!=="` do simple string comparison, but are included for completeness.
]=]
export type Comparator = ">"|">="|"<"|"<="|"=="|"!="|
                                          "==="|"!==" -- Provided for completeness

--#endregion

--[ Version ]--
--#region

--[=[
    @type Version {major: number, minor: number, patch: number}
    @within VersionApi

    Primitive datatype that represents a deconstructed version, split
    up into their respective components.
]=]
export type Version = { major: number, minor: number, patch: number }

--[=[
    @type ConvertibleVersion Version | string
    @within VersionApi

    Abstracted datatype allowing you to either pass a deconstructed
    Version, or a semver string that will then be deconstructed.
]=]
export type ConvertibleVersion = string | Version

--#endregion

--[ Range ]--
--#region

--[=[
    @type Range {lo: Version, hi: Version?, source: string}
    @within RangeApi

    Abstracted datatype that represents a deconstructed range, including
    a low & high (if provided) version, and the source string it came from.
]=]
export type Range = {lo: Version, hi: Version?, source: string}

--#endregion

--#endregion

return t