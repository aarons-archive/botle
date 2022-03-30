function StateMachine(){
if state == "bottle"
{
	sprite_index = sBottleNew;
	//Variables
	grv = 0.2;
	vspJump = -6;
	hspWalk = 3.5;
	//jumping
	if (place_meeting(x,y+1,oSolid)) && (canJump-- > 0)
	{
		//charged jumping
		if keyboard_check(vk_space) 
		{
			hspWalk = 0;	
			if jumpspeed > 9 jumpspeed = 9
			jumpspeed += 0.2;
			if (jumpspeed < 5) image_index = 1;
			else if (jumpspeed < 7) image_index = 2;
			else if (jumpspeed < 10) image_index = 3;
		} 
		else if keyboard_check_released(vk_space) 
		{
			image_index = 0;
			canJump = 0;
			vsp -= jumpspeed;
			jumpspeed = 4;
			hspWalk = 3.5;
		} 
		else if keyboard_check_pressed(vk_space)
		{ 
			// jump normal
			 vsp -= jumpspeed;
		}
	}
	
	//Dashing
	if (place_meeting (x,y+1,oSolid)) dash = 1;
	if (_keyDash) && (dash > 0) && vsp != 0
	{
	    if !((place_meeting (x,y+1,oSolid)) && (mouse_y > y))
	    {
			if (!audio_is_playing(snBottleSquirt)) audio_play_sound(snBottleSquirt, 5, 0); 
	        dash--;
	        haddsp = round(lengthdir_x(-13,point_direction(x,y,mouse_x,mouse_y)));
	        if (mouse_y > y) //When mouse is above player
	        {
	            vsp = -3 + lengthdir_y(-7,point_direction(x,y,mouse_x,mouse_y));
	        }
	        else if (mouse_y > (y + 100))
	        {
	            vsp = 5 + lengthdir_y(-7,point_direction(x,y,mouse_x,mouse_y));    //When mouse is below player
	        }    
	        else vsp = -2 + lengthdir_y(-7,point_direction(x,y,mouse_x,mouse_y)); //When mouse is horizontal
	    }
	}


if vsp != 0
{
	image_angle = point_direction(x,y,mouse_x,mouse_y) - 90;
}

	//Change Key
	if (_keyChange)
	{
		state = "bag";
		_keyChange = false;
	}	
}
if state == "bag"
{
	image_angle = 0;
	sprite_index = sPlasticBag;
	//Variables
	if vsp > 0 grv = 0.05;
	else grv = 0.15
	vspJump = -2;
	if (vsp != 0) hspWalk = 3;
	else hspWalk = 2;
	if (vsp < -6) vsp = -6;

	//Wind Mechanic
	if place_meeting(x,y,oRightWind) 
	{
		sprite_index = sPlasticBag_Blown;
		haddsp = 12;
		grv = -0.3;
	}
	else if place_meeting(x,y,oLeftWind) 
	{
		haddsp = -12;	
		grv = -0.3;
	}
	else image_index = 0;
	//Change Key
	if (_keyChange)
	{
		state = "gum";
		_keyChange = false;
	}		
}
if state == "gum"
{
	image_angle = 0;
	sprite_index = sGum;
	//Variables
	grv = 0.2;
	vspJump = -6;
	hspWalk = 2;
	
	//Change Key
	if (_keyChange)
	{
		state = "bottle";
		_keyChange = false;
	}	
}
}