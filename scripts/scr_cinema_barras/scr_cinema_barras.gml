
function scr_cinema_barras(_percentual = 0.30, _cor = c_black, alpha = 1) 
{
	var _gui_largura = display_get_gui_width();
	var _gui_altura = display_get_gui_height();
	var _altura_barra = _gui_altura * clamp(_percentual, 0, 0.50);
	var _cor_anterior = draw_get_color();
	var _alpha_anterior = draw_get_alpha();

	draw_set_color(_cor);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, _gui_largura, _altura_barra, false);
	draw_rectangle(0, _gui_altura - _altura_barra, _gui_largura, _gui_altura, false);

	draw_set_color(_cor_anterior);
	draw_set_alpha(_alpha_anterior);
}
