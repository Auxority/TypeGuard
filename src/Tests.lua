local TypeGuard = require(script.Parent.TypeGuard)

local testValidator1 = TypeGuard.String.new()
testValidator1:assert('')
testValidator1:assert('Hello there!')
print('Test 1 passed!')

local testValidator2 = TypeGuard.NonEmptyString.new()
testValidator2:assert('Hello there!')
print('Test 2 passed!')

local testValidator3 = TypeGuard.Number.new()
testValidator3:assert(-12345)
testValidator3:assert(12345)
print('Test 3 passed!')

local testValidator4 = TypeGuard.PositiveInteger.new()
testValidator4:assert(12345)
print('Test 4 passed!')

local testValidator5 = TypeGuard.Optional.new(
	TypeGuard.PositiveInteger.new()
)
testValidator5:assert(nil)
testValidator5:assert(12345)
print('Test 5 passed!')

local testValidator6 = TypeGuard.Dictionary.new({
	name = TypeGuard.NonEmptyString.new(),
	experience = TypeGuard.PositiveInteger.new(),
	level = TypeGuard.PositiveInteger.new(),
	inventory = TypeGuard.Dictionary.new({
		item1 = TypeGuard.NonEmptyString.new(),
		item2 = TypeGuard.NonEmptyString.new(),
	})
})
testValidator6:assert({
	name = 'Alice',
	experience = 100,
	level = 50,
	inventory = {
		item1 = 'sword',
		item2 = 'shield'
	}
})
print('Test 6 passed!')

local testValidator7 = TypeGuard.Dictionary.new({
	player1 = testValidator6,
	player2 = testValidator6,
})
testValidator7:assert({
	player1 = {
		name = 'Alice',
		experience = 100,
		level = 50,
		inventory = {
			item1 = 'sword',
			item2 = 'shield'
		}
	},
	player2 = {
		name = 'Bob',
		experience = 100,
		level = 50,
		inventory = {
			item1 = 'potion',
			item2 = 'scroll'
		}
	},
})
print('Test 7 passed!')
