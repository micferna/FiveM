local res_name = "~r~Undefined~s~"
local res_fname = "~r~Undefined~s~"
local res_sexe = "~r~Undefined~s~"
local res_dob = "~r~Undefined~s~"
local res_origin = "~r~Undefined~s~"
local res_height = "~r~Undefined~s~"

Citizen.CreateThread(function()
    while (true) do
    Citizen.Wait(1.0)
    RageUI.IsVisible(RMenu:Get('id_card', 'main'), function()
        RageUI.Item.Button('Nom', nil, {RightLabel = res_name}, true, {
            onSelected = function()
                local name = KeyboardInput('Nom:', "", 25)
                if name ~= "" then
                    res_name = name
                end
            end,
        })
        RageUI.Item.Button('Prénom', nil, {RightLabel = res_fname}, true, {
            onSelected = function()
                local fname = KeyboardInput('Prénom:', "", 25)
                if fname ~= "" then
                    res_fname = fname
                end
                notif('~g~Dame derrière le comptoir:~s~ Enchanté ' ..res_name.. ' ' ..res_fname.. '!')
            end,
        })
        RageUI.Item.Button('Sexe', nil, {RightLabel = res_sexe}, true, {
            onSelected = function()
                local sexe = KeyboardInput('Sexe: (ex. M/F)', "", 0)
                if sexe ~= "" then
                    res_sexe = string.lower(sexe)
                end
            end,
        })
        RageUI.Item.Button('Date de naissance', nil, {RightLabel = res_dob}, true, {
            onSelected = function()
                local dob = KeyboardInput('Date de naissance: (ex. 01/01/1999)', "", 25)
                if IsDateCorrect(dob) == true then
                    res_dob = dob
                else
                    notif("~r~Date invalide!")
                end
            end,
        })
        RageUI.Item.Button('Nationalité', nil, {RightLabel = res_origin}, true, {
            onSelected = function()
                local origin = KeyboardInput('Nationalité:', "", 25)
                if origin ~= "" then
                res_origin = origin
                end
            end,
        })
        RageUI.Item.Button('Taille', nil, {RightLabel = res_height}, true, {
            onSelected = function()
                local height = KeyboardInput('Taille (cm): (ex. 179)', "", 25)
                if height ~= "" then
                    res_height = height
                end
            end,
        })
        RageUI.Item.Button('Enregistrer', nil, {RightBadge = RageUI.BadgeStyle.Tick, Color = {BackgroundColor = RageUI.ItemsColour.Green}}, true, {
            onSelected = function()
                if (res_name == nil or res_name == '~r~Undefined~s~') then
                notif('~g~Dame derrière le comptoir:~s~ Veuillez remplir vôtre ~r~nom~s~.')
                elseif (res_fname == nil or res_fname == '~r~Undefined~s~') then
                notif('~g~Dame derrière le comptoir:~s~ Veuillez remplir vôtre ~r~prénom~s~.')
                elseif (res_sexe == nil or res_sexe == '~r~Undefined~s~') then
                notif('~g~Dame derrière le comptoir:~s~ Veuillez remplir vôtre ~r~sexe~s~.')
                elseif (res_dob == nil or res_dob == '~r~Undefined~s~') then
                notif('~g~Dame derrière le comptoir:~s~ Veuillez remplir vôtre ~r~date de naissance~s~.')
                elseif (res_origin == nil or res_origin == '~r~Undefined~s~') then
                notif('~g~Dame derrière le comptoir:~s~ Veuillez remplir vôtre ~r~nationalité~s~.')
                elseif (res_height == nil or res_height == '~r~Undefined~s~') then
                notif('~g~Dame derrière le comptoir:~s~ Veuillez remplir vôtre ~r~taille~s~.')
                else
                createidcard()
                notif('~g~Dame derrière le comptoir:~s~ Voici vos papiers, bienvenue partmis nous FDP')
                deleteMenuIdentity()
                end
            end,
        })
        RageUI.Item.Button('Abandonner', nil, {RightBadge = RageUI.BadgeStyle.Alert, Color = {BackgroundColor = RageUI.ItemsColour.Red}}, true, {
        }, RMenu:Get('id_card', 'quit'))
        end)
        RageUI.IsVisible(RMenu:Get('id_card', 'quit'), function()
            RageUI.Item.Button('Non', "Retourner sur le menu principal.", {LeftLabel = "←", Color = {BackgroundColor = RageUI.ItemsColour.Green}}, true, {
                onSelected = function()
                    RageUI.GoBack()
                end,
            })
            RageUI.Item.Button('Oui', "Êtes-vous sûr de vouloir abbandoner? Tout les donnés seront supprimés.", {RightBadge = RageUI.BadgeStyle.Alert, Color = {BackgroundColor = RageUI.ItemsColour.Red}}, true, {
                onSelected = function()
                    res_name = "~r~Undefined~s~"
                    res_fname = "~r~Undefined~s~"
                    res_sexe = "~r~Undefined~s~"
                    res_dob = "~r~Undefined~s~"
                    res_origin = "~r~Undefined~s~"
                    res_height = "~r~Undefined~s~"
                    deleteMenuIdentity()
                end,
            })
        end)
    end
end)
RegisterCommand('iden', function()
    createMenuIdentity()
end)
RegisterCommand('deliden', function()
    deleteMenuIdentity()
end)
--[[Functions]]
function createMenuIdentity()
    menuId()
    RageUI.Visible(RMenu:Get('id_card', 'main'), not RageUI.Visible(RMenu:Get('id_card', 'main')))
end
function deleteMenuIdentity()
    RMenu:DeleteType('id_card', 'main')
end
function menuId()
    RMenu.Add('id_card', 'main', RageUI.CreateMenu("SansPapiers", ""), true)  
    RMenu:Get('id_card', 'main'):SetSubtitle("Centre des immigrés")
    RMenu:Get('id_card', 'main'):DisplayGlare(true);
    RMenu:Get('id_card', 'main').EnableMouse = false
    RMenu:Get('id_card', 'main').Closable = false
    RMenu.Add('id_card', 'quit', RageUI.CreateSubMenu(RMenu:Get('id_card', 'main'), "SansPapier", "Centre des immigrés"))
end
function createidcard()
    TriggerServerEvent('identity:SetFirstName', GetPlayerServerId(PlayerId()), res_fname)
    TriggerServerEvent('identity:SetLastName', GetPlayerServerId(PlayerId()), res_name)
    TriggerServerEvent('identity:SetDOB', GetPlayerServerId(PlayerId()), res_dob)
    TriggerServerEvent('identity:SetSex', GetPlayerServerId(PlayerId()), res_sexe)
    TriggerServerEvent('identity:SetHeight', GetPlayerServerId(PlayerId()), res_height)
end
function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(1.0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end
function IsDateCorrect(date)
    if (string.match(date, "^%d+%p%d+%p%d%d%d%d$")) then
        local d, m, y = string.match(date, "(%d+)%p(%d+)%p(%d+)")
        d, m, y = tonumber(d), tonumber(m), tonumber(y)
        local dm2 = d*m*m
        if  d>31 or m>12 or dm2==0 or dm2==116 or dm2==120 or dm2==124 or dm2==496 or dm2==1116 or dm2==2511 or dm2==3751 then
            if dm2==116 and (y%400 == 0 or (y%100 ~= 0 and y%4 == 0)) then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        return false
    end
end
function notif(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end