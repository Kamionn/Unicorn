ESX = nil 

TriggerEvent(Config.framework, function(obj) ESX = obj end)

ESX.RegisterServerCallback('::{Kamion#1323}::getSocietyMoney', function(source, cb, soc)
    local money = nil
        MySQL.Async.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @society ', {['@society'] = soc,}, function(data)
            for _,v in pairs(data) do
                money = v.money
            end
            cb(money)
        end)
    end)


    RegisterServerEvent(Config.trigger..':withdrawMoney')
    AddEventHandler(Config.trigger..':withdrawMoney', function(society, amount)
    
      local xPlayer = ESX.GetPlayerFromId(source)
      local src = source
    
      TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        if account.money >= tonumber(amount) then
            xPlayer.addMoney(amount)
            account.removeMoney(amount)
            TriggerClientEvent("esx:showNotification", xPlayer.source, "Type : ~b~Retrait~s~\nSomme : ~b~" .. tonumber(amount) .. "$")
        else 
            TriggerClientEvent("esx:showNotification", xPlayer.source, "~r~Erreur~s~\nType : ~b~Retrait~s~\n Somme : ~b~" .. tonumber(somme) .. "$")
        end
      end)
        
    end)