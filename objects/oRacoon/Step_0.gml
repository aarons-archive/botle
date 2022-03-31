if collision_circle(x,y,60,oPlayer,false,true) && !instance_exists(oText)
{
	image_speed = 1;
	sprite_index = sTrashRacoonAppearing;
	if image_index = 18 
	{
		sprite_index = sTrashRacoonTalking;
		with (instance_create_layer(x,y-64,layer,oText))
		{
			text = other.text;
			length = string_length(text);
		}
	} 
} 

if !collision_circle(x,y,60,oPlayer,false,true)
{
	if instance_exists(oText) && image_index >= 2
	{
		alarm_set(0, 60)
		sprite_index = sTrashRacoonAppearing;
		image_index = 18;
		image_speed = -1;
	}
	if image_index == 2
	{
		image_index = 1;
		image_speed = 0;
	}	
}
