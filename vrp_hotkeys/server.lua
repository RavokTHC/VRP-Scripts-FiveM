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

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local htmlEntities = module("vrp", "lib/htmlEntities")
vRPhk = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_hotkeys")
HKclient = Tunnel.getInterface("vrp_hotkeys","vrp_hotkeys")
Tunnel.bindInterface("vrp_hotkeys",vRPhk)
-- USE FOR NECESSARY SERVER FUNCTIONS

local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp", "cfg/base")
local lang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})

function vRPhk.test(msg)
  print("msg "..msg.." received from "..source)
  return 42
end

function vRPhk.toggleHandcuff()
  local user_id = vRP.getUserId({source})
  if vRP.hasPermission({user_id,"hotkey.handcuff"}) then
    vRPclient.getNearestPlayer(source,{10},function(nplayer)
      local nuser_id = vRP.getUserId({nplayer})
      if nuser_id ~= nil then
        vRPclient.toggleHandcuff(nplayer,{})
        vRP.closeMenu({nplayer})
      else
        vRPclient.notify(source,{lang.common.no_player_near()})
      end
    end)
  end
end

function vRPhk.docsOnline()
  local docs = vRP.getUsersByPermission({"emergency.revive"})
  return #docs
end

function vRPhk.canSkipComa(p1,p2)
  local user_id = vRP.getUserId({source})
  return vRP.hasPermission({user_id,p1}), vRP.hasPermission({user_id,p2})
end

function vRPhk.helpComa(x,y,z)
  vRP.sendServiceAlert({source,"emergency",x,y,z,"Help! I've fallen and can't get up!"}) -- people will change this message anyway haha
end

local vehStorage = {}
function vRPhk.canUserLockVehicle(plate, vehicleId, isPlayerInside)
	local player = source
	playerIdentifier = GetPlayerIdentifiers(player)[1]
	local randomMsg = {	"You have found the keys on the sun-shield",
     				"You found the keys in the glove box.",
    				"You found the keys on the passenger seat.",
    				"You found the keys on the floor.",
    				"The keys were already on the contact, you took them."}

   	result = 0
	for i=1, #(vehStorage) do
		if vehStorage[i].plate == plate then
			result = result + 1
			if vehStorage[i].owner == playerIdentifier then
				HKclient.lockVehicle(player,{vehStorage[i].lockStatus, vehStorage[i].id})
				break
			else
				vRPclient.notifyPicture(player,{"CHAR_LIFEINVADER", 3, "LockSystem", "vRP Hotkeys", "You don't have the key of this vehicle."})
				break
			end
		end
	end

	if result == 0 and isPlayerInside then

		length = #(randomMsg)
		randomNbr = math.random(1, tonumber(length))
		vRPclient.notifyPicture(player,{"CHAR_LIFEINVADER", 3, "LockSystem", "vRP Hotkeys", randomMsg[randomNbr]})
		
		table.insert(vehStorage, {plate=plate, owner=playerIdentifier, lockStatus=0, id=vehicleId})
	end
end

function vRPhk.lockSystemUpdate(param, plate)
    for i=1, #(vehStorage) do
		if vehStorage[i].plate == plate then
            vehStorage[i].lockStatus = param
            break
		end
	end
end

function vRPhk.playSoundWithinDistanceOfCoordsForEveryone(x, y, z, maxDistance, soundFile, soundVolume)
	local users = vRP.getUsers({})
    for k,v in pairs(users) do
	  HKclient.playSoundWithinDistanceOfCoords(v,{x, y, z, maxDistance, soundFile, soundVolume})
	end
end