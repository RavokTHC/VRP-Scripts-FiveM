other = nil
drag = false

RegisterNetEvent("dr:drag")
AddEventHandler('dr:drag', function(pl)
	other = pl
	drag = not drag
end)

Citizen.CreateThread(function()
	while true do
		if drag and other ~= nil then
			local ped = GetPlayerPed(other)
			local myped = GetPlayerPed(-1)
			AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		else
			DetachEntity(GetPlayerPed(-1), true, false)		
		end
		Citizen.Wait(0)
	end
end)