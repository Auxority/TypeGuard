--!strict

local Table = require(script.Parent.Table)
local ArrayEntries = require(script.Parent.ArrayEntries)

return function(validator: (value: unknown) -> boolean, length: number?): (value: unknown) -> boolean
    return function(value: unknown): boolean
        return Table(length)(value) and ArrayEntries(validator)(value)
    end
end
