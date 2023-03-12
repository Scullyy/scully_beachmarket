fx_version 'cerulean'
game 'gta5'

lua54 'yes'

use_experimental_fxv2_oal 'yes'

author 'https://discord.gg/scully'
description 'A resource to change the interior of gabz beach market and sync it across all players including newly connected ones.'

dependencies {
    '/server:5848',
    '/onesync',
    'cfx-gabz-vbmarket'
}

shared_script 'config.lua'

client_script 'client/main.lua'

server_script 'server/main.lua'

escrow_ignore {
    'config.lua',
    'client/main.lua',
    'server/main.lua'
}