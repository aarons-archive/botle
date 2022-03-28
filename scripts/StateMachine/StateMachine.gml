function StateMachine(){
if state == "bottle"
{
	sprite_index = sBottle;
	//Variables
	grv = 0.2;
	vspJump = -6;
	hspWalk = 3.5;
	
	//Change Key
	if (_keyChange)
	{
		state = "bag";
		_keyChange = false;
	}	
}
if state == "bag"
{
	sprite_index = sBag;
	//Variables
	grv = 0.05;
	vspJump = -2;
	hspWalk = 2;

	//Wind Mechanic
	if place_meeting(x,y,oRightWind) hsp += 4;
	if place_meeting(x,y,oLeftWind) hsp -= 4;
	
	//Change Key
	if (_keyChange)
	{
		state = "gum";
		_keyChange = false;
	}		
}
if state == "gum"
{
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