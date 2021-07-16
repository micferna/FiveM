ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

AddEventHandler('playerSpawned', function() -- L'evenement se déclanche au spawn du joueur
	ESX.TriggerServerCallback('Isk:GetPlyCoords', function(Coords) -- Trigger qui va récuperer mes données BDD
		Result = json.decode(Coords) -- DECODE du resulta
		SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z, true, true, true) -- Application du result x,y,z
		SetEntityHeading(PlayerPedId(), Result.heading) -- Application du result heading
    end)
end)