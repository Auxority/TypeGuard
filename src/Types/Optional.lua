local Optional = {}
Optional.__index = Optional

function Optional.new(validator)
	local self = setmetatable({}, Optional)
	self._validator = validator
	
	return self
end

function Optional:assert(value)
	if value ~= nil then
		self._validator:assert(value)
	end
end

return Optional
