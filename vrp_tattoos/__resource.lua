
description "vrp_tattoos"
--ui_page "ui/index.html"

dependency "vrp"

client_scripts{ 
  "lib/Proxy.lua",
  "lib/Tunnel.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}

--ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/logo.png',
    'html/dmv.png',
    'html/cursor.png',
    'html/styles.css',
    'html/questions.js',
    'html/scripts.js',
    'html/debounce.min.js'
}
