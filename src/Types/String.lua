local String = {}
String.__index = String

local STRING_ASSERT_ERROR = 'The given value: "%s" is not a string.'

function String.new()
	local self = setmetatable({}, String)
	
	return self
end

function String:assert(value)
	assert(
		typeof(value) == 'string',
		string.format(STRING_ASSERT_ERROR, tostring(value))
	)
end

return String
