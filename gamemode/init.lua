AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

for _,f in pairs(file.Find("../materials/monotone/*")) do
	resource.AddFile("materials/monotone/"..f)
end

for _,f in pairs(file.Find("../materials/splats/*")) do
	resource.AddFile("materials/splats/"..f)
end

resource.AddFile("sound/monotone/bloop.wav")
resource.AddFile("scripts/decals/monotone.txt")

function GM:PlayerSpawn(ply)
	ply:SetTeam(TEAM_PAINTERS)
	ply:SetModel("models/player/kleiner.mdl")
	ply:SetMaterial("models/debug/debugwhite")
	ply:SetColor(255, 255, 255, 255)
end

function GM:PlayerInitialSpawn(ply)
	ply:SendLua('chat.AddText(Color(0, 0, 0, 255), "Hey, '..ply:Nick()..'! Welcome to Monotone by _Undefined. Use the left mouse button to paint the world and find your way around.")')
	ply:SendLua('chat.AddText(Color(0, 0, 0, 255), "Visit our growing community at http://ubs-clan.co.uk")')
	ply:SetNWInt("paint", 100)
end

function GM:PlayerDeath(victim, weapon, killer)
	return true
end

function GM:KeyPress(ply, key)
	if not ply:Alive() then return end
	if key == IN_ATTACK then
		if ply:GetNWInt("paint") < 10 then return end
		
		local tr = ply:GetEyeTrace()
		
		local paint = ents.Create('mo_paint')
		paint:SetPos(ply:GetShootPos() + ply:EyeAngles():Forward() * 10)
		paint:SetAngles(ply:GetAngles())
		paint:Spawn()
		paint:Activate()
		paint:SetOwner(ply)
		paint:GetPhysicsObject():AddVelocity(tr.Normal * 1000)
		
		ply:SetNWInt("paint", ply:GetNWInt("paint") - 10)
	end
end

function GM:Think()
	for _, ply in pairs(player.GetAll()) do
		if ply:GetNWInt("paint") < 100 then
			ply:SetNWInt("paint", ply:GetNWInt("paint") + 0.5)
		end
	end
end

function GM:PlayerShouldTakeDamage(victim, ply)
	return false
end

function GM:PlayerLoadout(ply)
	return true
end

function GM:PlayerNoClip(ply)
	return false
end
