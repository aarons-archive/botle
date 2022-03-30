function _gum_movement() {
	
	// get movement input values
	var _horizontal_input = keyboard_check(_keyboard_right_key) - keyboard_check(_keyboard_left_key)
	var _vertical_input = keyboard_check(_keyboard_down_key) - keyboard_check(_keyboard_up_key)
	
	_horizontal_distance = _direction * _move_speed
	_vertical_distance += _gravity
	
	// check for collisions
	if (place_meeting(x + _horizontal_distance, y, oSolid)) {
		while (not place_meeting(x + sign(_horizontal_distance), y, oSolid)) {
			x += sign(_horizontal_distance)
		}
		_horizontal_distance = 0
	}
	if (place_meeting(x, y + _vertical_distance, oWall)) {
		while (not place_meeting(x, y + sign(_vertical_distance), oSolid)) {
			y += sign(_vertical_distance)
		}
		_vertical_distance = 0
	}
	
	// actually move player
	x += _horizontal_distance
	y += _vertical_distance
}
