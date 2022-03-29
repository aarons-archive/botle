draw_self()

var _distance = point_distance(x, y, oGum.x, oGum.y)
var _angle = point_direction(x, y, oGum.x, oGum.y)
var _spacing = 1
var _number = _distance / _spacing

for (var i = 0; i < _number; i++) {

	var _x = x + lengthdir_x((_spacing * i), _angle)
	var _y = y + lengthdir_y((_spacing * i), _angle)

	draw_sprite_ext(
		sStrand, 0,
		_x, _y,
		1, 1, 
		_angle, 
		c_white, 1
	)
}

