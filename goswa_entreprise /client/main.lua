ESX = nil
local onService = false

-- Initialisation ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- F6 pour toggle service
RegisterCommand('toggleService', function()
    TriggerServerEvent('goswa:toggleService')
end)
RegisterKeyMapping('toggleService', 'Se mettre en service', 'keyboard', 'F6')

-- Ouvrir la tablette
RegisterCommand('openTablet', function()
    ESX.TriggerServerCallback('goswa:checkAccess', function(hasAccess)
        if hasAccess then
            SetNuiFocus(true, true)
            SendNUIMessage({ action = "openTablet" })
        else
            ESX.ShowNotification("Vous n'avez pas accès à la tablette.")
        end
    end)
end)
RegisterKeyMapping('openTablet', 'Ouvrir la tablette', 'keyboard', 'F1')

-- Fermeture NUI
RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)

-- Recevoir les données de la tablette
RegisterNetEvent('goswa:updateTablette')
AddEventHandler('goswa:updateTablette', function(data)
    SendNUIMessage({
        action = 'updateTable',
        employees = data
    })
end)
