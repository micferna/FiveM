--[[events]]
RegisterServerEvent('identity:SetFirstName')
AddEventHandler('identity:SetFirstName', function(ID, firstName)
    local identifier = GetPlayerIdentifiers(source)[1]
    SetFirstName(identifier, firstName)
end)

RegisterServerEvent('identity:SetLastName')
AddEventHandler('identity:SetLastName', function(ID, lastName)
    local identifier = GetPlayerIdentifiers(source)[1]
    SetLastName(identifier, lastName)
end)

RegisterServerEvent('identity:SetDOB')
AddEventHandler('identity:SetDOB', function(ID, dob)
    local identifier = GetPlayerIdentifiers(source)[1]
    SetDOB(identifier, dob)
end)

RegisterServerEvent('identity:SetSex')
AddEventHandler('identity:SetSex', function(ID, sexValue)
    local identifier = GetPlayerIdentifiers(source)[1]
    SetSex(identifier, sexValue)  
end)

RegisterServerEvent('identity:SetHeight')
AddEventHandler('identity:SetHeight', function(ID, height)
    local identifier = GetPlayerIdentifiers(source)[1]
    SetHeight(identifier, height)
end)
--[[Functions]]
function SetFirstName(identifier, firstName)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= firstName
	})
end
function SetLastName(identifier, lastName)
	MySQL.Async.execute('UPDATE `users` SET `lastname` = @lastname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@lastname']		= lastName
	})
end
function SetDOB(identifier, dob, callback)
	MySQL.Async.execute('UPDATE `users` SET `dateofbirth` = @dateofbirth WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@dateofbirth']	= dob
	})
end
function SetSex(identifier, sexValue)
	MySQL.Async.execute('UPDATE `users` SET `sex` = @sex WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@sex']		    = sexValue
	})
end
function SetHeight(identifier, height)
	MySQL.Async.execute('UPDATE `users` SET `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@height']		    = height
	})
end
function ExtractIdentifiers()
    local identifiers = { steam = "", ip = "", discord = "", license = "", xbl = "", live = "" }
    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end
    return identifiers
end