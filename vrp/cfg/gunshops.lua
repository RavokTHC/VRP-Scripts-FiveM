
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
  [""] = {
    _config = {blipid=110,blipcolor=75},
    ["WEAPON_BOTTLE"] = {"Garrafa",600,0,""},
    ["WEAPON_BAT"] = {"Taco de beisebol",1500,0,""},
    ["WEAPON_KNUCKLE"] = {"Soco-Ingles",1000,0,""},
    ["WEAPON_KNIFE"] = {"Faca",1500,0,""},
    ["WEAPON_SNSPISTOL"] = {"Pistola Fajuta",6500,15,""},
    ["WEAPON_PISTOL"] = {"Pistola",10000,15,""},
    ["WEAPON_FLASHLIGHT"] = {"Lanterna",1000,0,""},
    ["WEAPON_ASSAULTRIFLE"] = {"Ak-47",150000,50,""},
  },
  ["Loja da Biqueira"] = {
    _config = {blipid=110,blipcolor=75},
    ["WEAPON_ASSAULTRIFLE"] = {"Ak-47",150000,50,""},
	["WEAPON_COMBATPISTOL"] = {"Pistola de Combate",25000,50,""},
  } 
}

-- list of gunshops positions

cfg.gunshops = {
--[[  {"", 1692.41, 3758.22, 34.7053},
  {"", 252.696, -48.2487, 69.941},
  {"", 844.299, -1033.26, 28.1949},
  {"Loja da Biqueira", -781.89617919922, 572.82379150391, 126.11553192139},
  {"Loja da Biqueira", 1318.4049072266, -450.19314575195, 70.479545593262},
  {"Loja da Biqueira", -2.4635493755341, -1821.8861083984, 29.543239593506},  
  {"", -331.624, 6082.46, 31.4548},
  {"", -664.147, -935.119, 21.8292},
  {"", -1320.983, -389.260, 36.483},
  {"", -1119.48803710938,2697.08666992188,18.5541591644287},
  {"", 2569.62, 294.453, 108.735},
  {"", -3172.60375976563,1085.74816894531,20.8387603759766},
  {"", 21.70, -1107.41, 29.79},
  {"", 810.15, -2156.88, 29.61}]]--
}

return cfg
