-- client.lua
-- Affiche un HUD avec santé, armure et argent fictif

local playerMoney = 1000 -- Argent de départ

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- s'exécute chaque frame

        -- Récupération de la santé et de l'armure
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed) - 100 -- GTA health commence à 100
        local armor = GetPedArmour(playerPed)

        -- Affichage du HUD
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.35, 0.35)
        SetTextColour(255, 255, 255, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString("💓 Vie: " .. health .. " | 🛡️ Armure: " .. armor .. " | 💵 Argent: $" .. playerMoney)
        DrawText(0.015, 0.95) -- position en bas à gauche
    end
end)

-- Commande pour ajouter de l'argent (test)
RegisterCommand("addmoney", function(source, args, rawCommand)
    local amount = tonumber(args[1])
    if amount then
        playerMoney = playerMoney + amount
        print("Argent ajouté: $" .. amount .. " | Total: $" .. playerMoney)
    else
        print("Utilisation: /addmoney 100")
    end
end, false)
