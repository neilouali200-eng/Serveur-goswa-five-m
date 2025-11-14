local vehicles = {}
local sellingVehicle = nil
local sellingPrice = nil

-- Récupération des véhicules
RegisterNetEvent("goswa_concess:sendVehicles")
AddEventHandler("goswa_concess:sendVehicles", function(list)
    vehicles = list
end)

-- Ouvrir catalogue
RegisterCommand("catalogue", function()
    TriggerServerEvent("goswa_concess:getVehicles")
    SetNuiFocus(true, true)
    SendNUIMessage({type = "openCatalogue", vehicles = vehicles})
end)

-- Ouvrir menu vendeur
RegisterCommand("concessmenu", function()
    TriggerServerEvent("goswa_concess:getVehicles")
    SetNuiFocus(true, true)
    SendNUIMessage({type = "openVendeur", vehicles = vehicles})
end)

-- NUI retour fermeture
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

-- Début vente
RegisterNUICallback("startSale", function(data, cb)
    sellingVehicle = data.model
    sellingPrice = tonumber(data.price)
    SetNuiFocus(false, false)
    cb("ok")
end)

-- ALT + Clic joueur
local aiming, entity

CreateThread(function()
    while true do
        Wait(0)
        if sellingVehicle ~= nil then
            if IsControlPressed(0, 19) then -- ALT
                if IsPlayerFreeAiming(PlayerId()) then
                    local _, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                    if entity and IsPedAPlayer(entity) then
                        local target = NetworkGetPlayerIndexFromPed(entity)
                        local targetId = GetPlayerServerId(target)

                        TriggerServerEvent("goswa_concess:sellVehicle", targetId, sellingVehicle, sellingPrice)

                        sellingVehicle = nil
                        sellingPrice = nil
                    }
                end
            end
        end
    end
end)
