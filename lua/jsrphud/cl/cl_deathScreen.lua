local function Death() 
    if ( LocalPlayer():Alive() ) then return end
    surface.SetDrawColor( JSRPHud["color"]["deathBg"] )
    surface.DrawRect( 0, 0, ScrW(), ScrH() )
    local FadeD = 255 * math.sin( CurTime() * 5)
    draw.DrawText( JSRPHud["message"]["death"], "font_hud_death", ScrW() * 0.5, ScrH() * 0.25, Color( 255, 255, 255, FadeD ), TEXT_ALIGN_CENTER )
end

if (JSRPHud["general"]["deathScreen"]) then hook.Add( "HUDPaint", "DeathScreen", Death ) end 