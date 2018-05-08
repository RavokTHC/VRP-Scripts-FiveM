local cfg = module("vrp_arrestanims", "cfg/commands")

AddEventHandler("chatMessage", function(source, args, msg)
    if msg:sub(1, 1) == "/" then
        text = splitString(msg, " ")
        cmd = text[1]
		args = text[2]
		for k,v in ipairs(text) do
          if k > 2 then
		    args = args.." "..v
          end
		end
		for k,v in pairs(cfg.commands) do
          if cmd == k then
		    v.action(source, args, msg)
        	CancelEvent()
          end
		end
    end
end)