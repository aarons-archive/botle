oGum._state = States.SHOOTING

_max_distance = 200
_is_retracting = false
_sticky_object = noone

image_angle = point_direction(oGum.x, oGum.y, mouse_x, mouse_y)
direction = point_direction(oGum.x, oGum.y, mouse_x, mouse_y)
speed = 5

function _retract_globjule() {
	image_angle = point_direction(oGum.x, oGum.y, x, y)
	direction = point_direction(x, y, oGum.x, oGum.y)
	speed = 5	
}

