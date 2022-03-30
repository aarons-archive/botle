//Get inputs
var _keyRight = keyboard_check(ord("D"));
var _keyLeft =  keyboard_check(ord("A"));
var _keyJump =  keyboard_check_pressed(vk_space);
_keyDash = mouse_check_button_pressed(mb_left);
_keyChange = keyboard_check_pressed(vk_shift);

//State Machine
StateMachine();

//Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * hspWalk;

//haddsp stuff
if (haddsp > 0) haddsp -= 0.5;
else if (haddsp < 0) haddsp += 0.5;

//Work out where to move vertically
vsp += grv;

//Work out if we should jump
if state != "bottle"
{
	if (canJump-- > 0) && (_keyJump)
	{
		vsp = vspJump;
		canJump = 0;
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
x += hspMomentum;

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

//Waddle
if (hsp != 0 && vsp == 0 && (place_meeting(x, y + 5, oSolid)) && state == "bottle")
{
	waddle--;
	if (waddle >= 10) 
	{
		image_angle = 10;
		if (!audio_is_playing(snBottleWalk1)) audio_play_sound(snBottleWalk1,5,0);
	}
	else if (waddle < 10)
	{
		image_angle = -10;
		if (!audio_is_playing(snBottleWalk2)) audio_play_sound(snBottleWalk2,5,0);
	}
	if (waddle <= 0) waddle = 20;
}
else if (hsp != 0 && vsp == 0 && (place_meeting(x, y + 5, oSolid)) && state == "bag")
{
	waddle -= 0.5;
	sprite_index = sPlasticBag_Walking;
	if (waddle >= 10) 
	{
		image_angle = 10;
		if (!audio_is_playing(snBagWalk1)) audio_play_sound(snBagWalk1,5,0);
	}
	else if (waddle < 10)
	{
		image_angle = -10;
		if (!audio_is_playing(snBagWalk2)) audio_play_sound(snBagWalk2,5,0);
	}
	if (waddle <= 0) waddle = 20;
}




