
UpdateSocietyJobMoney = function(money)
jobSocietyMoney = ESX.Math.GroupDigits(money)
end

local RefreshSocietyJobMoney = function()
    ESX.TriggerServerCallback('::{Kamion#1323}::getSocietyMoney', function(money)
        UpdateSocietyJobMoney(money)
    end, "society_casino")
end


function OpenMenuUnicornBoss(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    RefreshSocietyJobMoney()
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
                    
            
                    RageUI.Separator(_U('societymoney_boss'))
               

                
               

                    
    
                    end)
                if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
            end
        end
    end