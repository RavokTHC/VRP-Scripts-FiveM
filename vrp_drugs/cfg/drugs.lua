
local cfg = {}

--[[
TO MAKE A DRUG ADD IT TO cfg.drugs LIKE SO:
  ["itemid"] = {
    name = "Name", -- item name
    desc = "Some description.", -- item description
    choices = function(args) -- create choices
	  local menu = {} -- creates menu
      menu["Choice"] = {function(player,choice) -- menu choice function
  	    local user_id = vRP.getUserId({player}) -- get user id
  	    if user_id ~= nil then -- check user_id not nil
  	      if vRP.tryGetInventoryItem({user_id,"itemid",1,false}) then -- get item
            -- vRP.varyHunger({user_id,30}) -- optional
            -- vRP.varyThirst({user_id,-70}) -- optional
  		    -- vRPclient.varyHealth(player,{10}) -- optional
  		    vRPclient.notify(player,{"~g~Smoking weed."}) -- notify use
  		    local seq = { -- this should be the sequence of animation
  		    }
  		    vRPclient.playAnim(player,{true,seq,false}) -- play animation sequence
  		    SetTimeout(10000,function() -- here a timeout to for effect to start
  		      Dclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false}) -- start movement effect, check client.lua for info about the function
  		      Dclient.playScreenEffect(player, {"DMT_flight", 120}) -- start screen effect, check client.lua for info about the function
  		    end)
  		    SetTimeout(120000,function() -- here a timeout for movement effect to end, screen effect has timer on function
  			  Dclient.resetMovement(player,{false}) -- stop movement effect
  		    end)
  		    vRP.closeMenu({player}) -- close menu
  		  end
  	    end
  	  end}
	  return menu -- return choices
    end,
	weight = 0.1 -- item weight
  },
]]

cfg.drugs= {
  ["cannabis"] = {
    name = "Maconha",
    desc = "Processada.",
    choices = function(args)
	  local menu = {}
      menu["Fumar"] = {function(player,choice)
  	    local user_id = vRP.getUserId({player})
  	    if user_id ~= nil then
  	      if vRP.tryGetInventoryItem({user_id,"cannabis",1,false}) then
  		    TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:red'>Fumando Maconha</b> ", type = "error", timeout = (3000),layout = "centerLeft"})
  		    local seq = {
  		      {"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
  		      {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
  		      {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
  		      {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
  		      {"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
  		    }
  		    vRPclient.playAnim(player,{true,seq,false})
  		    SetTimeout(10000,function()
  		      Dclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
  		      Dclient.playScreenEffect(player, {"DMT_flight", 120})
  		    end)
  		    SetTimeout(120000,function()
  			  Dclient.resetMovement(player,{false})
  		    end)
  		    vRP.closeMenu({player})
  		  end
  	    end
  	  end}
	  return menu
    end,
	weight = 1.0
  },
  ["smirnoff"] = {
    name = "Smirnoff",
    desc = "Vodka extremamente forte.",
    choices = function(args)
	  local menu = {}
      menu["Beber"] = {function(player,choice)
        local user_id = vRP.getUserId({player})
        if user_id ~= nil then
          if vRP.tryGetInventoryItem({user_id,"smirnoff",1,false}) then
            vRP.varyHunger({user_id,30})
            vRP.varyThirst({user_id,-70})

            TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:MediumPurple'>Bebendo Smirnoff</b> ", type = "info", timeout = (3000),layout = "centerLeft"})
            local seq = {
              {"mp_player_intdrink","intro_bottle",1},
              {"mp_player_intdrink","loop_bottle",1},
              {"mp_player_intdrink","outro_bottle",1}
            }
            vRPclient.playAnim(player,{true,seq,false})
			SetTimeout(5000,function()
			  Dclient.playMovement(player,{"MOVE_M@DRUNK@VERYDRUNK",true,true,false,false})
			  Dclient.playScreenEffect(player, {"Rampage", 120})
			  SetTimeout(120000,function()
			    Dclient.resetMovement(player,{false})
			  end)
			end)
            vRP.closeMenu({player})
          end
        end
      end}
	  return menu
    end,
	weight = 0.5
  },
}

return cfg
