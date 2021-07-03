fx_version 'adamant'
games { 'gta5' };
author 'BrownyProd';
description 'Identity creation {RageUI} resource by BrownyProd'
client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/Audio.lua",
    "src/components/Enum.lua",
    "src/components/Keys.lua",
    "src/components/Rectangle.lua",
    "src/components/Sprite.lua",
    "src/components/Text.lua",
    "src/components/Visual.lua",
    "src/menu/elements/ItemsBadge.lua",
    "src/menu/elements/ItemsColour.lua",
    "src/menu/elements/PanelColour.lua",
    "src/menu/items/UIButton.lua",
    "src/menu/items/UICheckBox.lua",
    "src/menu/items/UIList.lua",
    "src/menu/items/UIProgress.lua",
    "src/menu/items/UISeparator.lua",
    "src/menu/items/UISlider.lua",
    "src/menu/items/UISliderHeritage.lua",
    "src/menu/items/UISliderProgress.lua",
    "src/menu/panels/UIButtonPanel.lua",
    "src/menu/panels/UIColourPanel.lua",
    "src/menu/panels/UIGridPanel.lua",
    "src/menu/panels/UIPercentagePanel.lua",
    "src/menu/panels/UIStatisticsPanel.lua",
    "src/menu/windows/UIHeritage.lua",
}
client_script 'client/cl_identity.lua'
server_script 'server/sv_identity.lua'
server_script "@mysql-async/lib/MySQL.lua"