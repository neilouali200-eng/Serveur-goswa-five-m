VEHICLES = {
    -- COMPACTS
    {label = "Blista", model = "blista", price = 14000},
    {label = "Issi", model = "issi2", price = 18000},
    {label = "Dilettante", model = "dilettante", price = 12000},
    {label = "Panto", model = "panto", price = 10000},
    {label = "Prairie", model = "prairie", price = 15000},

    -- COUPÉS
    {label = "Zion", model = "zion", price = 22000},
    {label = "Felon", model = "felon", price = 28000},
    {label = "Sentinel", model = "sentinel", price = 26000},
    {label = "Oracle", model = "oracle2", price = 30000},
    {label = "F620", model = "f620", price = 32000},

    -- BERLINES
    {label = "Tailgater", model = "tailgater", price = 30000},
    {label = "Stanier", model = "stanier", price = 15000},
    {label = "Schafter", model = "schafter2", price = 35000},
    {label = "Fugitive", model = "fugitive", price = 24000},
    {label = "Ingot", model = "ingot", price = 10000},
    {label = "Asea", model = "asea", price = 9000},
    {label = "Super Diamond", model = "superd", price = 65000},

    -- MUSCLE CARS
    {label = "Dominator", model = "dominator", price = 45000},
    {label = "Gauntlet", model = "gauntlet", price = 48000},
    {label = "Vigero", model = "vigero", price = 32000},
    {label = "Ruiner", model = "ruiner", price = 30000},
    {label = "Sabre Turbo", model = "sabregt", price = 36000},
    {label = "Blade", model = "blade", price = 28000},

    -- SPORTIVES
    {label = "Comet", model = "comet2", price = 75000},
    {label = "Fusilade", model = "fusilade", price = 52000},
    {label = "Jester", model = "jester", price = 82000},
    {label = "Massacro", model = "massacro", price = 85000},
    {label = "9F", model = "ninef", price = 95000},
    {label = "Buffalo S", model = "buffalo2", price = 68000},
    {label = "Kuruma", model = "kuruma", price = 72000},
    {label = "Elegy Retro", model = "elegy", price = 90000},

    -- SUPERSPORTS
    {label = "Adder", model = "adder", price = 650000},
    {label = "Entity XF", model = "entityxf", price = 450000},
    {label = "T20", model = "t20", price = 720000},
    {label = "Osiris", model = "osiris", price = 690000},
    {label = "Zentorno", model = "zentorno", price = 680000},
    {label = "Reaper", model = "reaper", price = 510000},
    {label = "Bullet", model = "bullet", price = 290000},

    -- SUV
    {label = "Rocoto", model = "rocoto", price = 38000},
    {label = "Dubsta", model = "dubsta", price = 42000},
    {label = "Granger", model = "granger", price = 35000},
    {label = "Baller", model = "baller2", price = 48000},
    {label = "Huntley S", model = "huntley", price = 55000},
    {label = "Radi", model = "radi", price = 25000},

    -- MOTOS
    {label = "Bati 801", model = "bati", price = 22000},
    {label = "Sanchez", model = "sanchez", price = 8000},
    {label = "Double-T", model = "double", price = 18000},
    {label = "PCJ 600", model = "pcj", price = 12000},
    {label = "Akuma", model = "akuma", price = 16000},
    {label = "Daemon", model = "daemon", price = 15000},

    -- LUXE
    {label = "Schafter V12", model = "schafter3", price = 95000},
    {label = "Cognoscenti", model = "cog55", price = 120000},
    {label = "Windsor", model = "windsor", price = 140000},
    {label = "Windsor Drop", model = "windsor2", price = 155000}
}


RegisterNetEvent("goswa_concess:getVehicles")
AddEventHandler("goswa_concess:getVehicles", function()
    TriggerClientEvent("goswa_concess:sendVehicles", source, VEHICLES)
end)

-- Vente véhicule
RegisterNetEvent("goswa_concess:sellVehicle")
AddEventHandler("goswa_concess:sellVehicle", function(target, model, price)
    TriggerClientEvent("goswa_concess:buyVehicle", target, model, price)
end)
