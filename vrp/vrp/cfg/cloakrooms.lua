
-- this file configure the cloakrooms on the map

local cfg = {}

-- prepare surgeries customizations
local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
-- policia fardas
local uniforme_pmconvencional = { model = "s_m_y_cop_01" }
local uniforme_aguia = { model = "s_m_m_pilot_02" }
local uniforme_coronel1 = { model = "s_m_y_ranger_01" }
local uniforme_federal1 = { model = "s_m_y_blackops_01" }
local uniforme_federal2 = { model = "s_m_m_fibsec_01" }
local uniforme_rota1 = { model = "s_m_y_ranger_01" }
-- samu fardas
local uniforme_samu = { model = "s_m_m_paramedic_01" }

for i=0,19 do
  uniforme_pmconvencional[i] = {0,0}
  uniforme_aguia[i] = {0,0}
  uniforme_rota1[i] = {0,0}
  uniforme_coronel1[i] = {0,0}
  uniforme_federal1[i] = {0,0}
  uniforme_federal2[i] = {0,0}
  uniforme_samu[i] = {0,0}
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
  ["Policia Militar"] = {
    _config = { permissions = {"pm.cloakroom"} },
    --[[["Uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },]]
	["Policia Militar"] = uniforme_pmconvencional,
	["> s/ farda Mulher"] = surgery_female,
	
  },
  
  ["Águia"] = {
    _config = { permissions = {"aguia.cloakroom"} },
    --[[["Uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },]]
	["Farda do Águia"] = uniforme_aguia,
	["> s/ farda Mulher"] = surgery_female,
	
  },
  
  ["Policia Federal"] = {
    _config = { permissions = {"federal.cloakroom"} },
    --[[["Uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },]]
    ["Farda Federal 1"] = uniforme_federal1,
    ["Farda Federal 2"] = uniforme_federal2,
	["> s/ farda Mulher"] = surgery_female,
	
  },
  
  ["Coronel ROTA"] = {
    _config = { permissions = {"coronel.cloakroom"} },
    --[[["Uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },]]
    ["Farda do Coronel"] = uniforme_coronel1,
	["> s/ farda Mulher"] = surgery_female,
	
  },
  
  ["ROTA"] = {
    _config = { permissions = {"rota.cloakroom"} },
    --[[["Uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },]]
    ["ROTA 01"] = uniforme_rota1,
	["> s/ farda Mulher"] = surgery_female,
	
  },
  
    ["emergency"] = {
    _config = { permissions = {"samu.cloakroom"} },
    --[[["Male uniform"] = {
      [3] = {92,0},
      [4] = {9,3},
      [6] = {25,0},
      [8] = {15,0},
      [11] = {13,3},
      ["p2"] = {2,0}
    }]]
    ["Uniforme SAMU"] = uniforme_samu,
	["> s/ farda Homem"] = surgery_male,
	["> s/ farda Mulher"] = surgery_female,
  },
  ["Escolher Sexo"] = {
    _config = { not_uniform = true },
    ["Homem"] = surgery_male,
    ["Mulher"] = surgery_female
  }
}

cfg.cloakrooms = {
  {"Policia Militar",457.47616577148,-993.30609130859,30.689603805542},
  {"Águia",455.47723388672,-993.35894775391,30.689599990845},
  {"Coronel ROTA",455.29699707031,-988.36389160156,30.689599990845},
  {"ROTA",459.47399902344,-993.30609130859,30.689599990845},
  {"Policia Federal",457.43515014648,-988.44866943359,30.689599990845},
  {"Escolher Sexo",230.81727600098,-405.87521362305,47.924365997314},
  {"emergency",269.77987670898,-1363.4407958984,24.537780761719}
}

return cfg

