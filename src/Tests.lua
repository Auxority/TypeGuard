local tg = require(script.Parent.TypeGuard)

local validators = {
    tg.Dictionary({
        level = tg.PositiveInteger,
        experience = tg.PositiveInteger,
        banned_until = tg.Optional(tg.PositiveInteger),
        is_admin = tg.Boolean,
        is_developer = tg.Boolean,
        inventory = tg.Dictionary({
            item1 = tg.NonEmptyString,
            item2 = tg.NonEmptyString,
        }),
        accessories = tg.Array(tg.NonEmptyString),
        x = tg.Number,
        y = tg.Number,
        z = tg.Number,
        damage_effect = tg.Integer,
        health_effect = tg.Integer,
    }),
}

local values = {
    {
        level = 123,
        experience = 12345,
        banned_until = nil,
        is_admin = false,
        is_developer = true,
        inventory = {
            item1 = 'sword',
            item2 = 'shield',
        },
        accessories = {
            'health potion',
            'speed potion',
        },
        x = -123.141,
        y = 0,
        z = 123.141,
        damage_effect = -25,
        health_effect = 10,
    },
}

for i, validator in pairs(validators) do
    assert(validator(values[i]), string.format('Test %s failed!', i))
    print(string.format('Test %s passed! (%s/%s)', i, i, #validators))
end
