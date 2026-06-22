 /// @description Insert description here
// You can write your code in this editor

var _alpha = 1



draw_set_font(fnt_pixel_1)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

	 draw_text_ext_transformed_color(640/2,10,"Pontos:"+string(global.score),3,300,escala,escala,0,color,color,color,color,1)
	 
draw_set_font(-1)
draw_set_halign(-1)
draw_set_valign(-1)



if(obj_camera.alvo==obj_link_coletavel)
{
	
	draw_sprite_ext(spr_cinema,0,0,0,1,1,0,c_white,_alpha)
}

