function OpenMenuUnicornBoss(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
   
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
                    RageUI.Separator('____')
                        RageUI.Button(_U('removeMoney_boss'), nil, {RightLabel = "→"}, not codesCooldown77, {
                            onSelected = function()
                                codesCooldown77 = true 
                            Citizen.SetTimeout(8000, function() codesCooldown77 = false end)
                        end})

                        RageUI.Button(_U('depositMoney_boss'), nil, {RightLabel = "→"}, not codesCooldown78, {
                            onSelected = function()
                                codesCooldown78 = true 
                            Citizen.SetTimeout(8000, function() codesCooldown78 = false end)
                        end})

                        RageUI.Button(_U('refreshMoney_boss'), nil, {RightLabel = "→"}, not codesCooldown78, {
                            onSelected = function()
                                codesCooldown78 = true 
                            Citizen.SetTimeout(8000, function() codesCooldown78 = false end)
                        end})
                    end)
                if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
            end
        end
    end