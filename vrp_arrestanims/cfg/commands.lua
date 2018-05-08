cfg = {}

cfg.commands = {
  ["/k"] = {
    -- /pos to log postion to file with user name and msg
    action = function(source, args, msg) 
        TriggerClientEvent('KneelHU', source, {})
    end
 },
}

return cfg