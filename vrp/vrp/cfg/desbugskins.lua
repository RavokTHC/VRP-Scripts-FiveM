
local cfg = {}

-- define customization parts
local parts = {
  ["Rosto"] = 0,
  ["Desbugar Fardas"] = 3,
  ["Pernas"] = 4,
  ["Capacetes/Boinas"] = "p0",
  ["Oculos"] = "p1",
}

-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 20
cfg.texture_change_price = 5


-- skinshops list {parts,x,y,z}
cfg.desbugskins = {
  {parts,450.41436767578,-992.41040039063,30.689598083496},
  {parts,267.43811035156,-1362.3930664063,24.537786483765}
}

return cfg
