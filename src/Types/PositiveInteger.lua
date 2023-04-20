local PositiveInteger = {}
PositiveInteger.__index = PositiveInteger

local Integer = require(script.Parent.Integer)

local ASSERT_POSITIVE_ERROR = 'The given integer: "%s" is not positive.'

function PositiveInteger.new()
	local self = setmetatable({}, PositiveInteger)
	self._integer = Integer.new()
	
	return self
end

function PositiveInteger:assert(value)
	self._integer:assert(value)
	assert(
		value > 0,
		string.format(ASSERT_POSITIVE_ERROR, value)
	)
end

return PositiveInteger
