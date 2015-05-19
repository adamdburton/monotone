include("shared.lua")

function GM:SpawnMenuOpen()
	return false	
end

function GM:ContextMenuOpen()
	return false	
end

function GM:HUDPaint()
	surface.SetDrawColor(255, 255, 255, 255)
	surface.DrawOutlinedRect(20, ScrH() - 40, 202, 22)
	
	surface.SetDrawColor(255, 255, 255, 150)
	surface.DrawRect(22, ScrH() - 39, 200, 20)
	
	surface.SetDrawColor(0, 0, 0, 255)
	surface.DrawRect(21, ScrH() - 39, LocalPlayer():GetNWInt("paint") * 2, 20)
	surface.SetDrawColor(255, 255, 255, 50)
	surface.DrawRect(21, ScrH() - 39, LocalPlayer():GetNWInt("paint") * 2, 5)
end
