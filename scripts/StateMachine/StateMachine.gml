function StateMachine() {

	if (state == Players.BOTTLE) {
	
		// Sprites
		sprite_index = sBottle
		
		//Variables
		grv = 0.2
		vspJump = -6
		hspWalk = 3.5
		
		// Jumping
		if (place_meeting(x,y+1,oSolid)) && (canJump-- > 0)
		{
			// Charged jumping
			if keyboard_check(vk_space) 
			{
				hspWalk = 0
				if jumpspeed > 9 jumpspeed = 9
				jumpspeed += 0.2;
				if (jumpspeed < 5) image_index = 1;
				else if (jumpspeed < 7) image_index = 2;
				else if (jumpspeed < 10) image_index = 3;
				ScreenShake(0.6,1);
			} 
			else if keyboard_check_released(vk_space) 
			{
				image_index = 0;
				canJump = 0;
				vsp -= jumpspeed;
				jumpspeed = 4;
				hspWalk = 3.5;
				audio_play_sound(snBottleJump,5,0);
			} 
			else if keyboard_check_pressed(vk_space)
			{ 
				// Normal jumping
				vsp -= jumpspeed
			}
		}
	
		// Dashing
		
		if (place_meeting (x,y+1,oSolid)) 
		{ 
			dash = 1; 
		}
		
		if (_keyDash) && (dash > 0) && vsp != 0 
		{
			ScreenShake(2,30);
		    if !((place_meeting (x,y+1,oSolid)) && (mouse_y > y)) 
			{
				if (!audio_is_playing(snBottleSquirt)) 
				{
					audio_play_sound(snBottleSquirt, 5, 0)
				}		
		        dash--
		        haddsp = round(lengthdir_x(-13,point_direction(x,y,mouse_x,mouse_y)))
				
		        if (mouse_y > y) // When mouse is above player
		        {
		            vsp = -3 + lengthdir_y(-7,point_direction(x,y,mouse_x,mouse_y))
		        }
				
		        else if (mouse_y > (y + 100))
		        {
		            vsp = 5 + lengthdir_y(-7,point_direction(x,y,mouse_x,mouse_y))    // When mouse is below player
		        }  
			
		        else 
				{
					vsp = -2 + lengthdir_y(-7,point_direction(x,y,mouse_x,mouse_y)) // When mouse is horizontal
				}
		    }
		}


		if vsp != 0 {
			image_angle = point_direction(x,y,mouse_x,mouse_y) - 90
		}

		// Switch player
		if (_keyChange) {
			ChangeState()
		}	
	}
	
	if (state == Players.PLASTIC_BAG) {
	
		// Set sprites
		sprite_index = sPlasticBag
		image_angle = 0;
		
		// Variables
		if vsp > 0 grv = 0.05;
		else grv = 0.15
		vspJump = -2;
		if (vsp != 0) hspWalk = 3;
		else hspWalk = 2;
		if (vsp < -6) vsp = -6;

		// Wind Mechanic
		if place_meeting(x,y,oRightWind) {
			sprite_index = sPlasticBag_Blown;
			haddsp = 12;
			grv = -0.3;
		}
		else if place_meeting(x,y,oLeftWind) {
			haddsp = -12;	
			grv = -0.3;
		}
		else {
			image_index = 0;
		}
		
		// Switch player
		if (_keyChange) {
			ChangeState()
		}		
	}
	
	if (state == Players.GUM) {
	
		// Set sprites
		sprite_index = sGum
		image_angle = 0
		
		// Set default values
		grv = 0.1
		vspJump = -1.5
		
		// Disallow walking while shooting
		if (_gum_has_shot == true) {
			hspWalk = 0
		}
		else {
			hspWalk = 2
		}

		// Shoot when mouse button is pressed and 
		if ((_keyDash) and (_gum_globjule == noone)) { 
			_gum_globjule = instance_create_layer(x, y, "Player", oGlobjule)
			_gum_has_shot = true
		}

		// Switch player
		if (_keyChange) {
			ChangeState()
		}
	}
}

