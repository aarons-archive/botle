//////////////
// Keybinds //
//////////////
_keyboard_left_key = ord("A")
_keyboard_right_key = ord("D")
_keyboard_jump_key = vk_space
_mouse_fire_key = mb_left


//////////////////
// Basic values //
//////////////////
_move_speed		= 3		// Amount of pixels to move left or right by when moving.
_jump_height	= 5		// Amount of pixels to move up by when jumping.
_gravity		= 0.3	// Amount of pixels to move down by when falling.
_has_jumped		= true
_is_on_ground	= false


////////////////////
// Coyote Jumping //
////////////////////
_coyote_counter	= 0	// The amount of frames left before the coyote jump period runs out.
_coyote_max		= 8	// The amount of frames that the coyote jump period lasts for.


////////////////////
// Buffer Jumping //
////////////////////
_buffer_counter	= 0	// The amount of frames left before the buffer period runs out.
_buffer_max		= 6	// The amount of frames that the buffer period lasts for.


///////////////////
// Editable vars //
///////////////////
_state					= States.IDLE
_horizontal_distance	= 0	// The amount of pixels to move horizontally.
_vertical_distance		= 0	// The amount of pixels to move vertically.
_direction				= 1 // The players direction, 1 for left, -1 for right.
_globjule				= noone;


function _gum_movement() {

	if (place_meeting(x, y + 1, oSolid)) { 
		_is_on_ground = true
	} 
	else { 
		_is_on_ground = false 
	}
	
	_direction = keyboard_check(_keyboard_right_key) - keyboard_check(_keyboard_left_key)
	_horizontal_distance = _direction * _move_speed
	
	if (_is_on_ground) {
		_has_jumped = false
		_coyote_counter = _coyote_max
	}
	if (_coyote_counter > 0) {	
		_coyote_counter -= 1
	
		if (keyboard_check_pressed(_keyboard_jump_key) and not _has_jumped) {
			_coyote_counter = 0
			_has_jumped = true
			_vertical_distance = -_jump_height
		}	
	}

	if (keyboard_check_pressed(_keyboard_jump_key)) { 
		_buffer_counter = _buffer_max 
	}
	if (_buffer_counter > 0) {
		_buffer_counter -= 1

		if (_is_on_ground) {
			_buffer_counter = 0
			_has_jumped = true
			_vertical_distance = -_jump_height	
		}
	}
	
	if (place_meeting(x + _horizontal_distance, y, oSolid)) {
		while (not place_meeting(x + sign(_horizontal_distance), y, oSolid)) { 
			x += sign(_horizontal_distance) 
		}
		_horizontal_distance = 0
	}

	x += _horizontal_distance
}

function _gum_shoot() {
	if (mouse_check_button_pressed(_mouse_fire_key) == true and _globjule == noone) { 
		_globjule = instance_create_layer(x, y, "Instances", oGlobjule)
	}
}



