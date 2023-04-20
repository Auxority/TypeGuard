local Table = {}
Table.__index = Table

local ASSERT_SIZE_ERROR = 'The given value: "%s" is not a table.'

function Table.new()
	local self = setmetatable({}, Table)

	return self
end

function Table:assert(value)
	assert(
		typeof(value) == 'table',
		string.format(ASSERT_SIZE_ERROR, tostring(value))
	)
end

return Table
