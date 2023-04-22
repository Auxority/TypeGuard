local Function = require(script.Parent.Function)

type ValidatorArray = {[number]: (value: unknown) -> boolean}

return function(...: ValidatorArray): (value: unknown) -> boolean
    local validators = {...}
    return function(value: unknown): boolean
        local isValid = false

        for _, validator in pairs(validators) do
            if Function(validator) and validator(value) then
                isValid = true
                break
            end
        end

        return isValid
    end
end
