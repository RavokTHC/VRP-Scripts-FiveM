
description "vRP ArrestAnims"
--ui_page "ui/index.html"

dependency "vrp"

client_scripts{
  "cfg/commands.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}