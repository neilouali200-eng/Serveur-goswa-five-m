ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local employees = {} -- stockage des employés

-- Toggle service
RegisterNetEvent('goswa:toggleService')
AddEventHandler('goswa:toggleService', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local id = xPlayer.identifier

    if not employees[id] then
        employees[id] = { enService = false, heures_totales = 0, startTime = 0, nom = xPlayer.getName() }
    end

    local emp = employees[id]
    emp.enService = not emp.enService
    if emp.enService then
        emp.startTime = os.time()
        xPlayer.showNotification("Vous êtes maintenant en service.")
    else
        emp.heures_totales = emp.heures_totales + (os.time() - emp.startTime)/3600
        xPlayer.showNotification("Vous avez terminé votre service.")
    end

    TriggerClientEvent('goswa:updateTablette', -1, employees)
end)

-- Vérification accès tablette
ESX.RegisterServerCallback('goswa:checkAccess', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.grade_name == 'boss' or xPlayer.getGroup() == 'admin' then
        cb(true)
    else
        cb(false)
    end
end)

-- Ajouter heures depuis la tablette
RegisterNUICallback('addHours', function(data, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.grade_name == 'boss' or xPlayer.getGroup() == 'admin' then
        local emp = employees[data.employeeId]
        if emp then
            emp.heures_totales = emp.heures_totales + tonumber(data.hours)
            cb({ success = true })
            TriggerClientEvent('goswa:updateTablette', -1, employees)
        else
            cb({ success = false, msg = "Employé introuvable" })
        end
    else
        cb({ success = false, msg = "Pas autorisé" })
    end
end)
