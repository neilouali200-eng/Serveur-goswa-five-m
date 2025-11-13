-- server.lua
-- Système de jobs simple

local jobs = {}

RegisterCommand("setjob", function(source, args, rawCommand)
    local job = args[1]
    if job == "policier" or job == "mecano" then
        jobs[source] = job
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Serveur", "Votre job a été défini sur: " .. job}
        })
        print("Player " .. source .. " est maintenant " .. job)
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Serveur", "Job invalide. Choisis: policier ou mecano"}
        })
    end
end, false)

RegisterCommand("myjob", function(source, args, rawCommand)
    local job = jobs[source] or "aucun"
    TriggerClientEvent('chat:addMessage', source, {
        args = {"Serveur", "Votre job actuel: " .. job}
    })
end, false)
