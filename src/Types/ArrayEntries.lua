local ArrayEntry = require(script.Parent.ArrayEntry)

return function(validator: (value: unknown) -> boolean): (value: unknown) -> boolean
    return function(value: unknown): boolean
        local areValidEntries = true

        for key, currentValue in pairs(value) do
            if not ArrayEntry(validator)(key, currentValue) then
                areValidEntries = false
                break
            end
        end

        return areValidEntries
    end
end
