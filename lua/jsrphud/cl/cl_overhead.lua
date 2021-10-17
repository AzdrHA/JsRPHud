local FMT = FindMetaTable("Player")
local job = Material("AzHud/AzHud_job.png")
local license = Material("AzHud/AzHud_license.png")
local wanted = Material("azhud/azhud_job.png")
	
if (JSRPHud["esp"]["enabled"]) then
	FMT.drawPlayerInfo = function(targ)
    	if not IsValid(targ) then return end
    	local Cteam = team.GetColor(targ:Team())
		local pos = targ:EyePos()	
		if (LocalPlayer():GetPos():Distance( targ:GetPos()) ) < 120 then
    		pos.z = pos.z + 1
    		pos = pos:ToScreen()	
    		if (!targ:getDarkRPVar("wanted")) then      
        		pos.y = pos.y - 1
    		end  
            if (JSRPHud["esp"]["displayName"]) then
        		local name, plyTeam = targ:Nick(), targ:Team()
        		draw.SimpleText(string.upper(name),"font_hud",pos.x + 120, pos.y - 30, JSRPHud["Color"]["WText"],TEXT_ALIGN_LEFT ,TEXT_ALIGN_CENTER)
            end		
            if (JSRPHud["esp"]["displayHealth"]) then
        		local health = targ:Health()
	        	surface.SetMaterial(Material("azhud/azhud_herts2.png"))
	        	surface.SetDrawColor( Color( 255, 255, 255, 255 )  )
        		surface.DrawTexturedRect(pos.x + 90, pos.y -10, 24, 24)
        		draw.SimpleText(health.."%", "font_hud", pos.x + 120, pos.y - 2, JSRPHud["Color"]["WText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
            if (JSRPHud["esp"]["displayJob"]) then
        		local Job = targ:getDarkRPVar("job") or team.GetName(targ:Team())
				local color = JSRPHud["esp"]["jobDefaultColor"] == true and Cteam or Color( 255, 255, 255, 255 )
				surface.SetMaterial(Material("azhud/azhud_job.png"))
				surface.SetDrawColor(color)
				surface.DrawTexturedRect(pos.x + 90, pos.y + 20, 24, 24)
				draw.SimpleText(Job,"font_hud",pos.x + 120, pos.y + 32, color,TEXT_ALIGN_LEFT ,TEXT_ALIGN_CENTER) 
            end
 		end
 	end
end


