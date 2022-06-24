ESX = nil 

TriggerEvent(Config.framework, function(obj) ESX = obj end)

-- Open
RegisterServerEvent(Config.trigger..':Open:unicorn')
AddEventHandler(Config.trigger..':Open:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent(Config.AdvancedNotification, xPlayers[i],  _U('announcement_unicorn'),  _U('announcement'), _U('announcement_open_text'), _U('char_unicorn'), 8)
	end
end)

RegisterServerEvent(Config.trigger..':Recru:unicorn')
AddEventHandler(Config.trigger..':Recru:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent(Config.AdvancedNotification, xPlayers[i],  _U('announcement_unicorn'),  _U('announcement'), _U('announcement_recru_text'), _U('char_unicorn'), 8)
	end
end)
-- Close
RegisterServerEvent(Config.trigger..':Close:unicorn')
AddEventHandler(Config.trigger..':Close:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent(Config.AdvancedNotification, xPlayers[i],  _U('announcement_unicorn'),  _U('announcement'), _U('announcement_close_text'), _U('char_unicorn'), 8)
	end
end)

RegisterServerEvent(Config.trigger..':ServiceOn_unicorn')
AddEventHandler(Config.trigger..':ServiceOn_unicorn', function(Job)
   	local xPlayers = ESX.GetPlayers()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = xPlayer.name
    
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == Job or thePlayer.job2.name == Job then
            TriggerClientEvent(Config.AdvancedNotification, xPlayers[i],  _U('announcement_unicorn'), _U('announcement_Take'),  "~p~"..player.."~w~".._U('notif_on'), _U('char_unicorn'), 8)
        end
    end
end)

RegisterServerEvent(Config.trigger..':ServiceOff_unicorn')
AddEventHandler(Config.trigger..':ServiceOff_unicorn', function()
	local xPlayers = ESX.GetPlayers()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = xPlayer.name
    
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == Job or thePlayer.job2.name == Job then
            TriggerClientEvent(Config.AdvancedNotification, xPlayers[i],  _U('announcement_unicorn'), _U('announcement_Stop'),  "~p~"..player.."~w~".._U('notif_off'), _U('char_unicorn'), 8)
        end
    end
end)