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


function OpenUnicornGarage(Job, BossAccessLabelRank, JobGrade, JobGradeName, MenuColor)
    local menuUnicorn = RageUI.CreateMenu(_U('title_garage'), _U('sub_garage'),nil,nil,nil, nil, MenuColor.a, MenuColor.b, MenuColor.c, MenuColor.o)
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
                                    ESX.ShowNotification("~b~Unicorn\nPoint de spawn bloquée")
                                        else
                                            local model = GetHashKey(v.spawnname)
                                                RequestModel(model)
                                                    while not HasModelLoaded(model) do Wait(10) end
                                                local kcasinoveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                                            SetVehicleNumberPlateText(kcasinoveh, "Unicorn")
                                        SetVehicleFixed(kcasinoveh)
                                    SetVehRadioStation(kcasinoveh, 0)
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