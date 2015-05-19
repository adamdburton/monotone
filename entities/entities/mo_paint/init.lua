AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

function ENT:Initialize()
	self.bloop = Sound("monotone/bloop.wav")
	self:SetModel("models/dav0r/hoverball.mdl")
	self:SetMaterial("models/debug/debugwhite")
	self:SetColor(0, 0, 0, 255)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	//self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:PhysicsCollide(data, ent)
	if data.HitObject:IsValid() then
		self:EmitSound(self.bloop)
		
		while splat == lastsplat do
			splat = "splat"..math.Round(math.Rand(1, 3))
		end
		
		lastsplat = splat
		
		util.Decal(splat, data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)
		
		if data.HitObject:IsValid() then
			data.HitObject:AddVelocity(self:GetForward() * 100)
		end
		
		self:Remove()
	end
end

