local Boolean = {}
Boolean.__index = Boolean

local BOOLEAN_ASSERT_ERROR = 'The given value: "%s" is not a boolean.'

function Boolean.new()
	local self = setmetatable({}, Boolean)

	return self
end

function Boolean:assert(value)
	assert(
		typeof(value) == 'boolean',
		string.format(BOOLEAN_ASSERT_ERROR, value)
	)
end

return Boolean
