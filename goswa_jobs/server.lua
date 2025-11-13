-- server.lua
-- Jobs + salaire automatique toutes les 30 minutes

local jobs = {}
local salaries = {
    policier = 500,
    mecano = 300
}

-- Définir le job du joueur
RegisterCommand("setjob", function(source, args)
    local job = args[1]
    if job and salaries[job] then
        jobs[source] = job
        TriggerClientEvent('chat:addMessage', source, { args = { "Serveur", "👮 Tu es maintenant " .. job } })
        print("Le joueur " .. source .. " est maintenant " .. job)
    else
        TriggerClientEvent('chat:addMessage', source, { args = { "Serveur", "❌ Job invalide. Utilise : policier / mecano" } })
    end
end, false)

-- Voir son job actuel
RegisterCommand("myjob", function(source)
    local job = jobs[source] or "aucun"
    TriggerClientEvent('chat:addMessage', source, { args = { "Serveur", "🧰 Ton job actuel : " .. job } })
end, false)

-- 💰 Verse le salaire toutes les 30 minutes
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1800000) -- 30 minutes = 1 800 000 ms
        for playerId, job in pairs(jobs) do
            local salaire = salaries[job]
            if salaire then
                TriggerClientEvent('chat:addMessage', playerId, {
                    args = { "Banque", "💸 Tu as reçu ton salaire de $" .. salaire .. " pour ton travail de " .. job }
                })
            end
        end
    end
end)
