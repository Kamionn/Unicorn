fx_version 'adamant'
game 'gta5'
description '! Kamion#1323'
version '1.0.0'

files {
    'html/index.html',
    'html/js/*.js',
    'html/DEP/*.js',
    'html/img/**',
    'html/ProximaNova.woff'
}

shared_scripts {
    '@es_extended/locale.lua',
    'shared/*.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    "RageUI_V2/RMenu.lua",
    "RageUI_V2/menu/RageUI.lua",
    "RageUI_V2/menu/RageShared.lua",
    "RageUI_V2/menu/Menu.lua",
    "RageUI_V2/menu/MenuController.lua",
    "RageUI_V2/components/*.lua",
    "RageUI_V2/menu/elements/*.lua",
    "RageUI_V2/menu/items/*.lua",
    "RageUI_V2/menu/panels/*.lua",
    "RageUI_V2/menu/windows/*.lua",
    'locales/*.lua',
    'client/*.lua',
}

server_scripts{
    '@mysql-async/lib/MySQL.lua',
  --'@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'server/*.lua',
}