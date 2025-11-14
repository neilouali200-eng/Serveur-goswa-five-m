fx_version 'cerulean'
game 'gta5'

author 'TonNom'
description 'Système d\'entreprise avec tablette pour patrons et admins'
version '1.0.0'

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}
