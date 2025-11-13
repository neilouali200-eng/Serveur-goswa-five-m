-- Client script for EMS Pillbox interior
-- Exemple pour téléporter et ajouter des props si nécessaire

local pillboxPos = vector3(300.0, -600.0, 43.3) -- coordonnées intérieures

RegisterCommand('emsmod', function()
    -- téléporte le joueur à l'intérieur
    SetEntityCoords(PlayerPedId(), pillboxPos.x, pillboxPos.y, pillboxPos.z)
    print("Bienvenue dans l'EMS custom!")
end)
