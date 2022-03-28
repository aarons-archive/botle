/// @description Create Variables

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
_move_speed		= 2		// Amount of pixels to move left or right by when moving.
_jump_height	= 4		// Amount of pixels to move up by when jumping.
_gravity		= 0.5	// Amount of pixels to move down by when falling.
_on_ground		= false // Whether the Gum is currently on the ground or not.
_jumped			= true  // Whether or not the Gum has jumped.
_has_fired		= false  // Whether or not the Gum has a current strand.


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
_state					= States.IDLE	// The current state
_horizontal_distance	= 0				// The amount of pixels to move horizontally.
_vertical_distance		= 0				// The amount of pixels to move vertically.


// Movement
function _gum_movement() {
	
	// get movement direction
	var _direction = keyboard_check(_keyboard_right_key) - keyboard_check(_keyboard_left_key)
	
	_horizontal_distance = _direction * _move_speed
	_vertical_distance += _gravity
	
	if (place_meeting(x, y + 1, oSolid)) { _on_ground = true} else { _on_ground = false }
	
	// coyote time
	if (_on_ground) {
		_jumped = false
		_coyote_counter = _coyote_max
	}
	if (_coyote_counter > 0) {	
		_coyote_counter -= 1
	
		if (keyboard_check_pressed(_keyboard_jump_key) and not _jumped) {
			_coyote_counter = 0
			_jumped = true
			_vertical_distance = -_jump_height
		}	
	}

	// buffer jumping
	if (keyboard_check_pressed(_keyboard_jump_key)) { _buffer_counter = _buffer_max }
	if (_buffer_counter > 0) {
		_buffer_counter -= 1

		if (_on_ground) {
			_buffer_counter = 0
			_jumped = true
			_vertical_distance = -_jump_height	
		}
	}
	
	// check for horizontal collisions
	if (place_meeting(x + _horizontal_distance, y, oSolid)) {
		while (not place_meeting(x + sign(_horizontal_distance), y, oSolid)) { x += sign(_horizontal_distance) }
		_horizontal_distance = 0
	}
	// check for vertical collisions
	if (place_meeting(x, y + _vertical_distance, oSolid)) {
		while (not place_meeting(x, y + sign(_vertical_distance), oSolid)) { y += sign(_vertical_distance) }
		_vertical_distance = 0
	}
	
	// actually move player
	x += _horizontal_distance
	y += _vertical_distance
}

function _gum_shoot() {
	if (mouse_check_button(_mouse_fire_key)) { _has_fired = true } else { _has_fired = false }
}

