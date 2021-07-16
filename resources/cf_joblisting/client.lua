ESX = nil

RMenu.Add('emploi', "main", RageUI.CreateMenu("Pôle-Emploi", "Métiers disponibles",10,100))

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

    ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(data)
        Jobs = data
    end)
    Citizen.Wait(5000)
    
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if RageUI.Visible(RMenu:Get('emploi', "main")) then
            RageUI.DrawContent({ header = true, glare = false}, function()
                for i = 1 , #Jobs,1 do
                    RageUI.Button(Jobs[i].label, nil, { RightLabel = nil },true,function(_,_,Selected)
                        if Selected then 
                            TriggerServerEvent("esx_joblisting:setJob", Jobs[i].value)
                        end
                    end)
                end
            end, function()
            end)
        end
    end
end)

local blips = {
    {title="Pôle emploi", colour=5, id=408, x = -265.0, y = -963.6, z = 30.2}
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

local joblisting = {
	{x = -265.0, y = -963.6, z = 30.2},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(joblisting) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, joblisting[k].x, joblisting[k].y, joblisting[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au ~b~pôle emplois~s~")
				if IsControlJustPressed(1,51) then 
					RageUI.Visible(RMenu:Get('emploi', "main"),not RageUI.Visible(RMenu:Get('emploi', "main")))
				end
            end
        end
    end
end)