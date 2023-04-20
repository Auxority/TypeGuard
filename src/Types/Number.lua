local Number = {}
Number.__index = Number

local ASSERT_NUMBER_ERROR = 'The given value: "%s" is not a number.'

function Number.new()
	local self = setmetatable({}, Number)

	return self
end

function Number:assert(value)
	assert(
		typeof(value) == 'number',
		string.format(ASSERT_NUMBER_ERROR, tostring(value))
	)
end

return Number
