#macro SETTINGS 0
#macro UPGRADES 1
#macro set global.dsm_settings

global.dsm_settings = ds_map_create();
//global.dsm_upgrades = ds_map_create();

ds_map_add(set, "sound", [5, [0, 10]]);
ds_map_add(set, "music", [5, [0, 10]]);

time_held_right = 0;
time_held_left = 0;

//options sub menu 1
menu[SETTINGS][0] = ["Sound FX ", "sound"];
menu[SETTINGS][1] = ["Music ", "music"];
menu[SETTINGS][2] = "Back";


index = 0; //menu inded pos
sub_menu = 0;




