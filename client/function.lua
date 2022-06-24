Esx = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.framework, function(obj) ESX = obj end)     
		    Citizen.Wait(100)
                ClothesJob()
	          end
            while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    Citizen.Wait(10)
    ClothesJob()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    Citizen.Wait(10)
    ClothesJob()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    Citizen.Wait(10)
    ClothesJob()
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
			blockinput = true
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(0)
						end
							if UpdateOnscreenKeyboard() ~= 2 then
								local result = GetOnscreenKeyboardResult()
							Citizen.Wait(500)
						blockinput = false --This unblocks new Input when typing is done
					return result --Returns the result
				else
			Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		  blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

function ClothesJob()
    StartJob = true
    Citizen.CreateThread(function()
        while StartJob do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
                for k,v in pairs(Config.Unicorn) do
                    if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == v.Job then
                        local dst1 = GetDistanceBetweenCoords(playerPos, v.Pos, true)
                            if dst1 < 5.0 then
                                InZone = true
                                    DrawMarker(v.MarkerType,  v.Pos.x, v.Pos.y, v.Pos.z -0.98, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.7, 0.7, 0.7, v.MarkerColor.r, v.MarkerColor.g, v.MarkerColor.b, 200, 0, 1, 2, 0, nil, nil, 0)
                                        if dst1 < 4.0 then
                                            ESX.ShowHelpNotification(_U('open_Clothe_job'))
                                                if IsControlJustReleased(1, 38) then
                                            OpenmenuUnicorn(v.Job, v.BossAccessLabelRank, v.JobGrade, v.JobGradeName, v.MenuColor)
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