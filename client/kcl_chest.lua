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

all_items = {}
function getInventory()
    ESX.TriggerServerCallback(Config.trigger..':playerinventory', function(inventory)                          
        all_items = inventory
     end)
end

function getStock()
    ESX.TriggerServerCallback(Config.trigger..':getStockItems', function(inventory)                         
        all_items = inventory  
    end)
end

function OpenMenuChest(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(_U('title_chest'), _U('sub_chest'),nil,nil,nil, nil, MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    RageUI.Visible(menuUnicorn, not RageUI.Visible(menuUnicorn))
        while menuUnicorn do
            Citizen.Wait(0)
                RageUI.IsVisible(menuUnicorn, function()
                    if serviceunicorn then
                        RageUI.Separator(_U('status_On'))
                    else
                        RageUI.Separator(_U('status_Off'))
                    end
                        RageUI.Separator('____')
                        RageUI.Button(_U('button_deposit'), nil, {RightLabel = "→"}, true, {onSelected = function()
                            getStock()
                            OpenMenuDeposit(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
                        end});
                        RageUI.Button(_U('button_take'), nil, {RightLabel = "→"}, true, {onSelected = function()
                            getInventory()
                            OpenMenuChestdeposit(CasinoSelected)
                        end});
                    end)      
                if not RageUI.Visible(menuUnicorn, test) then
            FreezeEntityPosition(PlayerPedId(), false)
        menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
      end
   end
end

function OpenMenuDeposit(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(_U('title_chest'), _U('sub_chest'),nil,nil,nil, nil, MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    RageUI.Visible(menuUnicorn, not RageUI.Visible(menuUnicorn))
        while menuUnicorn do
            Citizen.Wait(0)
                RageUI.IsVisible(menuUnicorn, function()
                    if serviceunicorn then
                        RageUI.Separator(_U('status_On'))
                    else
                        RageUI.Separator(_U('status_Off'))
                    end
                        RageUI.Separator('____')
                        RageUI.Button(_U('button_deposit'), nil, {RightLabel = "→"}, true, {onSelected = function()
                            getStock()
                            OpenMenuChesttest(CasinoSelected)
                        end});
                        RageUI.Button(_U('button_take'), nil, {RightLabel = "→"}, true, {onSelected = function()
                            getInventory()
                            OpenMenuChestdeposit(CasinoSelected)
                        end});
                    end)      
                if not RageUI.Visible(menuUnicorn, test) then
            FreezeEntityPosition(PlayerPedId(), false)
        menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
      end
   end
end