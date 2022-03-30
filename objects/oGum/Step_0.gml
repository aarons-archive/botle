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

y += _vertical_distance


///////////////////
// State machine //
///////////////////
switch(_state) {
    case States.SHOOTING:
		break;
	default:
		_gum_movement()
		_gum_shoot()
		break;
}

