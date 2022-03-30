//get player input
var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
var _left_held = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _right_held = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

//holding key down
var _repeat_spd = 8;
var _repeat_delay = 25;

//holding right
if _right time_held_right = _repeat_delay;
if time_held_right > 0
{
	time_held_right--;
	if time_held_right == 0 and _right_held
	{
		_right = true;
		time_held_right = _repeat_spd;
	}
}
//holding left
if _left time_held_left = _repeat_delay;
if time_held_left > 0
{
	time_held_left--;
	if time_held_left == 0 and _left_held
	{
		_left = true;
		time_held_left = _repeat_spd;
	}
}


var _move = _down - _up;
var _hmove = _right - _left;
if _move != 0 
{
	//move index
	index += _move;
	
	//clamp values
	var _size = array_length(menu[sub_menu]);
	if index < 0 index = _size - 1; //at start, so loop to menu end
	else if index >= _size index = 0; //at end, loop to menu start
}

if _select or (is_array(menu[sub_menu][index]) and (_hmove != 0))
{
	switch(sub_menu)
	{		
		case SETTINGS:
			switch(index)
			{
				case 0:
					//graphics
				break;
				case 1:
					//Sounds
					change_menu(_hmove, "sound");
				break;
				case 2:
					//Music
					change_menu(_hmove, "music");
					
					
				break; 
				case 3:
					//Controls
					
					
				break; 
				case 4:
					//Back
					sub_menu = SETTINGS;
					room_goto(r0_Menu);
					index = 1;
				break; 
			}
		case UPGRADES:
			switch(index)
			{
				case 0:
					//Health
					change_menu(_hmove, "health");
				break;
				case 1:
					//Damage
					change_menu(_hmove, "spear damage");
				break;
				case 2:
					//Spear Speed
					change_menu(_hmove, "spear speed");
				break;
				case 3:
					//Spear Recharge
					change_menu(_hmove, "spear recharge");
				break;
				case 4:
					//Back
					sub_menu = SETTINGS;
					index = 1;
				break; 
		break;
	}
	}
}

function change_menu(_move, _key)
{
	// change the ds map key entry by move value
	// move real which way to move selection
	// key string ds_map key for this selection
	
	//get the allowed limits for this selection
	//get map array
	var _map_arr = set[? _key];
	//get the limits array
	var _limits_arr = _map_arr[1];
	
	//is the first entry in the limits an int
	if is_real(_limits_arr[0]) 
	{
		//limits are index pos 0 and 1
		var _min = _limits_arr[0];
		var _max = _limits_arr[1];
	} else {
		//string entries , so limits are 0 and size of the array -1 
		var _min = 0;
		var _max = array_length(_limits_arr) - 1;
	}
	//move the selection
	_map_arr[@ 0] = clamp(_move + _map_arr[0], _min, _max);
}