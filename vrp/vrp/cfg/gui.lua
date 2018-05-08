
-- gui config file
local cfg = {}

-- additional css loaded to customize the gui display (see gui/design.css to know the available css elements)
-- it is not recommended to modify the vRP core files outside the cfg/ directory, create a new resource instead
-- you can load external images/fonts/etc using the NUI absolute path: nui://my_resource/myfont.ttf
-- example, changing the gui font (suppose a vrp_mod resource containing a custom font)
cfg.css = [[
@font-face {
  font-family: "pcdown";
  src: url(nui://vrp/gui/fonts/pcdown.ttf) format("truetype");
}

@font-face {
  font-family: "bankgothic";
  src: url(nui://vrp/gui/fonts/bankgothic.ttf) format("truetype");
}

body{
  font-family: "Segoe UI";
  font-size: 0.9em;
}
]]

-- list of static menu types (map of name => {.title,.blipid,.blipcolor,.permissions (optional)})
-- static menus are menu with choices defined by vRP.addStaticMenuChoices(name, choices)
cfg.static_menu_types = {
   ["police_weapons"] = {
      title = "Arsenal da PM", 
      blipcolor = 0,
	  permissions = {
	    "pm.weapons"
	  }
	},
	["police_weapons_coronel"] = {
      title = "Arsenal do Coronel", 
      blipcolor = 0,
	  permissions = {
	    "coronel.weapons"
	  }
	},
	["police_weapons_rota"] = {
      title = "Arsenal da ROTA", 
      blipcolor = 0,
	  permissions = {
	    "rota.weapons"
	  }
	},
	["police_weapons_federal"] = {
      title = "Arsenal da PF", 
      blipcolor = 0,
	  permissions = {
	    "policiafederal.weapons"
	  }
	},
	["police_weapons_tatica"] = {
      title = "Arsenal Força Tática", 
      blipcolor = 0,
	  permissions = {
	    "tatica.weapons"
	  }
	},
	["police_weapons_aguia"] = {
      title = "Arsenal Águia", 
      blipcolor = 0,
	  permissions = {
	    "aguia.weapons"
	  }
	},
   ["emergency_heal"] = {
      title = "Atendimento Médico", 
      blipcolor = 0,
	  permissions = {
	    "emergency_heal"
	  }
	},
   ["emergency_medkit"] = {
      title = "Emergência", 
      blipcolor = 0,
	  permissions = {
	    "emergency.medkit"
	  }
	}
}

-- list of static menu points
cfg.static_menus = {
  {"police_weapons", 461.31414794922,-981.15582275391,30.689588546753},
  {"police_weapons_coronel", 458.30532836914,-979.34185791016,30.689588546753},
  {"police_weapons_rota", 456.82055664063,-983.04901123047,30.689588546753},
  {"police_weapons_tatica", 461.53909301758,-983.06707763672,30.689588546753},
  {"police_weapons_federal", 460.24624633789,-979.08660888672,30.689588546753},
  {"police_weapons_aguia", 459.12884521484,-983.08721923828,30.689588546753},
  {"emergency_medkit", 268.22784423828,-1364.8872070313,24.537782669067},
  {"emergency_heal", 260.49597167969,-1358.4555664063,24.537788391113}
}


return cfg
