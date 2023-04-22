# TypeGuard

Have you ever encountered a situation where Luau types just didn't cut it?
I have, especially when validating RemoteEvent data that has been sent by a client.
But this could also be useful to make 100% sure that the data you are about to write to your datastore matches a predefined schema.

# Download

If you want to try it out for yourself, you can download the module [here](https://www.roblox.com/library/13194020596/TypeGuard)

# Showcase

```lua
local tg = require(script.Parent.TypeGuard)

print(tg.PositiveInteger(1234)) -- Expected output: true
print(tg.PositiveInteger(-1234)) -- Expected output: false

local nullableNonEmptyString = tg.Optional(tg.NonEmptyString)

print(nullableNonEmptyString('Hello!')) -- Expected output: true
print(nullableNonEmptyString(nil)) -- Expected output: true
print(nullableNonEmptyString('')) -- Expected output: false

local itemSchema = tg.Dictionary({
    id = tg.NonEmptyString,
    name = tg.NonEmptyString,
    value = tg.Number,
})

local validationSchema = tg.Dictionary({
    level = tg.PositiveInteger,
    cash = tg.Number,
    inventory = tg.Array(itemSchema),
})

print(validationSchema({
    level = 16,
    cash = 12.15,
    inventory = {
        {
            id = 'gold-sword-a65a4fb4c',
            name = 'Gold Sword',
            value = 50.86,
        },
        {
            id = 'iron-sword-b75ce5f3a',
            name = 'Iron Sword',
            value = 5.39,
        },
    },
})) -- Expected output: true
```

# Usage

An example of how to use the module can be found in the Tests script provided in the model.
Feel free to add your own types or suggest them here.

# GitHub

If you just wanna take a look at the code, feel free to do so.
You can find the GitHub repository [here](https://github.com/Auxority/TypeGuard)
