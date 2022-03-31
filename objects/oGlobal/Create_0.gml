cursor_sprite = sCursor
window_set_cursor(cr_none)


if (instance_number(oPlayer) > 1) {
	instance_destroy(oPlayer)
}

