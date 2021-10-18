local function displayIconInfo(text, x, y, icon, xalign, yalign)
	local iconSize = 22;
	-- xalign = xalign or TEXT_ALIGN_CENTER
	-- yalign = yalign or TEXT_ALIGN_TOP

	draw.SimpleText(text, "font_hud", x, y, JSRPHud["color"]["iconText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	
	if (JSRPHud["general"]["icon"] && icon) then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( icon )
		surface.DrawTexturedRect( x - 10, y - 25, iconSize, iconSize )
	end
end

local function displayBoxInfo(number, x, y, w, h, color, icon, iconPosition)
	local iconSize = 16;

	if (!iconPosition) then iconPosition = "right" end
	local iconPos = iconPosition == "right" and (iconSize+2) or w + (iconSize+5)
	local barPos = iconPosition == "right" and x + (iconSize+2) or (iconSize+2)

	draw.RoundedBox(0, barPos, y, w, h, Color(0, 0, 0, 80))
	draw.RoundedBox(0, barPos, y, (number * w / 100), h, color)

	if (JSRPHud["general"]["icon"] && icon) then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( icon )
		surface.DrawTexturedRect( iconPos, y + (h/2) - (iconSize/2), iconSize, iconSize )
	end
end

local baseData = {
	x = 10, 
	y = ScrH() - 120, // IF YOU MODIFY THIS, YOU MUST MODIFY H
	w = 250, 
	h = 95, // IF YOU MODIFY THIS, YOU MUST MODIFY Y
}

local function JSRPHudPaint()
	local ply = LocalPlayer()
	if !(ply:Alive()) then return end

	draw.RoundedBox(5, 10, (ScrH() - 115) - baseData.h, 140, 25, JSRPHud["color"]["Name&Job"])
	draw.SimpleText(JSRPHud["message"]["serverName"], "font_hud", 78, (ScrH() - 102) - baseData.h, JSRPHud["color"]["iconText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(5, 160, (ScrH() - 115) - baseData.h, 100, 25, JSRPHud["color"]["Name&Job"])
	draw.SimpleText(ply:GetUserGroup(), "font_hud", 210, (ScrH() - 110) - baseData.h, JSRPHud["color"]["iconText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

	draw.RoundedBox(5, 10, (ScrH() - 85) - baseData.h, baseData.w, 25, JSRPHud["color"]["nameBg"])
	draw.SimpleText(ply:getDarkRPVar("rpname"), "font_hud", 15, (ScrH() - 80) - baseData.h, JSRPHud["color"]["nameText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

	draw.RoundedBox(5, 10, (ScrH() - 55) - baseData.h, baseData.w, 25, JSRPHud["color"]["jobBg"])
	draw.SimpleText(ply:getDarkRPVar("job"), "font_hud", 15, (ScrH() - 50) - baseData.h, JSRPHud["color"]["jobText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	
	draw.RoundedBox(0, baseData.x, baseData.y, baseData.w, baseData.h, JSRPHud["color"]["base"])

	-- // FOOD
	displayBoxInfo(ply:getDarkRPVar("Energy"), 20, (ScrH() - baseData.h) - 15, baseData.w - 90, 10, JSRPHud["color"]["foodBar"], Material( "azhud/jsrp_food.png" ), 'right')

	-- // THIRST
	displayBoxInfo(ply:getDarkRPVar("Thirst"), 20, (ScrH() - baseData.h) + 5, baseData.w - 90, 10, JSRPHud["color"]["thirstBar"], Material( "azhud/jsrp_thirst.png" ), 'left')
	
	-- // HEALTH
	displayIconInfo(ply:Health(), 41, ScrH() - 46, Material( "azhud/azhud_hearts.png" ))

	-- // ARMOR
	displayIconInfo(ply:Armor(), 125, ScrH() - 46, Material( "azhud/azhud_bulletproof.png" ))

	-- // MONEY
	displayIconInfo(DarkRP.formatMoney(ply:getDarkRPVar("money")), 211, ScrH() - 46, Material( "azhud/AzHud_moneybag.png" ))
end
hook.Add( "HUDPaint", "AzPaint", JSRPHudPaint )