ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wozztv:eboueur')
AddEventHandler('wozztv:eboueur', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob("garbage", 0)  
end)

RegisterServerEvent('wozztv:postier')
AddEventHandler('wozztv:postier', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob("gopostal", 0)  
end)