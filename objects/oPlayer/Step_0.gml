//Get inputs
var _keyRight = keyboard_check(ord("D"));
var _keyLeft =  keyboard_check(ord("A"));
var _keyJump =  keyboard_check_pressed(vk_space);

//Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * hspWalk;

//Work out wher to move vertically
vsp += grv;

//Work out if we should jump
if (canJump-- > 0) && (_keyJump)
{
	vsp = vspJump;
	canJump = 0;
}


//Collide and Move
if (place_meeting(x + hsp, y, oSolid)) 
{
	while (abs(hsp) > 0.1) 
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oSolid)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oSolid)) 
{
	if (vsp > 0) canJump = 10;
	while (abs(vsp) > 0.1) 
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oSolid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;