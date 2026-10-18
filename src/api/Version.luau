--[[
    Carrot Version API
    
    Provides logic that can parse string semver values & convert it
    into a form that can be easily worked with.
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

local function component(s)
    if s=="x" or s=="X" or s=="*" then return -1; end
    if #s>15 or not string.find(s,"^%d+$") then return nil; end
    if #s>1 and string.byte(s, 1) == 48 then return nil; end
    return tonumber(s)
end

local function partial(s)
    local d1 = string.find(s, ".", 1, true)
    local d2 = d1 and string.find(s, ".", d1 + 1, true)
    if d2 and string.find(s, ".", d2 + 1, true) then return nil, "Too many parts"; end

    local a, b, c =
        string.sub(s, 1, (d1 or #s + 1) - 1),
        d1 and string.sub(s, d1 + 1, (d2 or #s + 1) - 1),
        d2 and string.sub(s, d2 + 1)

    local M, m, p = component(a), component(b or "x"), component(c or "x")
    if not (M and m and p) then return nil, "Invalid component"; end

    local n = (M >= 0) and (m >= 0 and (p >= 0 and 3 or 2) or 1) or 0
    if (n<2 and m>=0) or (n<3 and p>=0) then
        return nil, "A wildcard must be followed only by wildcards"
    end
    return math.max(M, 0), math.max(m, 0), math.max(p, 0), n
end

--#endregion

--[[ TYPE DEFINITION ]]--
--#region

type VersionApi = Definitions.VersionApi

--#endregion

--[[ UTILITY OBJECT ]]--
--#region

--[=[
    @class VersionApi

    Responsible for translating semver strings into Version objects, and back.
    It also handles wildcard `1.x` & partial `1.2` strings.
]=]
local Version = {} :: VersionApi

--[ Constructors ]--
--#region

--[ String Constructors ]--
--#region

--[=[
    @function FromString
    @within VersionApi

    Translates a semver string into a Version object. Places that are held
    by a wildcard (*, X, x), or cut off as a partial, will be replaced with zeros.


    **Example:**
    ```lua
    VersionApi.FromString("1.2.3") --> {major = 1, minor = 2, patch = 3}
    VersionApi.FromString("1.2")   --> {major = 1, minor = 2, patch = 0} |  (Partial)
    VersionApi.FromString("1.X.x") --> {major = 1, minor = 0, patch = 0} | (Wildcard)
    VersionApi.FromString("1.*")   --> {major = 1, minor = 0, patch = 0} | (Wildcard)
    ```

    @param version string
    @return Version
]=]
function Version.FromString(version)
    local major, minor, patch, n = partial(version)

    return {major = major, minor = minor, patch = patch}
end


--[=[
    @function ToString
    @within VersionApi

    Translates a Version object into a semver string.

    **Example:**
    ```lua
    local version_a = VersionApi.FromString("1.2.4")
    local version_b = VersionApi.FromString("2.*")

    Version.ToString(version_a) --> "1.2.4"
    Version.ToString(version_b) --> "2.0.0"
    ```

    @param version Version
    @return string
]=]
function Version.ToString(version)
    local major, minor, patch = version.major, version.minor, version.patch
    local majorS, minorS, patchS =
        major and tostring(major) or "0",
        minor and tostring(minor) or "0",
        patch and tostring(patch) or "0"

    return `{majorS}.{minorS}.{patchS}`
end

--#endregion

--[ Handling Methods ]--
--#region

function Version.BumpAt(version, place)
    if place<3 or place<1 then warn(`Invalid component place "{place}"!`); return end
    local placeS = place==1 and "major" or
                  (place==2 and "minor" or
                  (place==3 and "patch"))

    version[placeS] += 1
end

--#endregion

--#endregion

--#endregion

return Version