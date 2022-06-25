ESX = nil 

TriggerEvent(Config.framework, function(obj) ESX = obj end)


ESX.RegisterServerCallback('::{Kamion#1323}::getSocietyMoney', function(source, cb, soc)
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

    ESX.RegisterServerCallback('esx_gouv:getSocietyMoney', function(source, cb, soc, label)
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