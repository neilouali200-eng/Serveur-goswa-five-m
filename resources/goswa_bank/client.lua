local bankZones = {
    { x = 150.26, y = -1040.2, z = 29.37 } -- exemple banque
}

local bankOpen = false
local playerMoney = 1000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local nearBank = false

        for _, zone in pairs(bankZones) do
            if #(coords - vector3(zone.x, zone.y, zone.z)) < 3.0 then
                nearBank = true
                DrawText3D(zone.x, zone.y, zone.z + 1.0, "[E] Accéder à la Banque")
            end
        end

        if nearBank and IsControlJustPressed(0, 38) and not bankOpen then
            bankOpen = true
            SetNuiFocus(true, true)
            SendNUIMessage({ action = "open", money = playerMoney })
        end
    end
end)

RegisterNUICallback("deposit", function(data, cb)
    playerMoney = playerMoney + tonumber(data.amount)
    SendNUIMessage({ money = playerMoney })
    cb("ok")
end)

RegisterNUICallback("withdraw", function(data, cb)
    local amt = tonumber(data.amount)
    if playerMoney >= amt then
        playerMoney = playerMoney - amt
        SendNUIMessage({ money = playerMoney })
    end
    cb("ok")
end)

RegisterNUICallback("closeBank", function(data, cb)
    bankOpen = false
    SetNuiFocus(false, false)
    cb("ok")
end)

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255,255,255,215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(_x,_y)
end
