/////////////
// Gravity //
/////////////
_vertical_distance += _gravity

if (place_meeting(x, y + _vertical_distance, oSolid)) {
	while (not place_meeting(x, y + sign(_vertical_distance), oSolid)) {
		y += sign(_vertical_distance) 
	}
	_vertical_distance = 0
}
if (place_meeting(x + _horizontal_distance, y, oSolid)) {
	while (not place_meeting(x + sign(_horizontal_distance), y, oSolid)) { 
		x += sign(_horizontal_distance) 
	}
	_horizontal_distance = 0
}

y += _vertical_distance
x += _horizontal_distance

if (_was_hit == true) {
	if (collision_circle(x, y, 30, oGum, true, true) or _buffer == 0) {
		speed = 0
		_was_hit = false
		_buffer = 40
	}
	_buffer -= 1
}

if (place_meeting(x, y, oSolid)) {
	y -= 1
}
if (place_meeting(x, y, oGum)) {
	x += 1
}
show_debug_message(_buffer)
