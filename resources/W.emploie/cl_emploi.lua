Esx = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local pos = {
    {x = -269.37, y = -955.19, z = 30.25},
}

Wozz              = {}
Wozz.DrawDistance = 100
Wozz.Size         = {x = 0.6, y = 0.6, z = 0.6}
Wozz.Color        = {r = 125, g = 63, b = 175}
Wozz.Type         = 25

------ Color Menu 


---------

RMenu.Add('emploi', 'main', RageUI.CreateMenu("Pôle emploi", "Métiers Disponibles"))
RMenu:Get('emploi', 'main'):SetRectangleBanner(102, 0, 102, 200)


Citizen.CreateThread(function()
    while true do

        RageUI.IsVisible(RMenu:Get('emploi', 'main'), true, true, true, function()
            

            RageUI.Button("Eboueur", nil, {RightLabel = "~p~→→→"},true, function(Hovered, Active, Selected)
            if (Selected) then   
                TriggerServerEvent('wozztv:eboueur')
				ESX.ShowAdvancedNotification('Pôle emploi', '~p~Eboueur', '~w~Tu es désormais Eboueur', 'CHAR_LIFEINVADER')
                RageUI.CloseAll()
            end
            end)

            RageUI.Button("Postier", nil, {RightLabel = "~p~→→→"},true, function(Hovered, Active, Selected)
            if (Selected) then   
                TriggerServerEvent('wozztv:postier')
                ESX.ShowAdvancedNotification('Pôle emploi', '~p~Go Postal', '~w~Tu es désormais Postier', 'CHAR_LIFEINVADER')
                RageUI.CloseAll()
            end
            end)


        end, function()
        end)

        Citizen.Wait(0)
    end
end)



----- Texte Rageui

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(pos) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= 1.1 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au ~p~Pôle emploi.")
				if IsControlJustPressed(1,51) then 					
                    openemploi()
				end
            end
        end
    end  
end)

function openemploi()
    RageUI.Visible(RMenu:Get('emploi', 'main'), not RageUI.Visible(RMenu:Get('emploi', 'main')))
end

Citizen.CreateThread(function()

    for k in pairs(pos) do

	local blip = AddBlipForCoord(pos[k].x, pos[k].y, pos[k].z)

	SetBlipSprite(blip, 269)
	SetBlipColour(blip, 58)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Pôle emploi")
    EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId()), true

        for k in pairs(pos) do
            if (Wozz.Type ~= -1 and GetDistanceBetweenCoords(coords, pos[k].x, pos[k].y, pos[k].z, true) < Wozz.DrawDistance) then
                DrawMarker(Wozz.Type, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Wozz.Size.x, Wozz.Size.y, Wozz.Size.z, Wozz.Color.r, Wozz.Color.g, Wozz.Color.b, 100, false, true, 2, false, false, false, false)
			end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_f_m_bevhills_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "a_f_m_bevhills_02",-270.01,-954.24,30.22, 220.65, false, true) 
    SetBlockingOfNonTemporaryEvents(ped, true) 
    FreezeEntityPosition(ped, true) 
	SetEntityInvincible(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CAR_PARK_ATTENDANT") 
end)


