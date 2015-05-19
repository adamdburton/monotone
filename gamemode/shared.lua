GM.Name 		= "Monotone"
GM.Author 		= "_Undefined"
GM.Email 		= "admin@ubs-clan.co.uk"
GM.Website 		= "http://ubs-clan.co.uk"
GM.TeamBased 	= false

TEAM_PAINTERS = 1

team.SetUp(TEAM_PAINTERS, "Painters", Color (0, 0, 0, 255))

function GM:InitPostEntity()
	for _, v in pairs(ents.FindByClass("prop_*")) do
		//v:GetPhysicsObject():EnableMotion(false)
		v:SetMaterial("models/debug/debugwhite")
		v:DrawShadow(false)
	end
end

function GM:PlayerSwitchFlashlight(ply, SwitchOn)
     return false
end
