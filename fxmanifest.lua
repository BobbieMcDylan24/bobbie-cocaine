fx_version 'cerulean'
game 'gta5'

author 'Bobbie McDylan'
description 'Comprehensive cocaine workflow for QBCore, including harvesting, processing, and NPC sales with ox_inventory and progressBar'
version '1.0.0'

shared_scripts {
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}
