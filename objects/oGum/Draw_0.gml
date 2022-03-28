draw_self();

if (_has_fired) {
	
	var _distance = point_distance(x, y, mouse_x, mouse_y)
	var _angle = point_direction(x, y, mouse_x, mouse_y)
	var _spacing = 1
	var _number = _distance / _spacing
	for (var i = 0; i < _number; i += 1) {
	    draw_sprite_ext(
			sStrand, 
			0, 
			x + lengthdir_x((_spacing * i), _angle), 
			y + lengthdir_y((_spacing * i), _angle), 
			1, 
			1, 
			_angle,
			c_white,
			1
		)
	}

}
