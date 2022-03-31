
if (_retracting == true) {

	image_angle = point_direction(oPlayer.x, oPlayer.y, x, y)
	direction = point_direction(x, y, oPlayer.x, oPlayer.y)
	speed = 10
	
	if (_sticky_object != noone) {
		_sticky_object._was_hit = true
		_sticky_object = noone
	}
	
	if (place_meeting(x, y, oPlayer)) {
		instance_destroy()
	}
}

else if (_retracting == false) {

	_sticky_object = instance_place(x, y, oStickyObject)
	
	// start retracting if..
	if (
		place_meeting(x, y, oSolid) // ..it hit a solid object (oCol, oStickyObject, etc) 
		or
		point_distance(oPlayer.x, oPlayer.y, x, y) > _max_distance // ..it travelled more than _max_distance
		or 
		mouse_check_button_released(mb_left) // ..the player released the fire key
	) {
		_retracting = true  
	}

}


