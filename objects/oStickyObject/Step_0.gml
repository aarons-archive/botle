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


////////////////
// Retraction //
////////////////
if (_was_hit == true) {
	if (collision_circle(x, y, 25, oPlayer, true, true)) {
		speed = 0
		_was_hit = false
	}
	else {
		direction = point_direction(x, y, oPlayer.x, oPlayer.y)
		speed = 10
	}
}

if (place_meeting(x, y, oSolid)) {
	y -= 1
}
if (collision_rectangle(x - 10, y - 10, x + 10, y + 10, oPlayer, true, true)) {
	oPlayer.y -= 1
}


