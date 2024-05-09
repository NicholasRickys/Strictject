-- Strictject © 2024 by Saxashitter is licensed under CC BY-SA 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by-sa/4.0/

local strictject = {}

function new(class, ...)
	local _new = {}
	local new = {}

	for _,i in pairs(class) do
		_new[_] = i
	end

	_new:new(...)

	setmetatable(new, {
		__index = _new,
		__newindex = function(self, key, value)
			if _new[key] == nil then
				error "Can't add variables to objects!"
			end
			if value == nil then
				error "Can't change values to nil in objects!"
			end
			if type(value) ~= type(_new[key]) then
				error "Can't change type of value in objects!"
			end
		end
	})

	return new
end

function extend(class)
	local new = {}

	for _,i in pairs(class) do
		new[_] = i
	end

	new.__super = class
	return new
end

function strictject:new(x, y)
	self.x = x
	self.y = y

	return self
end

return strictject