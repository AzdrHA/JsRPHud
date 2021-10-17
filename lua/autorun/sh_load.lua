print("\n////////////////////////////////////////////")
print("//  	    jsrphud loading by Azdra       //")
print("////////////////////////////////////////////")

-- DO NOT MOVE SH FILES
if (SERVER) then
	AddCSLuaFile("jsrphud/sh/sh_config.lua")
	include("jsrphud/sh/sh_config.lua")

	include("jsrphud/sv/sv_init.lua")

	AddCSLuaFile("jsrphud/cl/cl_overhead.lua")
	AddCSLuaFile("jsrphud/cl/cl_font.lua")
	AddCSLuaFile("jsrphud/cl/cl_hud.lua")
	AddCSLuaFile("jsrphud/cl/cl_deathScreen.lua")
	AddCSLuaFile("jsrphud/cl/utils/hideElements.lua")
	AddCSLuaFile("jsrphud/cl/utils/defaultNotification.lua")
elseif (CLIENT) then
	include("jsrphud/sh/sh_config.lua")

	include("jsrphud/cl/cl_overhead.lua")
	include("jsrphud/cl/cl_font.lua")
	include("jsrphud/cl/cl_hud.lua")
	include("jsrphud/cl/cl_deathScreen.lua")
	include("jsrphud/cl/utils/hideElements.lua")
	include("jsrphud/cl/utils/defaultNotification.lua")
end