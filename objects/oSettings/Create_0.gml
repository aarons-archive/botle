#macro SETTINGS 0
#macro UPGRADES 1
#macro set global.dsm_settings

global.dsm_settings = ds_map_create();
//global.dsm_upgrades = ds_map_create();

ds_map_add(set, "sound", [5, [0, 10]]);
ds_map_add(set, "music", [5, [0, 10]]);
ds_map_add(set, "health", [0, [0, 10]]);
ds_map_add(set, "spear damage", [0, [0, 5]]);
ds_map_add(set, "spear speed", [0, [0, 5]]);
ds_map_add(set, "spear recharge", [0, [0, 5]]);

time_held_right = 0;
time_held_left = 0;

//options sub menu 1
menu[SETTINGS][0] = "Graphics";
menu[SETTINGS][1] = ["Sound FX ", "sound"];
menu[SETTINGS][2] = ["Music ", "music"];
menu[SETTINGS][3] = "Controls";
menu[SETTINGS][4] = "Back";
//Upgrades sub menu 2
menu[UPGRADES][0] = ["Health ", "health"];
menu[UPGRADES][1] = ["Damage ", "spear damage"];
menu[UPGRADES][2] = ["Spear Speed ", "spear speed"];
menu[UPGRADES][3] = ["Spear Recharge ", "spear recharge"];
menu[UPGRADES][4] = "Back";


index = 0; //menu inded pos
sub_menu = 0;

