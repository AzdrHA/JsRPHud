local blur = Material( "pp/blurscreen" )
local function drawBlur( x, y, w, h, layers, density, alpha )
    surface.SetDrawColor( 255, 255, 255, alpha )
    surface.SetMaterial( blur )
 
    for i = 1, layers do
        blur:SetFloat( "$blur", ( i / layers ) * density )
        blur:Recompute()
 
        render.UpdateScreenEffectTexture()
        render.SetScissorRect( x, y, x + w, y + h, true )
        surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
        render.SetScissorRect( 0, 0, 0, 0, false )
    end
end