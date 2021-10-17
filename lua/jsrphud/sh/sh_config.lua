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
	["Enable"] = {
		["Workshop"] = true,
		["Resources"] = true,
		["DeathScreen"] = true,
		["Icon"] = true, // Health, Armor and Money	

		// ESP
		["Head"] = true, // Disable/Enabled ESP
		["HeadName"] = false, // ESP player name 
		["HeadHealth"] = true, // ESP player health
		["HeadJob"] = false, // ESP player Job
		["HeadTeamJobColor"] = false, // ESP player job color


		["ResourcesEnabled"] = true,
		["DeathScreen"] = true,
	},
	["Color"] = {
		["Health"] = Color( 84, 84, 84, 200 ),
		["Armor"] = Color( 84, 84, 84, 200 ),
		["Money"] = Color( 84, 84, 84, 200 ),
		["Name"] = Color( 210, 209, 208, 200 ),
		["Job"] = Color( 210, 209, 208, 200 ),
		["WText"] = Color( 255, 255, 255, 200 ), // Name, Armor, Money, ServerName and Rank
		["BText"] = Color( 104, 105, 104, 200 ),
		["Name&Job"] = Color( 0, 110, 255, 200 ),
		["Death"] = Color( 0, 0, 0, 0 ),
	},
	["Msg"] = {
		["ServerName"] = "   Japan Roleplay",
		["Death"] = "Vous êtes inconscient !",
	}
}