local p =game.Players.LocalPlayer
local pm  =p.Character or p.CharacterAdded:Wait();

local root: BasePart = pm:WaitForChild("HumanoidRootPart") or p.CharacterAdded:Wait();

function PM_Accelerate(wishdir: Vector3, wishspeed: number, accel: number, deltaTime)
	--// function made taking reference of: https://github.com/IsaiahKelly/quake3-movement-for-unity/blob/master/Quake3Movement/Scripts/Q3PlayerController.cs
	--// q2 style
	print("ok")
	local i: number;
	local addspeed: Vector3, accelspeed: Vector3, currentspeed: Vector3;
	currentspeed = (root.AssemblyLinearVelocity):Dot(wishdir)
	addspeed = wishdir - currentspeed;

	if (addspeed <= 0) then
		return
	end

	accelspeed = accel * deltaTime * wishspeed;
	if (accelspeed > addspeed) then
		accelspeed = addspeed;
	end

	root:ApplyImpulse(Vector3.new(accelspeed * wishdir.x, accelspeed * wishdir.y, 0));

	--// movement acceleration on test
end

game["Run Service"].RenderStepped:Connect(function(dt)
	print(PM_Accelerate(root.CFrame.LookVector,100,0,dt))
end)

PM_Accelerate(Vector3.new(0,0,0),0,0,tick())