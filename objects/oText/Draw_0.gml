var halfw = w * 0.5;

//Draw The Box
draw_set_colour(c_lime);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,15,15,false); 
draw_sprite(sMarker,0,x,y+1);
draw_set_alpha(1);

//Draw Text
draw_set_colour(c_white);
draw_set_font(fSign);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x,y-h-border,text_current);

