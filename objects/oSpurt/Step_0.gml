x = oPlayer.x;
y = oPlayer.y;
image_angle = point_direction(x,y,mouse_x,mouse_y) - 90;
if (oPlayer.dash < 1 && spurtDuration > 0)
{
	image_index = 1;
	spurtDuration--;
}
//else if 
{
	image_index = 0; 
	spurtDuration = 30;
}
