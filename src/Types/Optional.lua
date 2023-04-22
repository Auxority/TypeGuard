--!strict

local Function = require(script.Parent.Function)

return function(validator: (value: unknown) -> boolean): (value: unknown) -> boolean
    return function(value: unknown): boolean
        return value == nil or (Function(validator) and validator(value))
    end
end
