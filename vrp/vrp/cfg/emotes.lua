
-- define emotes
-- use the custom emotes admin action to test emotes on-the-fly
-- animation list: http://docs.ragepluginhook.net/html/62951c37-a440-478c-b389-c471230ddfc5.htm

local cfg = {}

-- map of emote_name => {upper,seq,looping}
-- seq can also be a task definition, check the examples below
cfg.emotes = {

  ["Levantar as mãos"] = { -- handsup state, use clear to lower hands
    true,
    { -- sequence, list of {dict,name,loops}
      {"random@mugging3", "handsup_standing_base", 1}
    },
    true
  },
  ["Não"] = {
    true, {{"gestures@f@standing@casual","gesture_head_no",1}}, false
  },
  ["Droga!"] = {
    true, {{"gestures@f@standing@casual","gesture_damn",1}}, false
  },
  ["Dançar"] = {
    false, {
      {"rcmnigel1bnmt_1b","dance_intro_tyler",1},
      {"rcmnigel1bnmt_1b","dance_loop_tyler",1}
    }, false
  },
  ["Saudação"] = {true,{{"mp_player_int_uppersalute","mp_player_int_salute",1}},false},
  ["Rock"] = {true,{{"mp_player_introck","mp_player_int_rock",1}},false},

  ["Sentar na cadeira"] = {false, {task="PROP_HUMAN_SEAT_CHAIR_MP_PLAYER"}, false},
--  ["Cop"] = {false, {task="WORLD_HUMAN_COP_IDLES"}, false},
  ["Olhar no Binoculo"] = {false, {task="WORLD_HUMAN_BINOCULARS"}, false},
  ["Bater palmas"] = {false, {task="WORLD_HUMAN_CHEERING"}, false},
  ["Beber"] = {false, {task="WORLD_HUMAN_DRINKING"}, false},
  ["Fumar"] = {false, {task="WORLD_HUMAN_SMOKING"}, false},
--  ["Film"] = {false, {task="WORLD_HUMAN_MOBILE_FILM_SHOCKING"}, false},
--  ["Plant"] = {false, {task="WORLD_HUMAN_GARDENER_PLANT"}, false},
  ["Ficar de Guarda"] = {false, {task="WORLD_HUMAN_GUARD_STAND"}, false},
--  ["Hammer"] = {false, {task="WORLD_HUMAN_HAMMERING"}, false},
--  ["Hangout"] = {false, {task="WORLD_HUMAN_HANG_OUT_STREET"}, false},
-- ["Hiker"] = {false, {task="WORLD_HUMAN_HIKER_STANDING"}, false},
  ["Ficar Estatua"] = {false, {task="WORLD_HUMAN_HUMAN_STATUE"}, false},
  ["Corrida"] = {false, {task="WORLD_HUMAN_JOG_STANDING"}, false},
  ["Inclinar-se"] = {false, {task="WORLD_HUMAN_LEANING"}, false},
  ["Alongar-se"] = {false, {task="WORLD_HUMAN_MUSCLE_FLEX"}, false},
  ["Camera"] = {false, {task="WORLD_HUMAN_PAPARAZZI"}, false},
  ["Sentar"] = {false, {task="WORLD_HUMAN_PICNIC"}, false},
  ["Prostituta 1"] = {false, {task="WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}, false},
  ["Prostituta 2"] = {false, {task="WORLD_HUMAN_PROSTITUTE_LOW_CLASS"}, false},
  ["Fazer Flexões"] = {false, {task="WORLD_HUMAN_PUSH_UPS"}, false},
  ["Fazer Abdominais"] = {false, {task="WORLD_HUMAN_SIT_UPS"}, false},
--  ["Fish"] = {false, {task="WORLD_HUMAN_STAND_FISHING"}, false},
  ["Impaciente"] = {false, {task="WORLD_HUMAN_STAND_IMPATIENT"}, false},
  ["Mexer no celular"] = {false, {task="WORLD_HUMAN_STAND_MOBILE"}, false},
  ["Dançar 2"] = {false, {task="WORLD_HUMAN_STRIP_WATCH_STAND"}, false},
  ["Deitar 1"] = {false, {task="WORLD_HUMAN_SUNBATHE_BACK"}, false},
  ["Deitar 2"] = {false, {task="WORLD_HUMAN_SUNBATHE"}, false},
  ["Soldar"] = {false, {task="WORLD_HUMAN_WELDING"}, false},
  ["Examinar corpo"] = {false, {task="CODE_HUMAN_MEDIC_KNEEL"}, false},
  ["Controlar Multidão"] = {false, {task="CODE_HUMAN_POLICE_CROWD_CONTROL"}, false},
  ["Investigar"] = {false, {task="CODE_HUMAN_POLICE_INVESTIGATE"}, false},
  ["Fazer Yoga"] = {false, {task="WORLD_HUMAN_YOGA"}, false}
}

return cfg
