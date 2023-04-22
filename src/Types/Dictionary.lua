local Table = require(script.Parent.Table)
local DictionarySize = require(script.Parent.DictionarySize)
local DictionaryEntries = require(script.Parent.DictionaryEntries)

return function(schema: DictionarySize.SchemaType): (value: unknown) -> boolean
    return function(value: unknown): boolean
        return Table()(value) and DictionaryEntries(schema)(value)
    end
end
