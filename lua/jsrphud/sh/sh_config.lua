JSRPHud = {}

--[[
    ___        _   _   	   ____     ____       _   _   _
   / _ \  ____| | | |_   _|  _ \   / ___|  ___| |_| |_(_)_ __   __ _ ___
  / /_\ \|__ /| |_| | | | | | \ \  \___ \ / _ \ __| __| | '_ \ / _` / __|
 / /___\ \/	/_|  _  | \_/ | |_/ /   ___) |  __/ |_| |_| | | | | (_| \__ \
/_/     \_\___|_| |_|\___/|____/   |____/ \___|\__|\__|_|_| |_|\__, |___/
															    |___/
]]

JSRPHud = {
	["compatibility"] = {
		["cookingMod"] = true, // NEED RESTART
	},
	["esp"] = {
		["enabled"] = true,
		["displayName"] = true,
		["displayHealth"] = true,
		["displayJob"] = true,
		["jobDefaultColor"] = true,
	},
	["general"] = {
		["workshop"] = true,
		["resources"] = true,
		["deathScreen"] = true,
		["icon"] = true, // Health, Armor and Money	
	},
	["color"] = {
		["base"] = Color( 84, 84, 84, 200 ),
		["nameBg"] = Color( 210, 209, 208, 200 ),
		["jobBg"] = Color( 210, 209, 208, 200 ),
		["jobText"] = Color( 104, 105, 104, 200 ),
		["nameText"] = Color( 104, 105, 104, 200 ),
		["iconText"] = Color( 255, 255, 255, 200 ), // Name, Armor, Money, ServerName and Rank
		["Name&Job"] = Color( 0, 110, 255, 200 ),
		["deathBg"] = Color( 0, 0, 0, 0 ),
		["foodBar"] = Color(202, 124, 49, 255),
		['thirstBar'] = Color(82, 122, 192, 255)
	},
	["message"] = {
		["serverName"] = "Japan Roleplay",
		["death"] = "Vous êtes inconscient !",
	}
}