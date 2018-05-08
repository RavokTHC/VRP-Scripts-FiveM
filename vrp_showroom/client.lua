--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]


vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

local vehshop = {
	opened = false,
	title = "Apollo Shops",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Apollo Shops",
			name = "main",
			buttons = {
				{name = "Carros", description = ""},
				{name = "Motos", description = ""},
			}
		},
		["Carros"] = {
			title = "Carros",
			name = "Carros",
			buttons = {
			    {name = "Edicoes Especiais", description = ''},
				{name = "Compactos", description = ''},
				{name = "Gang", description = ''},
				{name = "Exemplares", description = ''},
				{name = "Sedans", description = ''},
				{name = "Esportes", description = ''},
				{name = "Esportes Clássicos", description = ''},
				{name = "Supers", description = ''},
				{name = "Grandes", description = ''},
				{name = "Estrada", description = ''},
				{name = "SUVS", description = ''},
				{name = "Vans", description = ''},
				--{name = "Moto", description = ''},
			}
		},
		["Compactos"] = {
			title = "Compactos",
			name = "Compactos",
			buttons = {
				{name = "Brioso R/A", costs = 30000, description = {}, model = "brioso"},
				{name = "Dilettante", costs = 25000, description = {}, model = "Dilettante"},
				{name = "Issi", costs = 18000, description = {}, model = "issi2"},
				{name = "Panto", costs = 15000, description = {}, model = "panto"},
				{name = "Prairie", costs = 30000, description = {}, model = "prairie"},
				{name = "Rhapsody", costs = 12000, description = {}, model = "rhapsody"},
			}
		},
		["Exemplares"] = {
			title = "Exemplares",
			name = "Exemplares",
			buttons = {
				{name = "Cognoscenti Cabrio", costs = 100000, description = {}, model = "cogcabrio"},
				{name = "Exemplar", costs = 105000, description = {}, model = "exemplar"},
				{name = "Felon", costs = 90000, description = {}, model = "felon"},
				{name = "Felon GT", costs = 95000, description = {}, model = "felon2"},
				{name = "Jackal", costs = 60000, description = {}, model = "jackal"},
				{name = "Oracle", costs = 45000, description = {}, model = "oracle"},
				{name = "Oracle XS", costs = 80000, description = {}, model = "oracle2"},
				{name = "Sentinel XS", costs = 60000, description = {}, model = "sentinel2"},
				{name = "Windsor", costs = 200000, description = {}, model = "windsor"},
				{name = "Windsor Drop", costs = 210000, description = {}, model = "windsor2"},
				{name = "Zion", costs = 60000, description = {}, model = "zion"},
				{name = "Zion Cabrio", costs = 65000, description = {}, model = "zion2"},
			}
		},
		["Esportes"] = {
			title = "Esportes",
			name = "Esportes",
			buttons = {
				{name = "9F", costs = 180000, description = {}, model = "ninef"},
				{name = "9F Cabrio", costs = 185000, description = {}, model = "ninef2"},
				{name = "Alpha", costs = 110000, description = {}, model = "alpha"},
				{name = "Bestia GTS", costs = 220000, description = {}, model = "bestiagts"},
				{name = "Buffalo", costs = 38000, description = {}, model = "buffalo"},
				{name = "Buffalo S", costs = 75000, description = {}, model = "buffalo2"},
				{name = "Coquette", costs = 142000, description = {}, model = "coquette"},
				{name = "Drift Tampa", costs = 600000, description = {}, model = "tampa2"},
				{name = "Feltzer", costs = 130000, description = {}, model = "feltzer2"},
				{name = "Furore GT", costs = 195000, description = {}, model = "furoregt"},
				{name = "Fusilade", costs = 36000, description = {}, model = "fusilade"},
				{name = "Jester", costs = 180000, description = {}, model = "jester"},
				{name = "Jester(Racecar)", costs = 200000, description = {}, model = "jester2"},
				{name = "Lynx", costs = 175000, description = {}, model = "lynx"},
				{name = "Massacro", costs = 215000, description = {}, model = "massacro"},
				{name = "Massacro(Racecar)", costs = 250000, description = {}, model = "massacro2"},
				{name = "Omnis", costs = 165000, description = {}, model = "omnis"},
				{name = "Penumbra", costs = 24000, description = {}, model = "penumbra"},
				{name = "Rapid GT", costs = 140000, description = {}, model = "rapidgt"},
				{name = "Rapid GT Convertible", costs = 150000, description = {}, model = "rapidgt2"},
				{name = "Schafter V12", costs = 75000, description = {}, model = "schafter3"},
				{name = "Surano", costs = 135000, description = {}, model = "surano"},
				{name = "Tropos", costs = 310000, description = {}, model = "tropos"},
				{name = "Verkierer", costs = 450000, description = {}, model = "verlierer2"},
			}
		},
		["Esportes Clássicos"] = {
			title = "Esportes Clássicos",
			name = "Esportes Clássicos",
			buttons = {
				{name = "Coquette Classic", costs = 150000, description = {}, model = "coquette2"},
				{name = "JB 700", costs = 135000, description = {}, model = "jb700"},
				{name = "Pigalle", costs = 85000, description = {}, model = "pigalle"},
				{name = "Stinger", costs = 140000, description = {}, model = "stinger"},
				{name = "Stinger GT", costs = 145000, description = {}, model = "stingergt"},
				{name = "Stirling GT", costs = 235000, description = {}, model = "feltzer3"},
				{name = "Z-Type", costs = 300000, description = {}, model = "ztype"},
			}
		},
		["Supers"] = {
			title = "Supers",
			name = "Supers",
			buttons = {
				{name = "Bullet", costs = 195000, description = {}, model = "bullet"},
				{name = "Cheetah", costs = 485000, description = {}, model = "cheetah"},
				{name = "Entity XF", costs = 490000, description = {}, model = "entityxf"},
				{name = "ETR1", costs = 500000, description = {}, model = "sheava"},
				{name = "FMJ", costs = 850000, description = {}, model = "fmj"},
				{name = "Infernus", costs = 490000, description = {}, model = "infernus"},
				{name = "Osiris", costs = 850000, description = {}, model = "osiris"},
				{name = "RE-7B", costs = 1200000, description = {}, model = "le7b"},
				{name = "Reaper", costs = 585000, description = {}, model = "reaper"},
				{name = "Sultan RS", costs = 75000, description = {}, model = "sultanrs"},
				{name = "T20", costs = 1200000, description = {}, model = "t20"},
				{name = "Turismo R", costs = 750000, description = {}, model = "turismor"},
				{name = "Tyrus", costs = 1200000, description = {}, model = "tyrus"},
				{name = "Vacca", costs = 310000, description = {}, model = "vacca"},
				{name = "Voltic", costs = 150000, description = {}, model = "voltic"},
				{name = "X80 Proto", costs = 1200000, description = {}, model = "prototipo"},
			}
		},
		["Grandes"] = {
			title = "Grandes",
			name = "Grandes",
			buttons = {
				{name = "Blade", costs = 80000, description = {}, model = "blade"},
				{name = "Chino", costs = 85000, description = {}, model = "chino"},
				{name = "Coquette BlackFin", costs = 115000, description = {}, model = "coquette3"},
				{name = "Dukes", costs = 62000, description = {}, model = "dukes"},
				{name = "Gauntlet", costs = 63000, description = {}, model = "gauntlet"},
				{name = "Hotknife", costs = 90000, description = {}, model = "hotknife"},
				{name = "Faction", costs = 36000, description = {}, model = "faction"},
				{name = "Nightshade", costs = 225000, description = {}, model = "nightshade"},
				{name = "Picador", costs = 21000, description = {}, model = "picador"},
				{name = "Sabre Turbo", costs = 18000, description = {}, model = "sabregt"},
				{name = "Tampa", costs = 99000, description = {}, model = "tampa"},
				{name = "Virgo", costs = 78000, description = {}, model = "virgo"},
				{name = "Vigero", costs = 33000, description = {}, model = "vigero"},
			}
		},
		["Estrada"] = {
			title = "Estrada",
			name = "Estrada",
			buttons = {
				{name = "Bifta", costs = 75000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 12000, description = {}, model = "blazer"},
				{name = "Brawler", costs = 140000, description = {}, model = "brawler"},
				{name = "Bubsta 6x6", costs = 185000, description = {}, model = "dubsta3"},
				{name = "Dune Buggy", costs = 45000, description = {}, model = "dune"},
				{name = "Rebel", costs = 52000, description = {}, model = "rebel2"},
				{name = "Sandking", costs = 88000, description = {}, model = "sandking"},
				{name = "The Liberator", costs = 552000, description = {}, model = "monster"},
				{name = "Trophy Truck", costs = 558000, description = {}, model = "trophytruck"},
				{name = "Mule", costs = 200000, description = {}, model = "mule"},
				{name = "Benson", costs = 280000, description = {}, model = "benson"},
				{name = "Pounder", costs = 350000, description = {}, model = "pounder"},
			}
		},
		["SUVS"] = {
			title = "SUVS",
			name = "SUVS",
			buttons = {
				{name = "Cavalcade", costs = 60000, description = {}, model = "cavalcade"},
				{name = "Grabger", costs = 86000, description = {}, model = "granger"},
				{name = "Huntley S", costs = 68500, description = {}, model = "huntley"},
				{name = "Landstalker", costs = 55300, description = {}, model = "landstalker"},
				{name = "Radius", costs = 32000, description = {}, model = "radi"},
				{name = "Rocoto", costs = 85000, description = {}, model = "rocoto"},
				{name = "Seminole", costs = 30000, description = {}, model = "seminole"},
				{name = "XLS", costs = 102000, description = {}, model = "xls"},
			}
		},
		["Vans"] = {
			title = "Vans",
			name = "Vans",
			buttons = {
				{name = "Bison", costs = 40000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 44100, description = {}, model = "bobcatxl"},
				{name = "Journey", costs = 75100, description = {}, model = "journey"},
				{name = "Minivan", costs = 40500, description = {}, model = "minivan"},
				{name = "Paradise", costs = 25500, description = {}, model = "paradise"},
				{name = "Rumpo", costs = 32500, description = {}, model = "rumpo"},
				{name = "Youga", costs = 33000, description = {}, model = "youga"},
			}
		},
		["Edicoes Especiais"] = {
			title = "Edicoes Especiais",
			name = "Edicoes Especiais",
			buttons = {
				{name = "Chevette", costs = 12000, description = {}, model = "casco"},
				{name = "Opala SS4", costs = 20000, description = {}, model = "tampa"},
				{name = "Polo", costs = 24000, description = {}, model = "vwpolo"},
				{name = "Pajero", costs = 33000, description = {}, model = "pajero4"},
				{name = "Santa Fé", costs = 35000, description = {}, model = "santafe"},
				{name = "Jeep", costs = 37000, description = {}, model = "srt8"},
				{name = "Golf GTI", costs = 50000, description = {}, model = "mk7"},
				{name = "Saveiro Cross", costs = 60000, description = {}, model = "cavalcade"},
				{name = "Escalade", costs = 65000, description = {}, model = "escade"},
				{name = "Mercedes A45", costs = 800000, description = {}, model = "a45"},
				{name = "Mercedes AMG", costs = 100000, description = {}, model = "c63coupe"},
				{name = "Bmw M4 Sport", costs = 130000, description = {}, model = "440i"},
				{name = "Lancer Evo", costs = 140000, description = {}, model = "kuruma"},
				{name = "Mustang GT", costs = 150000, description = {}, model = "mgt"},
		        {name = "Audi TT", costs = 160000, description = {}, model = "ttrs"},
				{name = "Audi R8", costs = 200000, description = {}, model = "r8ppi"},
				{name = "BMW M4", costs = 200000, description = {}, model = "m4"},
				{name = "Camaro", costs = 220000, description = {}, model = "zl12017"},
				{name = "Camaro ZL", costs = 250000, description = {}, model = "czl1"},
		        {name = "Dodge Challenger", costs = 300000, description = {}, model = "demon"},
				{name = "Audi S5", costs = 330000, description = {}, model = "sentinel"},
				{name = "Caymans", costs = 700000, description = {}, model = "718caymans"},
				{name = "Boxter", costs = 900000, description = {}, model = "718boxster"},
				{name = "Corvette", costs = 1500000, description = {}, model = "c7"},
				{name = "Ferrari", costs = 1500000, description = {}, model = "ferrari812"},
			}
		},
		["Sedans"] = {
			title = "Sedans",
			name = "Sedans",
			buttons = {
				{name = "Asea", costs = 30000, description = {}, model = "asea"},
				{name = "Asterope", costs = 32000, description = {}, model = "asterope"},
				{name = "Cognoscenti", costs = 40000, description = {}, model = "cognoscenti"},
				{name = "Cognoscenti(Armored)", costs = 580000, description = {}, model = "cognoscenti2"},
				{name = "Cognoscenti 55", costs = 50000, description = {}, model = "cog55"},
				{name = "Cognoscenti 55(Armored", costs = 680000, description = {}, model = "cog552"},
				{name = "Fugitive", costs = 42000, description = {}, model = "fugitive"},
				{name = "Glendale", costs = 20000, description = {}, model = "glendale"},
				{name = "Ingot", costs = 9000, description = {}, model = "ingot"},
				{name = "Intruder", costs = 21000, description = {}, model = "intruder"},
				{name = "Premier", costs = 19000, description = {}, model = "premier"},
				{name = "Primo", costs = 12000, description = {}, model = "primo"},
				{name = "Primo Custom", costs = 19500, description = {}, model = "primo2"},
				{name = "Regina", costs = 8000, description = {}, model = "regina"},
				{name = "Schafter", costs = 65000, description = {}, model = "schafter2"},
				{name = "Stanier", costs = 10000, description = {}, model = "stanier"},
				{name = "Stretch", costs = 140000, description = {}, model = "stretch"},
				{name = "Super Diamond", costs = 102000, description = {}, model = "superd"},
				{name = "Tailgater", costs = 55000, description = {}, model = "tailgater"},
				{name = "Warrener", costs = 14000, description = {}, model = "warrener"},
				{name = "Washington", costs = 28000, description = {}, model = "washington"},
			}
		},
		["Motos"] = {
			title = "Motos",
			name = "Motos",
			buttons = {
				{name = "Especial: Ducatti", costs = 20000, description = {}, model = "dm1200"},
				{name = "Especial: Bros", costs = 30000, description = {}, model = "bros60"},
				{name = "Especial: XT 660", costs = 40000, description = {}, model = "xt66"},
				{name = "Especial: R1", costs = 45000, description = {}, model = "r1"},
				{name = "Especial: R6", costs = 50000, description = {}, model = "r6"},
				{name = "Especial: RC", costs = 60000, description = {}, model = "rc"},
				{name = "Especial: CB RR", costs = 70000, description = {}, model = "cbrr"},
				{name = "Especial: ZX 10R", costs = 70000, description = {}, model = "zx10r"},
				{name = "Especial: Agusta", costs = 80000, description = {}, model = "f4rr"},
				{name = "Akuma", costs = 65100, description = {}, model = "AKUMA"},
				{name = "Bagger", costs = 23000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 60500, description = {}, model = "bati"},
				{name = "Bati 801RR", costs = 65100, description = {}, model = "bati2"},
				{name = "BF400", costs = 19600, description = {}, model = "bf400"},
				{name = "Carbon RS", costs = 41500, description = {}, model = "carbonrs"},
				{name = "Cliffhanger", costs = 45200, description = {}, model = "cliffhanger"},
				{name = "Double T", costs = 45100, description = {}, model = "double"},
				{name = "Faggio", costs = 4000, description = {}, model = "faggio2"},
				{name = "Gargoyle", costs = 38000, description = {}, model = "gargoyle"},
				{name = "Hexer", costs = 25200, description = {}, model = "hexer"},
				{name = "Innovation", costs = 58400, description = {}, model = "innovation"},
				{name = "Lectro", costs = 220000, description = {}, model = "lectro"},
				{name = "Nemesis", costs = 21000, description = {}, model = "nemesis"},
				{name = "PCJ-600", costs = 18000, description = {}, model = "pcj"},
				{name = "Ruffian", costs = 17000, description = {}, model = "ruffian"},
				{name = "Sanchez", costs = 12000, description = {}, model = "sanchez"},
				{name = "Thrust", costs = 35100, description = {}, model = "thrust"},
				{name = "Vader", costs = 32000, description = {}, model = "vader"},
				{name = "Vindicator", costs = 96800, description = {}, model = "vindicator"},
			}
		},
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {-33.803,-1102.322,25.422}, inside = {-46.56327,-1097.382,25.99875, 120.1953}, outside = {-31.849,-1090.648,25.998,322.345}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,225)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Apollo Shops")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 5 then
						DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						vehSR_drawTxt("Aperte ~g~ENTER~s~ para comprar um ~b~Carro",0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-44.21378326416,-1079.1402587891,26.67050743103})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Compactos" or vehshop.currentmenu == "Exemplares" or vehshop.currentmenu == "Sedans" or vehshop.currentmenu == "Esportes" or vehshop.currentmenu == "Esportes Clássicos" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Grandes" or vehshop.currentmenu == "Estrada" or vehshop.currentmenu == "SUVS" or vehshop.currentmenu == "Vans" or vehshop.currentmenu == "Edicoes Especiais" or vehshop.currentmenu == "Industrials" or vehshop.currentmenu == "Moto" or vehshop.currentmenu == "Motos" then
							vehSR_drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Compactos" or vehshop.currentmenu == "Exemplares" or vehshop.currentmenu == "Sedans" or vehshop.currentmenu == "Esportes" or vehshop.currentmenu == "Esportes Clássicos" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Grandes" or vehshop.currentmenu == "Estrada" or vehshop.currentmenu == "SUVS" or vehshop.currentmenu == "Vans" or vehshop.currentmenu == "Edicoes Especiais" or vehshop.currentmenu == "Industrials" or vehshop.currentmenu == "Moto" or vehshop.currentmenu == "Motos" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Carregando...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Carregando...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 50 do
										Citizen.Wait(1)
										vehSR_drawTxt("Falhou!",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Carros" then
			vehSR_OpenMenu('Carros')
		elseif btn == "Motos" then
			vehSR_OpenMenu('Motos')
		end
	elseif this == "Carros" then
		if btn == "Esportes" then
			vehSR_OpenMenu('Esportes')
		elseif btn == "Sedans" then
			vehSR_OpenMenu('Sedans')
		elseif btn == "Compactos" then
			vehSR_OpenMenu('Compactos')
		elseif btn == "Exemplares" then
			vehSR_OpenMenu('Exemplares')
		elseif btn == "Esportes Clássicos" then
			vehSR_OpenMenu("Esportes Clássicos")
		elseif btn == "Supers" then
			vehSR_OpenMenu('Supers')
		elseif btn == "Grandes" then
			vehSR_OpenMenu('Grandes')
		elseif btn == "Estrada" then
			vehSR_OpenMenu('Estrada')
		elseif btn == "SUVS" then
			vehSR_OpenMenu('SUVS')
		elseif btn == "Vans" then
			vehSR_OpenMenu('Vans')
			elseif btn == "Edicoes Especiais" then
			vehSR_OpenMenu('Edicoes Especiais')
		end
	elseif this == "Compactos" or this == "Exemplares" or this == "Sedans" or this == "Esportes" or this == "Esportes Clássicos" or this == "Supers" or this == "Grandes" or this == "Estrada" or this == "SUVS" or this == "Vans" or this == "Edicoes Especiais" or this == "Industrial" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "car")
    elseif this == "Moto" or this == "Motos" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "bike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Carros" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Compactos" or vehshop.currentmenu == "Exemplares" or vehshop.currentmenu == "Sedans" or vehshop.currentmenu == "Esportes" or vehshop.currentmenu == "Esportes Clássicos" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Grandes" or vehshop.currentmenu == "Estrada" or vehshop.currentmenu == "SUVS" or vehshop.currentmenu == "Vans" or vehshop.currentmenu == "Edicoes Especiais" or vehshop.currentmenu == "Industrial" or vehshop.currentmenu == "Moto" or vehshop.currentmenu == "Motos" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end