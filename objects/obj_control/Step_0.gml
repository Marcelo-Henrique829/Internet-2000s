/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("R"))) game_restart()

if(gerar_inimigos and alarm[0]<=0)
{
	if(!instance_exists(obj_pop_up) )
	{
		var _tempo = random_range(20,50)
		
		  alarm[0] = _tempo
	}
}

if (sla) obj_camera.resolution_scale = lerp(obj_camera.resolution_scale,1.1,0.1)


if(global.score != score_pontos)
{
	escala = lerp(escala,5,0.1)
	color = c_green
	
}
if(escala>1)
{
	score_pontos = global.score	
	escala = lerp(escala,1,0.1)
	
}
if(escala<=1.05) color = c_white




