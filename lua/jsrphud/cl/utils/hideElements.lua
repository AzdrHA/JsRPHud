/*---------------------------------------------------------
    Default
-----------------------------------------------------------*/

local HideElementsTable = {
    ["DarkRP_HUD"] = true,
    ["DarkRP_LocalPlayerHUD"] = true,
    ["DarkRP_ArrestedHUD"]      = true,
    ["DarkRP_EntityDisplay"] = false,
    ["DarkRP_ZombieInfo"] = true,
    ["DarkRP_Hungermod"] = true,
    ["DarkRP_Agenda"] = true,
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudSuitPower"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
 --   ["CHudCrosshair"] = true,
}

local function HideElements( element )
    if (HideElementsTable[ element ]) then
        return false
    end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )

if (JSRPHud["compatibility"]["cookingMod"]) then hook.Remove("HUDPaint", "HUDPaint.CookingMod") end