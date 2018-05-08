
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 100000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 24*60

-- commerce chamber {blipid,blipcolor}
cfg.blip = {431,70} 

-- positions of commerce chambers
cfg.commerce_chambers = {
  {-1081.7476806641,-247.7918548584,37.763301849365}
}

return cfg
