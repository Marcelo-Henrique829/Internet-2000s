 #region inputs


#endregion
var i = global.input
var _chao = place_meeting(x,y+1,colisores)
var _move = i.right - i.left
var _hit = place_meeting(x,y,inimigo)


if(hspd!=0) //este código faz a sprite do player virar para esquerda e para direita
{
	image_xscale = sign(hspd)
}


if(i.sprint and _move!=0) //para o player correr
{
	spd = spd_max

}
else
{
	spd = def_spd;
	
}

if(vspd>=22) altura_certa = 1;
	

coyte() //a função que roda o código do efeito coyote

switch(state)
{
	case STATE.IDDLE:
	{
		sprite_index = spr_stickman_iddle
		
		hspd = spd*_move
		vspd = grv + vspd
		
 		if(hspd!=0)
		{
			sprite_index = spr_stickman_run
			if(i.sprint)
			{
				sprite_index = spr_gotta_go_fast02

			}
		}

		
		
		
		if(coyte_time  and i.jump)
		{
			vspd -= jump_force
			
			state = STATE.JUMP
		}
		
		if(_hit)
		{
			state = STATE.HIT
		}
		
		
		
		if(!_chao and place_meeting(x+sign(hspd),y,obj_grude))
		{
			state = STATE.HANGING
		}
		
	
		if(_chao and altura_certa)
		{
			instance_create_layer(x,y+sprite_height,layer,obj_smoke_jump_effect)
			altura_certa = 0;
			Obj_tremetala.treme = 20;

		}
	
	}
	break;
	
	case STATE.JUMP:
	{
		
		
		
		sprite_index = spr_stickman_jump
		hspd = spd*_move
		vspd = grv + vspd
		
		if(scr_end_animation(spr_stickman_jump) or _chao)
		{
			state = STATE.IDDLE
		}
		
		if(_hit)
		{
			state = STATE.HIT
		}
		
		if(_chao and altura_certa)
		{
			instance_create_layer(x,y+sprite_height-30,layer,obj_smoke_jump_effect)
			altura_certa = 0;
			Obj_tremetala.treme = 20;

		}
		
		
		
		if(!_chao and place_meeting(x+sign(hspd),y,obj_grude))
		{
			state = STATE.HANGING
		}

		
	}
	break;
	
	case STATE.HIT:
	{
		
		morte = 1
		Obj_tremetala.treme = 50;
		hit_time--
		sprite_index = spr_stickman_hit
		hspd = lengthdir_x(hit_strong,global.hit_dirh)
		vspd = lengthdir_y(hit_strong,global.hit_dirv)
		if(hit_time<=0)
		{
			state = STATE.DEFEAT
			hit_time = hit_cooldown
		}
		
	}
	break;
	
	case STATE.HANGING:
	{
	
				
			vspd = 0;
			sprite_index = spr_stickman_pendurado
			if(i.jump)
			{
					vspd -= jump_force
					hspd = _move * spd
					state = STATE.JUMP
					
			}
			
			if(_hit)
			{
				state  = STATE.HIT
			}
	
	}
	break;
	
	case STATE.DEFEAT:
	{
		sprite_index = spr_stickman_destroy

		
		
		if(image_index>=image_number-1)
		{
			global.score = 0;
			room_restart()
		}
	}
	break;
	
	case STATE.APEAR:
	{
		hspd = 0;
		
		sprite_index = spr_stickman_apear
		if(scr_end_animation(spr_stickman_apear))
		{
			state = STATE.IDDLE
		}
		
		
	}
	break;
	
	
	case"pre_trampolin":
	{
		state = "trampolin"
	}
	break;
	
	case "trampolin":
	{
		trampolin_time--;
		
		hspd = lengthdir_x(trampolin.force,trampolin.image_angle);
		vspd = lengthdir_y(trampolin.force,trampolin.image_angle);
		
		if(_hit) state = STATE.HIT;
		
		if(trampolin_time<=0)
		{
			state = STATE.IDDLE;
			trampolin_time = trampolin_def_time;
		}
		
	}
	break;
	
}


if(morte)
{
	state = STATE.DEFEAT
}
show_debug_message(altura_certa)




 