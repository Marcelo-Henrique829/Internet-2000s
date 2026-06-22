function scr_colision(_objetos = []){
	
	// Guarda apenas a direcao do movimento. Assim a colisao anda de 1 em 1 pixel,
	// independente da velocidade atual ser positiva ou negativa.
	var _hspd = sign(hspd)
	var _vspd = sign(vspd)
	
	
	// Resolve a colisao horizontal primeiro. A cada pixel, testa se a proxima
	// posicao encosta em algum objeto da lista de colisores.
	repeat(abs(hspd))
	{
		if(place_meeting(x+_hspd,y,_objetos))
		{
			// Se houver parede/plataforma no caminho, para o movimento horizontal.
			hspd = 0
		}
		else
		{
			// Se o caminho estiver livre, anda 1 pixel na direcao do movimento.
			x+=_hspd
		}
	}
	
	// Depois resolve a colisao vertical, usando a mesma logica pixel a pixel.
	// Isso evita atravessar o chao ou o teto quando a velocidade fica alta.
	repeat(abs(vspd))
	{
		if(place_meeting(x,y+_vspd,_objetos))
		{
			// Encontrou um colisor acima/abaixo, entao para a queda ou subida.
			vspd = 0
		}
		else
		{
			// Caminho livre: move 1 pixel para cima ou para baixo.
			y+=_vspd
		}
	}

}
	
	
function scr_end_animation(_sprite)
{
	if(sprite_index == _sprite)
	{
		if(image_index>= image_number-1)
		{
			return 1
		}
		else
		{
			return 0
		}
	}
}

global.hit_dirh = 0;
global.hit_dirv = 0;
global.pendurado = 0
global.score = 0;

function scr_pou(_obj)
{
	if(obj_player.x>= _obj.x)
	{
		global.hit_dirh = 0;
		
	}
	else
	{
		global.hit_dirh = 180
	}
	
	if(obj_player.y>= _obj.y)
	{
		global.hit_dirv = 270
	}
	else
	{
		global.hit_dirv = 90
	}
	
	
}



function scr_pou_2()
{
	if(obj_player.x>= obj_parede.x)
	{
		global.pendurado = 180
		
	}
	else
	{
		global.pendurado = 0;
	}
	

}
