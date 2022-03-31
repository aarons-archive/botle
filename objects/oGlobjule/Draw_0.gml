draw_self()

var _distance = point_distance(x, y, oPlayer.x, oPlayer.y)
var _angle = point_direction(x, y, oPlayer.x, oPlayer.y)
var _number = _distance / 1

for (var i = 0; i < _number; i++) {
	draw_sprite_ext(
		sStrand, 0,
		x + lengthdir_x(1 * i, _angle), 
		y + lengthdir_y(1 * i, _angle),
		1, 1, 
		_angle, 
		c_white, 1
	)
}

