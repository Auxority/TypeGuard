local Integer = {}
Integer.__index = Integer

local Number = require(script.Parent.Number)

local INTEGER_ASSERT_ERROR = 'The given number: "%s" is not an integer.'

function Integer.new()
	local self = setmetatable({}, Integer)
	self._number = Number.new()
	
	return self
end

function Integer:assert(value)
	self._number:assert(value)
	assert(
		math.floor(value) == value,
		string.format(INTEGER_ASSERT_ERROR, value)
	)
end

return Integer
