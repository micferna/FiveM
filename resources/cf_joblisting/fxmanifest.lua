fx_version 'adamant'

game 'gta5'

client_scripts {
    'RageUI/src/RMenu.lua',
    'RageUI/src/menu/RageUI.lua',
    'RageUI/src/menu/Menu.lua',
    'RageUI/src/menu/MenuController.lua',

    'RageUI/src/components/*.lua',

    'RageUI/src/menu/elements/*.lua',

    'RageUI/src/menu/items/*.lua',

    'RageUI/src/menu/panels/*.lua',

    'RageUI/src/menu/panels/*.lua',
    'RageUI/src/menu/windows/*.lua',

}

client_scripts {
	'@es_extended/locale.lua',
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server.lua'
}

dependencies {
	'es_extended'
}
