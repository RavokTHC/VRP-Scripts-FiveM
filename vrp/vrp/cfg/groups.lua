
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"Você é um SuperAdmin."}) end},
    "player.group.add",
    "player.group.remove",
    "player.givemoney",
    "player.giveitem"
  },
  ["admin"] = {
    "admin.tickets",
    "admin.announce",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
	"armas.traficante",
    "player.custom_sound",
    "player.display_custom",
	"police.menu_interaction",
    "player.coords",
    "player.tptome",
	"radar.pass",
	"admin.deleteveh",
	"admin.spawnveh",
	"admin.godmode",
	"player.tptowaypoint",
	"player.cmd_mask",
	"admin.easy_unjail",
	"police.door",
	"police.license",
	"police.licensearm",
	"admin.spikes",
    "player.tpto"
  },
  ["moderador"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"Você é um ~r~moderador."}) end},
    "player.group.add",
    "player.group.remove",
	"player.whitelist",
	"player.unwhitelist",
    "player.noclip",
	"radar.pass",
	"police.door",
    "player.tptome",
    "player.list",
	"police.license",
	"police.licensearm",
	"police.menu_interaction",
    "player.kick",
    "player.tpto"
  },   
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
	"player.loot",
	"player.store_armor",
	"player.fix_haircut",
    "player.player_menu",
	"venda.todos",
	"venda.weed",
	"venda.cocaina",
	"venda.metanfetamina",
    "player.store_money",
    "player.store_weapons",
    "player.check",
    "player.calladmin",
	"emergency_heal",
    "police.seizable" -- can be seized
  }, 
  
  ["Coronel ROTA"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
    },
    "player.list",
	"police.easy_jail",
	"police.easy_unjail",
	"coronel.door",
	"police.easy_fine",
	"police.easy_cuff",
	"police.drag",
	"police.menu_interaction",
	"police.door",
    "police.menu",
    "coronel.cloakroom",
	"police.weapon_search",
    "police.pc",
	"radar.pass",
	"holdup.police",
	"rota.garagem",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
	"police.license",
	"police.licensearm",
	"bank.police",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
	"police.askid",
	"coronel.paycheck",
	"coronel.weapons",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  
  ["Policia Federal"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
    },
    "player.list",
	"police.easy_jail",
	"police.easy_unjail",
	"police.easy_fine",
	"police.easy_cuff",
	"police.drag",
	"police.menu_interaction",
	"police.door",
    "police.menu",
    "federal.cloakroom",
	"police.weapon_search",
    "police.pc",
	"radar.pass",
	"holdup.police",
	"federal.garagem",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
	"police.license",
	"police.licensearm",
	"bank.police",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
	"police.askid",
	"policiafederal.paycheck",
	"policiafederal.weapons",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  
  ["Policia Militar"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
    },
    "player.list",
	"police.easy_jail",
	"police.easy_unjail",
	"police.easy_fine",
	"police.easy_cuff",
	"police.drag",
	"police.menu_interaction",
	"police.door",
    "police.menu",
    "pm.cloakroom",
    "police.pc",
	"police.weapon_search",
	"radar.pass",
	"holdup.police",
	"pm.garagem",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
	"police.license",
	"police.licensearm",
	"bank.police",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
	"police.askid",
	"pm.paycheck",
	"pm.weapons",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  
  ["Policia Militar ROTA"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
    },
    "player.list",
	"police.easy_jail",
	"police.easy_unjail",
	"police.easy_fine",
	"police.easy_cuff",
	"police.drag",
	"police.menu_interaction",
	"police.door",
    "police.menu",
    "rota.cloakroom",
	"police.weapon_search",
    "police.pc",
	"radar.pass",
	"holdup.police",
	"rota.garagem",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
	"police.license",
	"police.licensearm",
	"bank.police",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
	"police.askid",
	"rota.paycheck",
	"rota.weapons",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  
  ["Policia Militar Águia"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
    },
    "player.list",
	"police.easy_jail",
	"police.easy_unjail",
	"police.easy_fine",
	"police.easy_cuff",
	"police.drag",
	"police.menu_interaction",
	"police.door",
    "police.menu",
    "aguia.cloakroom",
    "police.pc",
	"radar.pass",
	"holdup.police",
	"aguia.garagem",
	"police.weapon_search",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
	"police.license",
	"police.licensearm",
	"bank.police",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
	"police.askid",
	"aguia.paycheck",
	"aguia.weapons",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  
  ["Paramédico"] = {
    _config = { gtype = "job" },
    "emergency.revive",
    "emergency.shop",
	"emergency_heal",
    "emergency.service",
	"hospital.garagem",
	"emergency.medkit",
	"emergency.paycheck",
	"radar.pass",
	"samu.cloakroom"
  },
  ["Mecânico"] = {
    _config = { gtype = "job"},
    "vehicle.repair",
    "vehicle.replace",
	"repair.paycheck",
	"mission.repair.satellite_dishes",
	"mission.repair.wind_turbines",
    "repair.service",
	"repair.garagem"
  },
  ["Taxi"] = {
    _config = { gtype = "job" },
    "taxi.service",
	"taxi.paycheck",
	"mission.taxi.passenger",
	"taxi.garagem"
  },
  ["Entregador"] = {
    _config = { gtype = "job" },
	"delivery.paycheck",
	"delivery.service",
    "mission.delivery.food",
	"delivery.garagem"
  },
  ["Ladrão de Carros"] = {
    _config = { gtype = "job" },
    "mission.carjack.vehicle"
  },
  ["Traficante de Maconha"] = {
    _config = { gtype = "job" },
	"harvest.weed",
	"process.weed",
	"mission.delivery.weed",
	"mission.delivery.pot"
  },
  ["Traficante de Metanfetamina"] = {
    _config = { gtype = "job" },
	"harvest.metanfetamina",
	"process.metanfetamina",
	"mission.delivery.metanfetamina",
	"mission.delivery.pot3"
  },  
  ["Traficante de Cocaina"] = {
    _config = { gtype = "job" },
	"process.cocaina",
	"harvest.cocaina",
	"mission.delivery.cocaina",
	"mission.delivery.pot2"
  },  
  ["Traficante de Tartaruga"] = {
    _config = { gtype = "job" },
    "harvest.tartaruga",
	"process.Tartaruga"
  },
  ["Traficante de Armas"] = {
    _config = { gtype = "job" },
	"build.gun",
	"mission.delivery.pistol",
	"mission.delivery.shotgun",
	"mission.delivery.smg",
	"mission.gunrunner.shipment"
  },
  ["Assassino Profissional"] = {
    _config = { gtype = "job" },
	"hitman.takebounty",
    "-hitman.addbounty",
	"-player.blips",
	"mission.hitman"
  },
  ["Hacker"] = {
    _config = { gtype = "job" },
	"-player.blips",
	"sell.clonedcards",
	"pick.toclonecards",
	"clone.cards",
	"hacker.hack"
  },
  ["mugger"] = {
    _config = { gtype = "job" },
	"-player.blips",
	"mugger.mug"
  },
  ["Advogado"] = {
    _config = { gtype = "job" },
	"advogado.oab",
  },  
  ["Transportador de Valores"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Você é um piloto de carro forte."}) end
	},
	"mission.bankdriver.moneybank",
	"mission.bankdriver.moneybank2",
	"bankdriver.vehicle",
	"bankdriver.paycheck",
	"bankdriver.money"
  },  
  ["Desempregado"] = {
    _config = { gtype = "job" },
	"player.paycheck"
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Agencia de Empregos"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
	"Taxi",
	"Transportador de Valores",
    "Mecânico",
	"Entregador",
    "Desempregado"
  },
  ["Empregos Ilegais"] = {
    _config = {x = 707.324462890625, y = -966.986511230469, z = 30.4128551483154, blipid = 351, blipcolor = 49},
	"Ladrão de Carros",
	"Traficante de Metanfetamina",
	"Traficante de Maconha",
	"Traficante de Tartaruga",
	"Traficante de Cocaina",	
	"Hacker"
  } 
}

return cfg

