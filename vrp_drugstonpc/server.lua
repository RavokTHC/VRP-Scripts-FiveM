local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_npc")


RegisterServerEvent('drugs:item')
AddEventHandler('drugs:item', function()
    local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"venda.weed"}) then
    local player = vRP.getUserSource({user_id})
    local drugs = {"cannabis"} -- total drugs list
    local t = math.random(1,#drugs) -- count and choose one drugs list
	local tx = math.random(1,5)
    if vRP.tryGetInventoryItem({user_id,drugs[t],tx,true}) then
      TriggerClientEvent('cancel', player)
    else
      TriggerClientEvent('done', player)
      TriggerClientEvent('cancel', player)
    end
  end
end)
  
RegisterServerEvent('drugs:item')
AddEventHandler('drugs:item', function()
    local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"venda.metanfetamina"}) then
    local player = vRP.getUserSource({user_id})
    local drugs1 = {"metanfetamina"} -- total drugs list
    local t1 = math.random(1,#drugs1) -- count and choose one drugs list
	local tx1 = math.random(1,5)
    if vRP.tryGetInventoryItem({user_id,drugs1[t1],tx1,true}) then
      TriggerClientEvent('cancel', player)
    else
      TriggerClientEvent('done', player)
      TriggerClientEvent('cancel', player)
    end
  end
end)

RegisterServerEvent('drugs:item')
AddEventHandler('drugs:item', function()
    local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"venda.cocaina"}) then
    local player = vRP.getUserSource({user_id})
    local drugs1 = {"cocaina"} -- total drugs list
    local t1 = math.random(1,#drugs1) -- count and choose one drugs list
	local tx1 = math.random(1,5)
    if vRP.tryGetInventoryItem({user_id,drugs1[t1],tx1,true}) then
      TriggerClientEvent('cancel', player)
    else
      TriggerClientEvent('done', player)
      TriggerClientEvent('cancel', player)
    end
  end
end)

RegisterServerEvent('drugs:money')
AddEventHandler('drugs:money', function()
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"venda.todos"}) then
	local player = vRP.getUserSource({user_id})
	local reward = math.random(100,500)
	vRP.giveInventoryItem({user_id,"dirty_money",reward})
  end
end)

RegisterServerEvent('vRP_drugNPC:policia')
AddEventHandler('vRP_drugNPC:policia', function(x,y,z)
     vRP.sendServiceAlert({nil, "Policia Militar",x,y,z,"Alguém está tentando me vender drogas."})
	 vRP.sendServiceAlert({nil, "Policia Militar ROTA",x,y,z,"Alguém está tentando me vender drogas."})
	 vRP.sendServiceAlert({nil, "Policia Militar Águia",x,y,z,"Alguém está tentando me vender drogas."})
	 vRP.sendServiceAlert({nil, "Coronel ROTA",x,y,z,"Alguém está tentando me vender drogas."})
	 vRP.sendServiceAlert({nil, "Policia Federal",x,y,z,"Alguém está tentando me vender drogas."})
end)
