local function displayIconInfo(text, x, y, icon, xalign, yalign)
	-- xalign = xalign or TEXT_ALIGN_CENTER
	-- yalign = yalign or TEXT_ALIGN_TOP

	draw.SimpleText(text, "font_hud", x, y, JSRPHud["Color"]["WText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	
	if (JSRPHud["Enable"]["Icon"]) then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( icon )
		surface.DrawTexturedRect( x - 10, y - 25, 22, 22 )
	end
end

local function displayBoxInfo(number, borderRadius, x, y, w, h, color)
	draw.RoundedBox(borderRadius, x, y, w, h, Color(0, 0, 0, 80))
	draw.RoundedBox(borderRadius, x, y, (number * w / 100), h, color)
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

	draw.RoundedBox(5, 10, (ScrH() - 115) - baseData.h, 140, 25, JSRPHud["Color"]["Name&Job"])
	draw.SimpleText(JSRPHud["Msg"]["ServerName"], "font_hud", 15, (ScrH() - 102) - baseData.h, JSRPHud["Color"]["WText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	draw.RoundedBox(5, 160, (ScrH() - 115) - baseData.h, 100, 25, JSRPHud["Color"]["Name&Job"])
	draw.SimpleText(ply:GetUserGroup(), "font_hud", 210, (ScrH() - 110) - baseData.h, JSRPHud["Color"]["WText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

	draw.RoundedBox(5, 10, (ScrH() - 85) - baseData.h, baseData.w, 25, JSRPHud["Color"]["Name"])
	draw.SimpleText(ply:getDarkRPVar("rpname"), "font_hud", 15, (ScrH() - 80) - baseData.h, JSRPHud["Color"]["BText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

	draw.RoundedBox(5, 10, (ScrH() - 55) - baseData.h, baseData.w, 25, JSRPHud["Color"]["Job"])
	draw.SimpleText(ply:getDarkRPVar("job"), "font_hud", 15, (ScrH() - 50) - baseData.h, JSRPHud["Color"]["BText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	
	draw.RoundedBox(0, baseData.x, baseData.y, baseData.w, baseData.h, JSRPHud["Color"]["Health"])

	// FOOD
	displayBoxInfo(ply:getDarkRPVar("Energy"), 0, 20, ((ScrH()) - baseData.h) - 20, baseData.w - 90, 10, Color(202, 124, 49, 255))

	// THIRST
	displayBoxInfo(ply:getDarkRPVar("Thirst"), 0, 20, (ScrH()) - baseData.h, baseData.w - 90, 10, Color(82, 122, 192, 255))
	
	// HEALTH
	displayIconInfo(ply:Health(), 41, ScrH() - 46, Material( "AzHud/AzHud_hearts.png" ))

	// ARMOR
	displayIconInfo(ply:Armor(), 125, ScrH() - 46, Material( "AzHud/AzHud_bulletproof.png" ))

	// MONEY
	displayIconInfo(DarkRP.formatMoney(ply:getDarkRPVar("money")), 211, ScrH() - 46, Material( "AzHud/AzHud_moneybag.png" ))
end
hook.Add( "HUDPaint", "AzPaint", JSRPHudPaint )