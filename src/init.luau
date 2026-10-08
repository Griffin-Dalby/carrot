--[[
    Carrot Core
    
    Entry-point for all carrot framework usage, aggregates all systems
    into a singular, clean interface that allows the developer to pick
    which sub-system they want to interact with.

    "Carrot" is licensed under MIT
    Copyright 2026 Griffin Dalby
--]]

--[[ SERVICES ]]--
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

export type Carrot = {

    Multiply: (n: number, m: number) -> number

}

--#endregion

--[[ UTILITY OBJECT ]]--
--#region

local Carrot = {} :: Carrot

function Carrot.Multiply(n: number, m: number)
    return n*m
end

--#endregion

return Carrot