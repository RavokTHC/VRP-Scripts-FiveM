
local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.7 -- sell for 75% of the original price

cfg.garage_types = {
  ["Transporte de Valores"] = {
    _config = {vtype="car",blipid=67,blipcolor=4,permissions={"bankdriver.vehicle"}},
    ["stockade"] = {"Carro Forte",0, ""}
  },
  
  ["Veículos PM"] = {
    _config = {vtype="car",blipcolor=4,permissions={"pm.garagem"}},
    ["police2"] = {"Lexus",0, ""},
	["sheriff"] = {"Evoque",0, ""},
  },    
  
  ["Veículos ROTA"] = {
    _config = {vtype="car",blipcolor=4,permissions={"rota.garagem"}},
    ["TRAILBLAZERrota"] = {"Trailblazer",0, ""},
  },    
  
  ["Veículos Federal"] = {
    _config = {vtype="car",blipcolor=4,permissions={"federal.garagem"}},
    ["sheriff2"] = {"Porsche",0, ""},
    ["CHARGERPF"] = {"Charger",0, ""},
  },     
  
  ["heliponto PM"] = {
    _config = {vtype="car",blipcolor=4,permissions={"aguia.garagem"}},
    ["as350"] = {"Águia PMESP",0, ""},

  },    
  
  ["Veículos Aéreos"] = {
    _config = {vtype="bike",blipid=43,blipcolor=5},
    ["luxor"] = {"Luxor",500000, ""},
    ["shamal"] = {"Shamal",650000, ""},
    ["volatus"] = {"Volatus",400000, ""}
  },  
  
  ["hospital"] = {
    _config = {vtype="car",blipcolor=4,permissions={"hospital.garagem"}},
	["sw4samu"] = {"SW4 Samu",0, ""},
    ["ambulance"] = {"Ambulancia",0, ""}
  },
  ["heliponto SAMU"] = {
    _config = {vtype="car",blipcolor=4,permissions={"hospital.garagem"}},
    ["samumav"] = {"Helicóptero Samu",0, ""},

  },   
  ["Taxi"] = {
    _config = {vtype="car",blipid=198,blipcolor=5,permissions={"taxi.garagem"}},
    ["taxi"] = {"Taxi",0, ""},
  },
  
    ["Mecanico"] = {
    _config = {vtype="car",blipid=85,blipcolor=31,permissions={"repair.garagem"}},
    ["towtruck2"] = {"towtruck2",0, ""},
  },
    
  ["Delivery"] = {
    _config = {vtype="bike",blipid=355,blipcolor=4,permissions={"delivery.garagem"}},
    ["enduro"] = {"Enduro",8000, ""},
  }
}

-- {garage_type,x,y,z}
cfg.garages = {
  {"Veículos PM",453.24819946289,-1019.3926391602,28.396326065063},
  {"Veículos ROTA",452.79330444336,-1015.3021240234,28.460147857666},
  {"Veículos Federal",452.83148193359,-1011.642578125,28.47452545166},
  {"heliponto PM",449.32727050781,-981.21728515625,43.691673278809},
  {"heliponto SAMU",313.24923706055,-1465.1434326172,46.509502410889},
  {"Taxi",-339.02719116211,-1023.7808837891,30.380908966064},
  {"Delivery",141.74586486816,-1458.0601806641,29.141620635986},
  {"Mecanico",401.42602539063,-1631.7053222656,29.291942596436},
  {"Transporte de Valores",232.78034973145,117.23257446289,102.60144042969},
  {"Veículos Aéreos",-991.98779296875,-2990.5654296875,13.945069313049},
  {"hospital",299.75296020508,-1442.3692626953,29.79154586792}
  --{"planes",1640, 3236, 40.4},
  --{"planes",2123, 4805, 41.19},
  --{"planes",-1348, -2230, 13.9},
  --{"helicopters",1750, 3260, 41.37},
  --{"helicopters",-1233, -2269, 13.9},
  --{"helicopters",-745, -1468, 5},
  --{"boats",-849.5, -1368.64, 1.6},
  --{"boats",1538, 3902, 30.35}
}

return cfg
