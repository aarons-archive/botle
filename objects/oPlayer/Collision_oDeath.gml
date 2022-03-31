// Create Litter object upon death.
instance_create_layer(oPlayer.xprevious, oPlayer.yprevious + 10, "Player", oLitter)

// Destroy Gum Globjule opon death
if (_gum_globjule != noone) {
	instance_destroy(_gum_globjule)
	_gum_globjule = noone
}

