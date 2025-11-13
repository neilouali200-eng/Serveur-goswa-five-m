fx_version 'cerulean'
game 'gta5'

author 'TonPseudo'
description 'Custom EMS Pillbox Interior'
version '1.0.0'

-- Streamed assets
files {
    'stream/pillbox_props.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/pillbox_props.ytyp'

-- Client script
client_script 'client.lua'
