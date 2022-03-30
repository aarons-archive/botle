grv = 0.2; //gravity
hsp = 0; //current horizontal speed
haddsp = 0;
vsp = 0; //current vertical speed
hspWalk = 3.5; //walk speed
vspJump = -6; //jump speed
canJump = 0; //are we touching the ground
state = "bottle";
_keyChange = 0;
_keyDash = 0;
jumpspeed = 4;
jumpcap = 10; 
dash = 0;
waddle = 20;
image_speed = 0;

//Gum stuff
_state					= States.IDLE
_horizontal_distance	= 0	// The amount of pixels to move horizontally.
_vertical_distance		= 0	// The amount of pixels to move vertically.
_direction				= 1 // The players direction, 1 for left, -1 for right.
_globjule				= noone;
function _gum_shoot() {
	if ((_keyDash) && _globjule == noone) { 
		_globjule = instance_create_layer(x, y, "Player", oGlobjule)
	}
}




