Esx = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.framework, function(obj) ESX = obj end)     
		Citizen.Wait(0)
        UnicornGarage()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    UnicornGarage()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    UnicornGarage()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    UnicornGarage()
end)

function OpenUnicornGarage(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(_U('title_garage'), _U('sub_garage'),nil,nil,nil, nil, MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
    RageUI.Visible(menuUnicorn, not RageUI.Visible(menuUnicorn))
    while menuUnicorn do
        Citizen.Wait(0)
        RageUI.IsVisible(menuUnicorn, function()
            if servicegouv then
                RageUI.Separator(_U('status_On'))
            else
                RageUI.Separator(_U('status_Off'))
            end
            RageUI.Separator('____')
            RageUI.Button(_U('delete_car'), nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                  end
                end})
                RageUI.Separator('____')
                
          
            for k,v in pairs(Config.Garage.Unicorn) do
            RageUI.Button(v.buttoname, nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                    
                    if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                    ESX.ShowNotification("~b~Casino\nPoint de spawn bloquée")
                    else
                    local model = GetHashKey(v.spawnname)
                    RequestModel(model)
                    while not HasModelLoaded(model) do Wait(10) end
                    local kcasinoveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                    SetVehicleNumberPlateText(kcasinoveh, "GouvSud")
                    SetVehicleFixed(kcasinoveh)
                    SetVehRadioStation(kcasinoveh, 0)
                    v.stock = v.stock - 1
                    RageUI.CloseAll()
                  end
                end})
            end
    end)
    
        if not RageUI.Visible(menuUnicorn) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuUnicorn = RMenu:DeleteType("menuUnicorn", true)
        end
    end
end


function UnicornGarage()
    StartJob = true
    Citizen.CreateThread(function()
        while StartJob do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
                for k,v in pairs(Config.Unicorn) do
                    if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == v.Job then
                        local dst1 = GetDistanceBetweenCoords(playerPos, v.PosGarage, true)
                            if dst1 < 5.0 then
                                InZone = true
                                    DrawMarker(v.MarkerType,  v.PosGarage.x, v.PosGarage.y, v.PosGarage.z -0.98, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.7, 0.7, 0.7, v.MarkerColor.r, v.MarkerColor.g, v.MarkerColor.b, 200, 0, 1, 2, 0, nil, nil, 0)
                                        if dst1 < 4.0 then
                                            ESX.ShowHelpNotification(_U('open_garage'))
                                                if IsControlJustReleased(1, 38) then
                                            OpenUnicornGarage(v.Job, v.BossAccessLabelRank, v.JobGrade, v.JobGradeName, v.MenuColor)
                                        end
                                    end
                                end
                            end
                        end
                    if not InZone then
                  Wait(500)
                else
              Wait(1)
            end
        end
    end)
end