local Number = require(script.Parent.Number)

return function(value: unknown): boolean
    return Number(value) and math.floor(value) == value
end
