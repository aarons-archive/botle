if instance_number(oActivatedSave) >= 2
{
	instance_destroy();
	instance_create_layer(other.x,other.y,"Collision",oSaveSpot);
}
