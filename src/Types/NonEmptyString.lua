local String = require(script.Parent.String)

return function(value: unknown): boolean
    return String(value) and string.len(value) > 0
end
