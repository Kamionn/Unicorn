ESX  = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent(Config.trigger..':midnight')
AddEventHandler(Config.trigger..':midnight', function(price, item, count, Job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..Job, function(account)
        societyAccount = account
    end)
   
    if price <= societyAccount.money then
        TriggerClientEvent(Config.Notification, _source, "~b~Achats~w~ de "..item.." effectué !")
        xPlayer.addInventoryItem(item, count)
        societyAccount.removeMoney(price)
    else 
        TriggerClientEvent(Config.Notification, _source, "Vous n'avez assez ~r~d\'argent sur l'entrprise")
    end
end)
