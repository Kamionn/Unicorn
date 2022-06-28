ESX = nil
TriggerEvent(Config.framework, function(obj) ESX = obj end)

-- [Coffre]
ESX.RegisterServerCallback(Config.trigger..':playerinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	local all_items = {}
	
	for k,v in pairs(items) do
		if v.count > 0 then
			table.insert(all_items, {label = v.label, item = v.name,nb = v.count})
		end
	end
	cb(all_items)
end)

ESX.RegisterServerCallback(Config.trigger..':getStockItems', function(source, cb, Job)
	local all_items = {}
	print('society_'..Job)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..Job, function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end
	end)
	cb(all_items)
end)

RegisterServerEvent(Config.trigger..':putStockItems')
AddEventHandler(Config.trigger..':putStockItems', function(itemName, count, Job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count
	
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..Job, function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent(Config.Notification, xPlayer.source, _U('notification_deposit')..itemName.._U('notification_deposit2')..count)
		else
			TriggerClientEvent(Config.Notification, xPlayer.source, "~r~Vous n'en avez pas assez sur vous")
		end
	end)
end)



RegisterServerEvent(Config.trigger..':takeStockItems')
AddEventHandler(Config.trigger..':takeStockItems', function(itemName, count, society)
	local xPlayer = ESX.GetPlayerFromId(source)
	print(society)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..Job, function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent(Config.Notification, xPlayer.source, "~b~Retrait coffre\n~w~ Item  : ~b~"..itemName.."\n ~w~Quantité(s) : ~b~"..count.."")
	end)
end)
