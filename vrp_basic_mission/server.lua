
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp_basic_mission", "cfg/missions")

-- load global and local languages
local glang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})
local lang = Lang.new(module("vrp_basic_mission", "cfg/lang/"..cfg.lang) or {})

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_mission")
Mclient = Tunnel.getInterface("vRP_basic_mission","vRP_basic_mission")

function task_mission()
  -- REPAIR
  for k,v in pairs(cfg.repair) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.repair({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.repair({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"repairkit",1,false}) then
                  vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
					vRP.giveInventoryItem({user_id,"repairkit",1,false})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveMoney({user_id,v.reward})
                      vRPclient.notify(player,{glang.money.received({v.reward})})
                    end
                  end)
                end
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end

   -- bankdriver
  for k,v in pairs(cfg.bankdriver) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = v.title.."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"bank_money",500000,true}) then
                  vRPclient.playAnim(player,{false,{task="CODE_HUMAN_POLICE_INVESTIGATE"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveMoney({user_id,v.reward})
                      vRPclient.notify(player,{glang.money.received({v.reward})})
                    end
                  end)
                end
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
 
 
  -- DELIVERY
  for k,v in pairs(cfg.delivery) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.delivery.title()

          -- generate items
          local todo = 0
          local delivery_items = {}
          for idname,data in pairs(v.items) do
           local amount = math.random(data[1],data[2])
            if amount > 0 then
              delivery_items[idname] = amount
              todo = todo+1
            end
          end

          local step = {
            text = "",
            onenter = function(player, area)
              for idname,amount in pairs(delivery_items) do
                if amount > 0 then -- check if not done
                  if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                    local reward = v.items[idname][3]*amount
	                 if k == "mission.delivery.pot" or k=="mission.delivery.pot2" or k=="mission.delivery.pot3" then
					  vRP.giveInventoryItem({user_id,"dirty_money",reward,true})
					else
                      vRP.giveMoney({user_id,reward})
                      vRPclient.notify(player,{glang.money.received({reward})})
					end
                    todo = todo-1
                    delivery_items[idname] = 0
                    if todo == 0 then -- all received, finish mission
                      vRP.nextMissionStep({player})
                    end
                  end
                end
              end
            end,
            position = v.positions[math.random(1,#v.positions)]
          }

          -- mission display
          for idname,amount in pairs(delivery_items) do
            local name = vRP.getItemName({idname})
            step.text = step.text..lang.delivery.item({name,amount}).."<br />"
          end

          mdata.steps = {step}

          if todo > 0 then
            vRP.startMission({player,mdata})
          end
        end
      end
    end
  end
  
  -- CARJACKER
  for k,v in pairs(cfg.carjack) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
	  local reward = math.random(v.min_reward,v.max_reward)
      local user_id = w
      local player = vRP.getUserSource({user_id})
	  	  
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.carjack().."<br />"..lang.reward({reward}),
              onenter = function(player, area)
			    Mclient.isInAnyVehicle(player,{},function(in_veh)
			      if in_veh then
				   Mclient.getVehiclePedIsInPlateText(player,{}, function(plate)
				    vRP.getUserIdentity({user_id, function(identity)
                      if string.find(plate, identity.registration) then
                        vRPclient.notify(player,{lang.own_veh()})
				      else
                        Mclient.freezePedVehicle(player,{true})
				        vRPclient.deleteVehiclePedIsIn(player,{})
					    vRP.giveInventoryItem({user_id,"dirty_money",reward,true})
                        vRP.nextMissionStep({player})
					  end
                    end})
				   end)
				  else
				    vRPclient.notify(player,{lang.no_veh()})
				  end
			    end)
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
		end
	  end
    end
  end
  
  -- GUNRUNNER
  for k,v in pairs(cfg.gunrunner) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      local pistol = math.random(0,2)
	  local shotgun = math.random(-1,2)
	  local smg = math.random(-2,2)
	  	  
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.shipment(),
              onenter = function(player, area)
				if pistol > 0 then
			      vRP.giveInventoryItem({user_id,"pistol_parts",pistol,true})
			      vRP.giveInventoryItem({user_id,"wammo|WEAPON_PISTOL",math.random(50,200)*pistol,true})
				end
				if shotgun > 0 then
			      vRP.giveInventoryItem({user_id,"shotgun_parts",shotgun,true})
			      vRP.giveInventoryItem({user_id,"wammo|WEAPON_PUMPSHOTGUN",math.random(50,100)*shotgun,true})
				end
				if smg > 0 then
			      vRP.giveInventoryItem({user_id,"smg_parts",smg,true})
			      vRP.giveInventoryItem({user_id,"wammo|WEAPON_SMG",math.random(100,200)*smg,true})
				end
                vRP.nextMissionStep({player})
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
		end
	  end
    end
  end
  
      -- Medical Delivery
  for k,v in pairs(cfg.medical_driver) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.medical.title()

        -- generate items
        local todo = 0
        local medical_driver_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            medical_driver_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(medical_driver_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  medical_driver_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(medical_driver_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.medical.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
  -- TAXI
  for k,v in pairs(cfg.taxi) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player})  then
        if math.random(1,v.chance) == 1 then -- chance check -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = v.text.."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                  Mclient.freezePedVehicle(player,{true})
                  vRPclient.notify(player,{"Aguarde o passageiro."})
                  SetTimeout(5000, function()
                    vRP.nextMissionStep({player})
					Mclient.freezePedVehicle(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveMoney({user_id,v.reward})
                      vRPclient.notify(player,{glang.money.received({v.reward})})
                      vRPclient.notify(player,{"Por enquanto é isso!"})
					else
                      vRPclient.notify(player,{"Pegue o passageiro e leve para o destino."})
                    end
                  end)
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  SetTimeout(60000,task_mission)
end
task_mission()
