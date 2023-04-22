--!strict

local PositiveInteger = require(script.Parent.PositiveInteger)
local Function = require(script.Parent.Function)

return function(validator: (value: unknown) -> boolean): (key: unknown, value: unknown) -> boolean
    return function(key: unknown, value: unknown): boolean
        return PositiveInteger(key) and Function(validator) and validator(value)
    end
end
