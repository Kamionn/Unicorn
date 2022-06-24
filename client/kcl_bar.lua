Esx = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.framework, function(obj) ESX = obj end)     
		    Citizen.Wait(100)
                UnicornBar()
	          end
            while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    Citizen.Wait(10)
    UnicornBar()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    Citizen.Wait(10)
    UnicornBar()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    Citizen.Wait(10)
    UnicornBar()
end)


function OpenmenuUnicornBar(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(_U('title_clothes'), _U('submenu_Clothes') ,nil,nil,nil, nil, MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    RageUI.Visible(menuUnicorn, not RageUI.Visible(menuUnicorn))
        while menuUnicorn do
            Citizen.Wait(0)
                RageUI.IsVisible(menuUnicorn, function()
                    RageUI.Separator('____')
                    for k,v in pairs(Config.Bar.Unicorn) do
                        RageUI.Button(v.buttoname, nil, {RightLabel = "→→"}, true , {
                            onSelected = function()
                           	
                        end})
                     end
                    end)
                if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
          menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
        end
    end
end