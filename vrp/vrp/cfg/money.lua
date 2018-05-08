local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 15000
cfg.open_bank = 150

-- money display css
cfg.display_css = [[
.div_money{
  position: absolute;
  top: 80px;
  right: 20px;
  font-family: "pcdown";
  font-size: 1.6em;
  font-weight: bold;
  color: white;
  text-shadow:
    -1px -1px 0 #000,
    1px -1px 0 #000,
    -1px 1px 0 #000,
    1px 1px 0 #000;
}

.div_money .symbol{
  font-size: 1.2em;
  color: green;
}

.div_bankmoney{
  position: absolute;
  top: 115px;
  right: 20px;
  font-family: "pcdown";
  font-size: 1.6em;
  font-weight: bold;
  color: white;
  text-shadow:
    -1px -1px 0 #000,
    1px -1px 0 #000,
    -1px 1px 0 #000,
    1px 1px 0 #000;
}

.div_bankmoney .symbol{
  font-size: 1.2em;
  content: url('https://i.imgur.com/ZNFMaoO.png');
}
]]

return cfg
