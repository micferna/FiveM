ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) -- Récupération de la librairie ESX coté serveur

ESX.RegisterServerCallback('Isk:GetPlyCoords', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchScalar('SELECT position FROM users WHERE identifier = @identifier', { -- Récupération de la données position dans ma table users
		['@identifier'] = xPlayer.identifier
	}, function(result)
		cb(result) -- Renvoie de ma données position coté client
	end)
end)