local DebrisService = require(script.Debris)

local Part1 = Instance.new("Part")
Part1.Parent = workspace

local Connection
Connection = Part1.Touched:Connect(function(hit)
	print("Apple")
end)

DebrisService:AddItem(Connection, 8)

print(DebrisService:GetAllDebris()) -- Will print just one as there is only one entry so far

print(DebrisService:GetDebris(Connection)) -- WIll print all the information about the specific instance / table / connection in the debris table

DebrisService:AddItem(Part1, 10)

print(DebrisService:GetAllDebris()) -- Will print two as there is now two entries
