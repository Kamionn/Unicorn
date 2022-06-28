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

function getStock(Job)
    ESX.TriggerServerCallback(Config.trigger..':getStockItems', function(inventory, Job)                         
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
                            getInventory()
                            OpenMenuDeposit(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
                        end});
                        RageUI.Button(_U('button_take'), nil, {RightLabel = "→"}, true, {onSelected = function()
                            getInventory()
                            OpenMenuTake(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
                        end});
                    end)      
                if not RageUI.Visible(menuUnicorn, test) then
            FreezeEntityPosition(PlayerPedId(), false)
        menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
      end
   end
end

function OpenMenuDeposit(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    getInventory(Job)
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
                        for k,v in pairs(all_items) do
                            RageUI.Button(v.label, nil, {RightLabel = "~p~x"..v.nb}, true, {onSelected = function()
                                local count = KeyboardInput(_U('keyboard_take'),nil,10)
                                count = tonumber(count)
                                TriggerServerEvent(Config.trigger..':putStockItems',v.item, count, Job)
                                getInventory()
                            end});
                        end
                    end)      
                if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
        menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
      end
   end
end

function OpenMenuTake(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    getStock()
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
                        for k,v in pairs(all_items) do
                            RageUI.Button(v.label, nil, {RightLabel = "~p~x"..v.nb}, true, {onSelected = function()
                                local count = KeyboardInput(_U('keyboard_take'),nil,10)
                                count = tonumber(count)
                                TriggerServerEvent(Config.trigger..':takeStockItems',v.item, count, Job)
                                getInventory()
                            end});
                        end
                    end)      
                if not RageUI.Visible(menuUnicorn, test) then
            FreezeEntityPosition(PlayerPedId(), false)
        menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
      end
   end
end

