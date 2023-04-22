local Integer = require(script.Parent.Integer)

return function(value: unknown): boolean
    return Integer(value) and value > 0
end
