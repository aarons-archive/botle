function ChangeState() {
	switch(state) {
	
		case Players.BOTTLE:
			state = Players.PLASTIC_BAG
			break
			
		case Players.PLASTIC_BAG:
			state = Players.GUM
			break
			
		case Players.GUM:
		
			// Destroy Globjule if we are switching
			if (_gum_globjule != noone) {
				instance_destroy(_gum_globjule)
				_gum_globjule = noone
			}
			
			state = Players.BOTTLE
			break
	}
	_keyChange = false
}


