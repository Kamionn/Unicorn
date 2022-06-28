
local jobSocietyMoney = 0
UpdateSocietyJobMoney = function(money)
    jobSocietyMoney = ESX.Math.GroupDigits(money)
    end
    
local RefreshSocietyJobMoney = function(Job)
    ESX.TriggerServerCallback(Config.trigger..':getSocietyMoney', function(money)
        UpdateSocietyJobMoney(money)
    end, "society_"..Job)
end
    
function OpenMenuUnicornBoss(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    RefreshSocietyJobMoney(Job)
    local menuUnicorn = RageUI.CreateMenu(_U('title_boss'), _U('sub_boss'),nil,nil, nil, nil,MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    local societyunicorn = nil
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
                        RageUI.Separator(_U('societymoney_boss')..jobSocietyMoney..(' $'))
                        RageUI.Separator('____')
                            RageUI.Button(_U('removeMoney_boss'), nil, {RightLabel = "→"}, not codesCooldown77, {
                                onSelected = function()
                                  codesCooldown77 = true
                                    local money = KeyboardInput(_U('keyboardRemoveMoney_boss'), '', 10) 
                                    TriggerServerEvent(Config.trigger..':withdrawMoney', ('society_')..Job, money)
                                    RefreshSocietyJobMoney(Job)
                                Citizen.SetTimeout(2000, function() codesCooldown77 = false end)
                            end})

                            RageUI.Button(_U('depositMoney_boss'), nil, {RightLabel = "→"}, not codesCooldown79, {
                                onSelected = function()
                                    local money = KeyboardInput(_U('keyboardRemoveMoney_boss'), '', 10) 
                                    TriggerServerEvent(Config.trigger..':depositMoney', ('society_')..Job, money)
                                    codesCooldown79 = true 
                                Citizen.SetTimeout(2000, function() codesCooldown79 = false end)
                            end})

                            RageUI.Button(_U('refreshMoney_boss'), nil, {RightLabel = "→"}, not codesCooldown80, {
                                onSelected = function()
                                    RefreshSocietyJobMoney(Job)
                                    codesCooldown80 = true 
                                Citizen.SetTimeout(2000, function() codesCooldown80 = false end)
                            end})
                        end)
                    if not RageUI.Visible(menuUnicorn) then
                FreezeEntityPosition(PlayerPedId(), false)
                menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
                end
            end
        end
