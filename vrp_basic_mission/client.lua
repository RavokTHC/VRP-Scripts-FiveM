--bind client tunnel interface
vRPmt = {}
Tunnel.bindInterface("vRP_basic_mission",vRPmt)

function vRPmt.isInAnyVehicle()
  if IsPedInAnyVehicle(GetPlayerPed(-1)) then
	return true
  else
    return false
  end
end

function vRPmt.freezePed(flag)
  FreezeEntityPosition(GetPlayerPed(-1),flag)
end

function vRPmt.getPlayerName(player)
  return GetPlayerName(player)
end

function vRPmt.freezePedVehicle(flag)
  FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1),false),flag)
end

function vRPmt.deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

function vRPmt.deleteNearestVehicle(radius)
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  local v = GetClosestVehicle( x+0.0001, y+0.0001, z+0.0001,radius+0.0001,0,70)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

function vRPmt.getVehiclePedIsInPlateText()
  local p = ""
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  p = GetVehicleNumberPlateText(v)
  return p
end

function vRPmt.isPedVehicleOwner()
  local r = true
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  GetVehicleOwner(v,function(o)
	if IsEntityAVehicle(o) then
		r = false
	end
  end)
  return r
end

function vRPmt.getNearestVehiclePlateText(radius)
  local p = ""
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  local v = GetClosestVehicle( x+0.0001, y+0.0001, z+0.0001,radius+0.0001,0,70)
  p = GetVehicleNumberPlateText(v)
  return p
end