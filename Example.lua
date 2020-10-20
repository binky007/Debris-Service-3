local DebrisService = require(script.Debris)

local Part1 = Instance.new("Part")
Part1.Parent = workspace
Part1.Anchored = true

local Connection
Connection = Part1.Touched:Connect(function(hit)
	print("Apple")
end)

DebrisService:AddItem(Connection, 2)

print(DebrisService:GetAllDebris()) -- Will print just one as there is only one entry so far

print(DebrisService:GetDebris(Connection)) -- WIll print all the information about the specific instance / table / connection in the debris table

DebrisService:AddItem(Part1, 7, {
	Duration = 3, -- Needs to be an integer
	Tweeninfo =  TweenInfo.new(1), -- Needs to be a TweenInfo
	Goals = {
		['CFrame'] = CFrame.new(0,10,10),
		Transparency = 1,
	} -- Needs to be a table
})

print(DebrisService:GetAllDebris()) -- Will print two as there is now two entries
