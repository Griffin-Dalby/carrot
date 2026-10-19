local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DevPackages = ReplicatedStorage.carrotTests.bundle
local JestGlobals = require(DevPackages.JestGlobals)

local describe, it = JestGlobals.describe, JestGlobals.it
local expect = JestGlobals.expect

local RangeAPI = require(ReplicatedStorage.carrot.api.Range)

describe("RangeAPI", function()
    it("Test", function()
        expect(true).toBe(false)
    end)
end)