--// reference: p = player, pm = playerModel or character
local p =game.Players.LocalPlayer
local pm  =p.Character or p.CharacterAdded:Wait();

local root = pm:WaitForChild("RootPart") or p.CharacterAdded:Wait();

--// movement parameters
local pm_stopspeed: number = 100;
local	pm_duckScale: number = 0.25;
local	pm_swimScale = 0.50;
local	pm_wadeScale = 0.70;

local	pm_accelerate: number = 10.0;
local	pm_airaccelerate: number = 1.0;
local	pm_wateraccelerate: number = 4.0;
local	pm_flyaccelerate: number = 8.0;

local	pm_friction: number = 6.0;
local	pm_waterfriction: number = 1.0;
local	pm_flightfriction: number = 3.0;
local	pm_spectatorfriction: number = 5.0;

local c_pmove: number = 0;

--[[
==================
PM_Friction
Handles both ground friction and water friction
==================
]]

function PM_Friction(): {any}
	local vec: Vector3;
	local vel: number;
	local speed: number, newspeed: number, control: number
	local drop: number;
	
	
end


--[[
==============
PM_Accelerate
Handles user intended acceleration
==============
]]

function PM_Accelerate(wishdir: Vector3, wishspeed: number, accel: number, deltaTime)
	--// function made taking reference of: https://github.com/IsaiahKelly/quake3-movement-for-unity/
	--// q2 style
	local i: number;
	local addspeed: Vector3 accelspeed: Vector3, currentspeed: Vector3;
	currentspeed = Vector3:Dot(root.AssemblyLinearVelocity, wishdir);
	addspeed = wishdir - currentspeed;

	if (addspeed <= 0) then
		return
	end

	accelspeed = accel * deltaTime * wishspeed;
	if (accelspeed > addspeed) then
		accelspeed = addspeed;
	end

	root:ApplyImpulse(Vector3.new(accelspeed * wishdir.x, accelspeed * wishdir.y, 0));

	--// movement
end