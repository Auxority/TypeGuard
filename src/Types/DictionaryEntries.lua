--!strict

local NonEmptyString = require(script.Parent.NonEmptyString)
local DictionaryEntry = require(script.Parent.DictionaryEntry)
local DictionarySize = require(script.Parent.DictionarySize)
local TableLength = require(script.Parent.TableLength)

return function(schema: DictionarySize.SchemaType): (value: TableLength.TableType) -> boolean
    return function(value: TableLength.TableType): boolean
        local areValidDictionaryKeys = true

        if not DictionarySize(schema)(value) then
            return false
        end

        for key, validator in pairs(schema) do
            if not DictionaryEntry(validator)(key, value) then
                areValidDictionaryKeys = false
                break
            end
        end

        return areValidDictionaryKeys
    end
end
