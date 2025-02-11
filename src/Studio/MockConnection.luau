--
type connectionType = { Connected: boolean }

local Connection = {}

local CLASS_METATABLE = { __index = Connection }

function CLASS_METATABLE:__tostring()
	return "ClientConnection"
end

function Connection:Disconnect()
	self.Connected = nil

	table.clear(self)
	setmetatable(self, nil)
end

function Connection:Destroy()
	self:Disconnect()
end

return function()
	local self = setmetatable({
		Connected = true,

		_disconnectCallback = function() end,
	}, CLASS_METATABLE)

	return self :: unknown
end
