local message = "Out Of Character\n( In afara RolePlayului) \n AFK sau DND"
local messagedev = "( Developer )\n Lucrez la Server"
local vipsv = "VIP DIAMOND\n Smecherul Serverului"
local meters = 10
-----------------------------------
--           Commands            --
-----------------------------------
RegisterCommand("ooc", function(source, args, raw)
    TriggerServerEvent("xnarcis08:githubooc, message)  
end) 

RegisterCommand('xnarcis08', function(source,args,raw)
    TriggerServerEvent('xnarcis08:githubooc', messagedev)
end)

RegisterCommand('xnarcis086', function(source,args,raw)
    TriggerServerEvent('xnarcis08:githubooc', vipsv)
end)

RegisterNetEvent("xnarcis08:github")
AddEventHandler("xnarcis08:github", function(message, messagedev, source)
    local displaying = true 
    DisplayFunc(GetPlayerFromServerId(source), message, messagedev)
end)

function DisplayFunc(mePlayer, text)
    
    if displaying == true then
		displaying = false
	else
		displaying = true
	end

    Citizen.CreateThread(function()
        while displaying == true do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local coordsm = GetEntityCoords(ped) + vector3(0.0, 0.0, 1.0)
            local dist = GetDistanceBetweenCoords(coordsMe.x, coordsMe.y, coordsMe.z, coords.x, coords.y, coords.z, true)
            if dist < meters then
                if displaying then
                    DrawText3D(coordsMe.x, coordsMe.y, coordsMe.z + 1.55, text)
                    DrawMarker(0, coordsMe.x, coordsMe.y, coordsMe.z +0.99, 0, 0, 0, 0, 0, 0, 0.100, 0.100, 0.075, 35, 1, 44, 50)
                end
            end
        end
    end)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(15)
        SetTextProportional(1)
        SetTextColour(255, 48, 48, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
