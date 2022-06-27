Esx = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.framework, function(obj) ESX = obj end)     
		    Citizen.Wait(100)
	          end
            while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    MarkerCasinoChest()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    MarkerCasinoChest()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    MarkerCasinoChest()
end)

all_items = {}
function getInventory()
    ESX.TriggerServerCallback('::{Kamion#1323}::playerinventory', function(inventory)                          
        all_items = inventory
     end)
end

function getStock()
    ESX.TriggerServerCallback('::{Kamion#1323}::getStockItems', function(inventory)                         
        all_items = inventory  
    end)
end

function OpenMenuCasinoChest(CasinoSelected)
    local menuCasinos = RageUI.CreateMenu(nil, _U('submenu') ,nil,nil,"shopui_title_casino", "shopui_title_casino", CasinoSelected.Color.a, CasinoSelected.Color.b, CasinoSelected.Color.c, CasinoSelected.Color.o)
    local test = RageUI.CreateMenu(CasinoSelected.JobName, _U('submenu'), nil, nil, nil, nil, CasinoSelected.Color.a, CasinoSelected.Color.b, CasinoSelected.Color.c, CasinoSelected.Color.o)
    RageUI.Visible(menuCasinos, not RageUI.Visible(menuCasinos))
    while menuCasinos do
        Citizen.Wait(0)
        RageUI.IsVisible(menuCasinos, function()
            if servicecasino then
                RageUI.Separator(_U('status_On'))
            else
                RageUI.Separator(_U('status_Off'))
            end
            RageUI.Separator('____')
           
            RageUI.Button(_U('button_deposit'), nil, {RightLabel = "→"}, true, {onSelected = function()
                getStock()
                OpenMenuCasinoChesttest(CasinoSelected)
            end});
            RageUI.Button(_U('button_take'), nil, {RightLabel = "→"}, true, {onSelected = function()
                getInventory()
                OpenMenuCasinoChestdeposit(CasinoSelected)
            end});
        end)      
        if not RageUI.Visible(menuCasinos, test) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuCasinos = RMenu:DeleteType("menuCasinos", true)
        end
    end
end