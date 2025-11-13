-- client.lua
-- HUD dynamique + message de bienvenue

local playerMoney = 1000 -- argent de base

-- 🩺 HUD qui change de couleur selon la santé
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed) - 100
        local armor = GetPedArmour(playerPed)

        -- Couleur selon la santé
        local r, g, b = 0, 255, 0
        if health < 50 then
            r, g, b = 255, 0, 0 -- rouge
        elseif health < 100 then
            r, g, b = 255, 255, 0 -- jaune
        end

        -- Affichage du texte
        SetTextFont(4)
        SetTextScale(0.35, 0.35)
        SetTextColour(r, g, b, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(("💓 Vie: %s | 🛡️ Armure: %s | 💵 Argent: $%s"):format(health, armor, playerMoney))
        DrawText(0.015, 0.95)
    end
end)

-- 🕹️ Commande pour ajouter de l’argent (test)
RegisterCommand("addmoney", function(source, args)
    local amount = tonumber(args[1])
    if amount then
        playerMoney = playerMoney + amount
        TriggerEvent('chat:addMessage', { args = { "HUD", "Tu as ajouté $" .. amount .. " à ton argent." } })
    else
        TriggerEvent('chat:addMessage', { args = { "HUD", "Utilisation : /addmoney 100" } })
    end
end, false)

-- 🎉 Message de bienvenue à la connexion
AddEventHandler('playerSpawned', function()
    TriggerEvent('chat:addMessage', { args = { "Serveur", "👋 Bienvenue sur Goswa RP Server !" } })
end)
