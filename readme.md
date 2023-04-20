# TypeGuard

Have you ever encountered a situation where Luau types just didn't cut it?
I have, especially when validating RemoteEvent data that has been sent by a client.
But this could also be useful to make 100% sure that the data you are about to write to your datastore matches a predefined schema.

# Download

If you want to try it out for yourself, you can download the module [here](https://www.roblox.com/library/13194020596/TypeGuard)

# Showcase

```lua
local TypeGuard = require(script.TypeGuard)

local testValidator = TypeGuard.Dictionary.new({
	name = TypeGuard.NonEmptyString.new(),
	experience = TypeGuard.PositiveInteger.new(),
	level = TypeGuard.PositiveInteger.new(),
	inventory = TypeGuard.Dictionary.new({
		item1 = TypeGuard.NonEmptyString.new(),
		item2 = TypeGuard.NonEmptyString.new(),
	})
})

testValidator:assert({
	name = 'Alice',
	experience = 100,
	level = 50,
	inventory = {
		item1 = 'sword',
		item2 = 'shield'
	}
})

print('Test has passed without errors!')
```

Expected output:

```
Test has passed without errors!
```

# Usage

An example of how to use the module can be found in the Tests script provided in the model.
Feel free to add your own types or suggest them here.

# GitHub

If you just wanna take a look at the code, feel free to do so.
You can find the GitHub repository [here](https://github.com/Auxority/TypeGuard)