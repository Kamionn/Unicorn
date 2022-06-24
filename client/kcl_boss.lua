
function OpenMenuUnicornBoss(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(_U('title_boss'), _U('sub_boss'),nil,nil, nil, nil,MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    local unicornindex = {_U('announcement'), _U('interaction')}
    local unicornalue = 1     
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
                    RageUI.Button(' ', nil, {RightLabel = "→→"}, true , {
                        onSelected = function()
                            TriggerServerEvent(Config.trigger..':midnight', v.price, v.item, v.count, Job)
                        end})

                
               

                    
                    
    
                    end)
                if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
            end
        end
    end