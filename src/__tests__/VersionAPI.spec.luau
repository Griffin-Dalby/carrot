local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DevPackages = ReplicatedStorage.carrotTests.bundle
local JestGlobals = require(DevPackages.JestGlobals)

local describe, it = JestGlobals.describe, JestGlobals.it
local expect = JestGlobals.expect

local VersionAPI = require(ReplicatedStorage.carrot.api.Version)

describe("VersionAPI", function()
    it("should correctly convert full strings to objects", function()
        local object = VersionAPI.FromString("1.2.34")

        expect(object.major).toBe(1)
        expect(object.minor).toBe(2)
        expect(object.patch).toBe(34)
    end)

    it("should correctly convert partial strings to objects", function()
        local object_A = VersionAPI.FromString("1.2.X") -- Patch partial, upper X
        local object_B = VersionAPI.FromString("3.x") -- Minor partial, lower X

        expect(object_A.major).toBe(1)
        expect(object_A.minor).toBe(2)
        expect(object_A.patch).toBe(0)

        expect(object_B.major).toBe(3)
        expect(object_B.minor).toBe(0)
        expect(object_B.patch).toBe(0)
    end)

    it("should correctly convert version object to string", function()
        local object = VersionAPI.FromString("1.2.34")
        local string = VersionAPI.ToString(object)

        expect(string).toBe("1.2.34")
    end)
end)