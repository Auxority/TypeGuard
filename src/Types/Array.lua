local Array = {}
Array.__index = Array

local PositiveInteger = require(script.Parent.PositiveInteger)

local Table = require(script.Parent.Table)

function Array.new(validator)
	local self = setmetatable({}, Array)
	self._table = Table.new()
	self._positiveInteger = PositiveInteger.new()
	self._validator = validator

	return self
end

function Array:assert(value)
	self._table:assert(value)
	for key, currentValue in pairs(value) do
		self._positiveInteger:assert(key)
		self._validator:assert(currentValue)
	end
end

return Array
