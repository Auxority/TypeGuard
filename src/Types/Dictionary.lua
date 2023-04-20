local Dictionary = {}
Dictionary.__index = Dictionary

local Table = require(script.Parent.Table)
local NonEmptyString = require(script.Parent.NonEmptyString)
local Optional = require(script.Parent.Optional)

local ASSERT_SIZE_ERROR = 'The given dictionary size: "%s" is not equal to the size of the schema: "%s".'

function Dictionary.new(schema)
	local self = setmetatable({}, Dictionary)
	self._table = Table.new()
	self._nonEmptyString = NonEmptyString.new()
	self._schema = schema

	return self
end

function Dictionary:assert(value)
	self._table:assert(value)
	self:assertSize(value)

	for key, schema in pairs(self._schema) do
		self._nonEmptyString:assert(key)
		schema:assert(value[key])
	end
end

function Dictionary:assertSize(value)
	local schemaSize = 0
	for _ in pairs(self._schema) do
		schemaSize += 1
	end
	
	local valueSize = 0
	for _ in pairs(value) do
		valueSize += 1
	end

	assert(
		schemaSize == valueSize,
		string.format(ASSERT_SIZE_ERROR, valueSize, schemaSize)
	)
end

return Dictionary
