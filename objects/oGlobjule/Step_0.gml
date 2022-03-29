
if (_is_retracting == true) {

	_retract_globjule()
	
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
	) {
		_is_retracting = true  
	}

}


