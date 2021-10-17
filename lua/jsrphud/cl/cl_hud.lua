local function displayIconInfo(text, x, y, icon, xalign, yalign)
	-- xalign = xalign or TEXT_ALIGN_CENTER
	-- yalign = yalign or TEXT_ALIGN_TOP

	draw.SimpleText(text, "font_hud", x, y, JSRPHud["color"]["iconText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	
	if (JSRPHud["general"]["icon"] && icon) then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( icon )
		surface.DrawTexturedRect( x - 10, y - 25, 22, 22 )
	end
end

local function displayBoxInfo(number, x, y, w, h, color, icon)
	local iconSize = 16;
	draw.RoundedBox(0, x, y, w, h, Color(0, 0, 0, 80))
	draw.RoundedBox(0, x, y, (number * w / 100), h, color)

	if (JSRPHud["general"]["icon"] && icon) then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( icon )
		surface.DrawTexturedRect( x - (iconSize+2), y + (h/2) - (iconSize/2), iconSize, iconSize )
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

	-- displayBoxInfo.displayBoxInfo('')

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
	displayBoxInfo(ply:getDarkRPVar("Energy"), 35, (ScrH() - baseData.h) - 15, baseData.w - 90, 10, JSRPHud["color"]["foodBar"], Material( "azhud/azhud_food.png" ))

	-- // THIRST
	displayBoxInfo(ply:getDarkRPVar("Thirst"), 35, (ScrH() - baseData.h) + 5, baseData.w - 90, 10, JSRPHud["color"]["thirstBar"], Material( "azhud/azhud_moneybag.png" ))
	
	-- // HEALTH
	displayIconInfo(ply:Health(), 41, ScrH() - 46, Material( "azhud/azhud_hearts.png" ))

	-- // ARMOR
	displayIconInfo(ply:Armor(), 125, ScrH() - 46, Material( "azhud/azhud_bulletproof.png" ))

	-- // MONEY
	displayIconInfo(DarkRP.formatMoney(ply:getDarkRPVar("money")), 211, ScrH() - 46, Material( "azhud/AzHud_moneybag.png" ))
end
hook.Add( "HUDPaint", "AzPaint", JSRPHudPaint )