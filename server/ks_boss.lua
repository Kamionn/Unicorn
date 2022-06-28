ESX = nil 

TriggerEvent(Config.framework, function(obj) ESX = obj end)
TriggerEvent('esx_society:isBoss', 'unicorn', 'unicorn', 'society_unicorn', 'society_unicorn', 'society_unicorn', {type = 'private'})

ESX.RegisterServerCallback(Config.trigger..':getSocietyMoney', function(source, cb, soc)
    local money = nil
        MySQL.Async.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @society ', {
            ['@society'] = soc,
        }, function(data)
            for _,v in pairs(data) do
                money = v.money
            end
            cb(money)
        end)
    end)

    RegisterServerEvent(Config.trigger..':removeMoney')
    AddEventHandler(Config.trigger..':removeMoney', function(society, amount)
      local xPlayer = ESX.GetPlayerFromId(source)
      local src = source
        print(society, amount)
            TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        if account.money >= tonumber(amount) then
            xPlayer.addMoney(amount)
            account.removeMoney(amount)
            TriggerClientEvent("esx:showNotification", xPlayer.source, "Type : ~b~Retrait~s~\nSomme : ~b~" .. tonumber(amount) .. "$")
        else         end
      end)
        
    end)