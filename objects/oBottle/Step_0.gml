
//Get inputs
var _keyRight = keyboard_check(ord("D"));
var _keyLeft =  keyboard_check(ord("A"));
var _keyJump =  keyboard_check_pressed(vk_space);
var _keyChange = keyboard_check_pressed(vk_shift);
var _keyDash = mouse_check_button_pressed(mb_left);
//Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * hspWalk;

//dash stuff
if (haddsp > 0) haddsp -= 0.5;
else if (haddsp < 0) haddsp += 0.5;

//Work out where to move vertically
vsp += grv;

//jumping
if (place_meeting(x,y+1,oSolid)) && (canJump-- > 0)
{
	//charged jumping
	if keyboard_check(vk_space) 
	{
		hspWalk = 0;	
		if jumpspeed > 10 jumpspeed = 10
		jumpspeed += 0.1;
	} else if keyboard_check_released(vk_space) {
		canJump = 0;
		vsp -= jumpspeed;
		jumpspeed = 4;
		hspWalk = 3.5;
	} else if keyboard_check_pressed(vk_space){ // jump normal
		 vsp -= jumpspeed;
	}
}


//Collide and Move
var hspMomentum = hsp + haddsp;
if (place_meeting(x + hspMomentum, y, oSolid)) 
{
    image_angle = 0;
    while (abs(hspMomentum) > 0.1) 
    {
        hspMomentum *= 0.5;
        if (!place_meeting(x + hspMomentum, y, oSolid)) x += hspMomentum;
    }
    hspMomentum = 0;
}
x +=hspMomentum;

if (place_meeting(x, y + vsp, oSolid)) 
{
    if (vsp > 0) canJump = 10;
	image_angle = 0;
    while (abs(vsp) > 0.1) 
    {
        vsp *= 0.5;
        if (!place_meeting(x, y + vsp, oSolid)) y += vsp;
    }
    vsp = 0;
}
y += vsp; 

if (place_meeting (x,y+1,oSolid)) dash = 1;
if (_keyDash) && (dash > 0) && vsp != 0
{
    if !((place_meeting (x,y+1,oSolid)) && (mouse_y > y))
    {
        dash--;
        haddsp = round(lengthdir_x(-15,point_direction(x,y,mouse_x,mouse_y)));
        if (mouse_y > y) //When mouse is above player
        {
            vsp = -3 + lengthdir_y(-8,point_direction(x,y,mouse_x,mouse_y));
        }
        else if (mouse_y > (y + 100))
        {
            vsp = 5 + lengthdir_y(-8,point_direction(x,y,mouse_x,mouse_y));    //When mouse is below player
        }    
        else vsp = -2 + lengthdir_y(-8,point_direction(x,y,mouse_x,mouse_y)); //When mouse is horizontal
    }
}


if vsp != 0
{
	image_angle = point_direction(x,y,mouse_x,mouse_y) - 90;
}
