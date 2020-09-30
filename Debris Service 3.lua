local RunService = game:GetService("RunService")

local Items = {}

local Types = {
	["Instance"] = "Destroy",
	["Table"] = "Remove",
	["RBXScriptConnection"] = "Disconnect",
}

local function RemoveItem(Part)
	local Info = Items[Part]
	
	if Info[4] == "Instance" then
		Part:Destroy()
	elseif Info[4] == "RBXScriptConnection" then
		Info[1]:Disconnect()
	else
		for i, Data in ipairs(Part[1]) do
			table.remove(Part[1], i)
		end
		Info[Part] = nil
	end
	
	Items[Part] = nil
end

local function AddItem(Part, Lifetime)
	local Type = typeof(Part)
	
	assert(Types[Type])
	assert(typeof(Lifetime) == "number")
	
	Items[Part] = {Part, Lifetime, tick(), Type}
end

local Debris3 = {}

function Debris3:AddItem(Part, Lifetime)
	AddItem(Part, Lifetime)
end

function Debris3:AddItems(Parts, Lifetimes)
	
	for i, Item in ipairs(Parts) do
		AddItem(Item, Lifetimes[i])
	end
	
end

function Debris3:GetAllDebris()
	return Items
end

function Debris3:GetDebris(Item)
	return Items[Item]
end

RunService.Heartbeat:Connect(function()
	for Part, Info in next, Items do
		
		if tick() -(Info[3] + Info[2]) > 0 then
			RemoveItem(Part)
		end
		
	end
end)

return Debris3