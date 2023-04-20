local NonEmptyString = {}
NonEmptyString.__index = NonEmptyString

local STRING_LENGTH_ERROR = 'The given string: "%s" does not contain any characters.'

local String = require(script.Parent.String)

function NonEmptyString.new()
	local self = setmetatable({}, NonEmptyString)
	self._string = String.new()
	
	return self
end

function NonEmptyString:assert(value)
	self._string:assert(value)
	assert(
		string.len(value) > 0,
		string.format(STRING_LENGTH_ERROR, value)
	)
end

return NonEmptyString
