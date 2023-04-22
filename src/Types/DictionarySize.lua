export type SchemaType = {[string]: (value: unknown) -> boolean}

return function(schema: SchemaType): (value: unknown) -> boolean
    return function(value: unknown): boolean
        local schemaSize = 0
        for i, v in pairs(schema) do
            schemaSize += 1
        end

        local valueSize = 0
        for _ in pairs(value) do
            valueSize += 1
        end

        return schemaSize >= valueSize
    end
end
