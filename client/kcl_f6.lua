
function OpenMenuUnicorn(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(nil, _U('submenu') ,nil,nil,"shopui_title_unicorn", "shopui_title_unicorn",MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    local unicornindex = {_U('announcement'), _U('interaction'), _U('farm')}
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
            RageUI.Checkbox(_U('take_Service'), nil, serviceunicorn, {}, {
                onChecked = function(index, items)
                serviceunicorn = true
                TriggerServerEvent(Config.trigger..':ServiceOn_unicorn')
                TriggerServerEvent('::{Kamion#1323}::ServiceOn_unicorn_Logs')
                PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
            end,
                onUnChecked = function(index, items)
                serviceunicorn = false
                    TriggerServerEvent('::{Kamion#1323}::ServiceOff_unicorn')
                    TriggerServerEvent('::{Kamion#1323}::ServiceOff_unicorn_Logs')
            end})
            if serviceunicorn then
            RageUI.Separator('____')
            RageUI.List(_U('tablet'), unicornindex, unicornalue, nil, {}, true, {
                onListChange = function(Index)
                    unicornalue = Index
                    unicornalue = Index;
            end})
            RageUI.Separator('____')
            if unicornalue == 1 then

                RageUI.Button(_U('announcement_open'), nil, {RightLabel = "→"}, not codesCooldown1, {
                    onSelected = function()
                    codesCooldown1 = true 
                    if ESX.PlayerData.job2.name == Config.job.unicorn or ESX.PlayerData.job.name == Config.job.unicorn then
                        TriggerServerEvent('::{Kamion#1323}::Open:unicorn')
                    end
                    Citizen.SetTimeout(8000, function() codesCooldown1 = false end)
                end})
                
                 RageUI.Button(_U('announcement_recruitment'), nil, {RightLabel = "→"}, not codesCooldown3, {
                     onSelected = function()
                    codesCooldown3 = true 
                    if ESX.PlayerData.job2.name == Config.job.unicorn or ESX.PlayerData.job.name == Config.job.unicorn then
                        TriggerServerEvent('::{Kamion#1323}::Recru:unicorn')
                    end
                    Citizen.SetTimeout(8000, function() codesCooldown3 = false end)
                end})

                 RageUI.Button(_U('announcement_close'), nil, {RightLabel = "→"}, not codesCooldown2, {
                    onSelected = function()
                    codesCooldown2 = true 
                    if ESX.PlayerData.job2.name == Config.job.unicorn or ESX.PlayerData.job.name == Config.job.unicorn then
                        TriggerServerEvent('::{Kamion#1323}::Close:unicorn')
                    end
                    Citizen.SetTimeout(8000, function() codesCooldown2 = false end)
                end})
         
                RageUI.Button(_U('announcement_other'), nil, {RightLabel = "→"}, not codesCooldown4 , {
                    onSelected = function()
                    codesCooldown4 = true 
                    local te = KeyboardInput("Message", "", 100)
                    ExecuteCommand("other " ..te)
                    Citizen.SetTimeout(8000, function() codesCooldown4 = false end)
                end})                   

            elseif unicornalue == 2 then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                 RageUI.Button(_U('billing'), nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        amount = KeyboardInput(_U('billing_keyboard'),nil,8)
                        amount = tonumber(amount)
                        local player, distance = ESX.Game.GetClosestPlayer()
                        if player ~= -1 and distance <= 3.0 then
                        if amount == nil then
                        ESX.ShowNotification(_U('billing_error'))
                    else
                        local playerPed = PlayerPedId() 
                        Citizen.Wait(500)
                        for i = 1, #Config.unicorn do
                            local v = Config.unicorn[i]
                            if ESX.PlayerData.job2.name == Config.job.unicorn or ESX.PlayerData.job.name == Config.job.unicorn then
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), v.JobSociety, ('unicorn'), amount)
                        end
                    end
                        Citizen.Wait(100)
                        ESX.ShowNotification(_U('billing_sucess'))
                end
                    else
                         ESX.ShowNotification(_U('billing_noplayer'))
                      end
                end});

                RageUI.Button(_U('recruit'), nil , {RightLabel = "→→"}, closestPlayer ~= -1 and closestDistance <= 5.0,{
                    onSelected = function()     
                        if closestPlayer == -1 or closestDistance > 5.0 then
                        ESX.ShowNotification(_U('recruit_noplayer'))
                    else
                        for i = 1, #Config.unicorn do
                            local v = Config.unicorn[i]            
                        TriggerServerEvent('esx_society:manageJob', GetPlayerServerId(closestPlayer), v.JobSociety, "recrutement", 0)
                        end
                    end
                end});
            end
            end
        end)
    
        if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
        end
    end
end












Keys.Register(Config.keyfirstjob, Config.keyfirstjob, _U('keybind_text'), function()
    for k,v in pairs(Config.Unicorn) do
        if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == v.Job then
          OpenMenuUnicorn(v.Job, v.BossAccessLabelRank, v.JobGrade, v.JobGradeName, v.MenuColor)
        end
    end
end)


Keys.Register(Config.keydoublejob, Config.keydoublejob, _U('keybind_text'), function()
    for k,v in pairs(Config.Unicorn) do
        if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == v.Job then
          OpenMenuUnicorn(v.Job, v.BossAccessLabelRank, v.JobGrade, v.JobGradeName, v.MenuColor)
        end
    end
end)
