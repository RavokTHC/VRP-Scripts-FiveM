
local cfg = {}

-- size of the sms history
cfg.sms_history = 15

-- maximum size of an sms
cfg.sms_size = 500

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["🚓Policia Militar"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 300, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~[COPOM] Chamado de Ocorrencia:~n~~s~",
    notify = "~b~Você chamou a polícia, Aguarde no Local a chegada da Policia",
    answer_notify = "~b~A Policia está a caminho."
  },
  ["🚑SAMU"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 300, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "~r~[SAMU] Chamado de emergência:~n~~s~",
    notify = "~b~Você chamou um samu.",
    answer_notify = "~b~O samu está a caminho."
  },
  ["💼Advogado"] = {
    blipid = 269,
    blipcolor = 68,
    alert_time = 300, -- 5 minutes
    alert_permission = "advogado.service",
    alert_notify = "~r~[Advogado] Alguem ligou para voce solicitando serviço:~n~~s~",
    notify = "~b~Você chamou um advogado.",
    answer_notify = "~b~O advogado está a caminho."
  },  
  ["🚕Taxi"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "taxi.service",
    alert_notify = "~y~[TAXI] Voce tem um Chamado para corrida:~n~~s~",
    notify = "~y~Você chamou um táxi.",
    answer_notify = "~y~Um Taxi está a caminho."
  },
  ["🔧Mecanico"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "repair.service",
    alert_notify = "~y~[Mecanico] Alguem ligou para voce solicitando serviço:~n~~s~",
    notify = "~y~Você chamou um mecanico.",
    answer_notify = "~y~Mecanico está a caminho."
  }
}

-- define phone announces
-- image: background image for the announce (800x150 px)
-- price: amount to pay to post the announce
-- description (optional)
-- permission (optional): permission required to post the announce
cfg.announces = {
  ["admin"] = {
    --image = "nui://vrp_mod/announce_admin.png",
    image = "http://i.imgur.com/HnM1D8w.png",
    price = 0,
    description = "Somente admin.",
    permission = "admin.announce"
  },
  ["police"] = {
    --image = "nui://vrp_mod/announce_police.png",
    image = "http://i.imgur.com/cvzroo4.png",
    price = 0,
    description = "Somente para policiais, ex: anúncio para procurado.",
    permission = "police.announce"
  },
  ["commercial"] = {
    --image = "nui://vrp_mod/announce_commercial.png",
    image = "http://i.imgur.com/QTDgtjF.png",
    description = "Anuncio comercial (comprar, vender, trabalhar).",
    price = 5000
  },
  ["party"] = {
    --image = "nui://vrp_mod/announce_party.png",
    image = "http://i.imgur.com/mpsZ8SD.png",
    description = "Organizando uma festa? Convide todos para ir.",
    price = 5000
  }
}

return cfg
