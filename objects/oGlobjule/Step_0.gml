
if (_is_retracting == true) {

	_retract_globjule()
	
	if (_sticky_object != noone) {
		_sticky_object.direction = point_direction(x, y, oGum.x, oGum.y)
		_sticky_object.speed = 5
		_sticky_object._was_hit = true
		_sticky_object = noone
	}
	
	if (place_meeting(x, y, oGum)) {
		instance_destroy()
	}
}

else {

	_sticky_object = instance_place(x, y, oStickyObject)
	
	if (
		_sticky_object != noone 
		or 
		point_distance(oGum.x, oGum.y, x, y) > _max_distance
		or
		place_meeting(x, y, oSolid)
		or 
		mouse_check_button_released(oGum._mouse_fire_key)
	) {
		_is_retracting = true  
	}

}

