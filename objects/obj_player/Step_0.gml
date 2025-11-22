 #region inputs

var _i = global.inputs

#endregion

var _chao = place_meeting(x,y+1,colisores)
var _move = _i.right  - _i.left

if(vspd>=30) altura_certa = 1;
	

swipe() // espelha o sprite do player de acordo com o hspd
coyte() //a função que roda o código do efeito coyote
combo() // reduz o combo_time e o torna falso se chegar a 0



switch(state)
{
	case "iddle":
	{
		sprite_index = spr_player_iddle
		move_and_fall()//faz o player se movimentar
		jump()// muda para o stado de pulo e pula
		hit()//muda para o estado de hit
		dashing()
		fall_strong()// se o player cair de certa altura a tela treme
		spd = lerp(spd,def_spd,1)
		attack()
		trampolin_meet()

		
  		if(hspd!=0)
		{
			sprite_index = spr_player_run_3
			if(_i.run)
			{
				state = "run"
				image_index = 0

			}
		}

	
	}
	break;
	
	
	case "run":
	{
		spd = lerp(spd,spd_max,0.1)
		trampolin_meet()

		hspd = _move *  spd
		vspd = grv + vspd
		dashing()
		jump()
		hit()
		fall_strong()
		attack()
		
		
		sprite_index = spr_player_run_2
		
		
		if(!_i.run or hspd==0)
		{
			state = "iddle"
		}
		
	}
	break;
	
	
	case "jump":
	{
		
		sprite_index = spr_player_jump
		spd = lerp(spd,def_spd,0.07)
		trampolin_meet()
		dashing()
		move_and_fall()
		hit()
		fall_strong()
		attack()
		
		
		if(image_index>= image_number -1 or _chao)
		{
			state = "iddle"
			image_index = 0
		}
		
	}
	break;
	
	
	case "attack":
	{
		hspd = 0
		hit()
		fall()
		sprite_index = spr_player_atk
		trampolin_meet()

		
		if(_i.attack)
		{
			
			combo_action = 1
			combo_time = combo_def_time
			
			}
		
		if(image_index>=image_number-1)
		{
			
			if(combo_action)
			{
				
				image_index = 0
				state = "combo_1"
				

			}
			else
			{
				state = "iddle"
			}
		}
		
		
	}
	break;
	
	case "combo_1":
	{
		hspd = 0
		hit()
		fall()
		trampolin_meet()

		sprite_index = spr_player_atk
		
		if(_i.attack)
		{
			
			combo_action = 1
			combo_time = combo_def_time
			
			}
		
		if(image_index>=image_number-1)
		{
			
			if(combo_action)
			{
				
				image_index = 0
				state = "combo_2"
				

			}
			else
			{
				
				state = "iddle"		
			}
		}
	}
	break;
	case "combo_2":
	{
		hspd = 0
		hit()
		fall()
		trampolin_meet()

		sprite_index = spr_player_atk
		if(_i.attack)
		{
			
			combo_action = 1
			combo_time = combo_def_time
			
			}
		
		if(image_index>=image_number-1)
		{
				state = "iddle"		
		}
	}
	break;
	
	
	
	
	
	
	case "hit":
	{
		
		morte = 1
		Obj_tremetala.treme = 50;
		hit_time--
		sprite_index = spr_player_destroy
		hspd = lengthdir_x(hit_strong,global.hit_dirh)
		vspd = lengthdir_y(hit_strong,global.hit_dirv)
		if(hit_time<=0)
		{
			state = "morte"
						image_index = 0
			hit_time = hit_cooldown
		}
		
	}
	break;
	
	
 	case "morte":
	{
		sprite_index = spr_player_destroy

		
		
		if(image_index>=image_number-1)
		{
			global.score = 0;
			room_restart()
		}
	}
	break;
	
	
	case "trampolin":
	{
		
		trampolin_time--;
		hit()
		dashing()
		hspd = lengthdir_x(trampolin.force,trampolin.image_angle);
		vspd = lengthdir_y(trampolin.force,trampolin.image_angle);
		if(trampolin_time<=0)
		{
			state = "iddle";
			trampolin_time = trampolin_def_time;
						image_index = 0
		}
		
	}
	break;
	
	case "dash":
	{
		spd = dash._speed
		sprite_index = spr_player_run_2
		hit()
		fall()
		jump()
		trampolin_meet()		
		hspd = lengthdir_x(spd,dir)
		if(image_index >= image_number-1)
		{
			dash.cooldown = dash.def_cooldown
			dash.can = false
			state = "iddle"
		}
		
	}
	break;
	
}

if(morte)
{
	state = "morte"
}
show_debug_message(combo_time)





 