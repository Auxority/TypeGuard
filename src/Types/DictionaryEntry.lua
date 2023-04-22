local NonEmptyString = require(script.Parent.NonEmptyString)
local Function = require(script.Parent.Function)

return function(validator: unknown): (key: unknown, value: unknown) -> boolean
    return function(key: unknown, value: unknown): boolean
        return NonEmptyString(key) and Function(validator) and validator(value[key])
    end
end
