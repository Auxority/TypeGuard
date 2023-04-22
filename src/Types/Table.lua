local TableLength = require(script.Parent.TableLength)
local PositiveInteger = require(script.Parent.PositiveInteger)

return function(length: number?): (value: unknown) -> boolean
    return function(value: unknown): boolean
        return typeof(value) == 'table' and (not PositiveInteger(length) or TableLength(length)(value))
    end
end
