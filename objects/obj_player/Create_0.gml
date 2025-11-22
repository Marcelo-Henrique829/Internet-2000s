   
#region movimentação
	vspd = 0;
	hspd = 0;
	grv = 1;
	
	
	def_spd = 5;
	spd_max = 10;
	

	spd = def_spd;
	dir = 0;
	jump_force = 17;
	
	instance_create_layer(0,0,layer,obj_input_controler)
	
#endregion

#region estado/arrays
	global.tl_plataforma = layer_tilemap_get_id("tl_plataform")
	global.tl_virus = layer_tilemap_get_id("tl_virus")
	morte = 0;
	state = "iddle";
	colisores = [obj_parede,obj_grude,obj_par_colisor,global.tl_plataforma];
	inimigo = [obj_pop_up,obj_aviso,obj_xis,global.tl_virus]
	altura_certa = 0;
	attacking = 0
	
#endregion

#region hit

hit_cooldown = 10;
hit_time = hit_cooldown;
hit_strong = 10


#endregion

#region dash
dash = {
	
	
	_speed: 20,
    def_cooldown: 30,
    cooldown: 0, 
    can: true
	
}
can_dir = 1
dashing = function()
{
	var _i = global.inputs
	
	
	//resfriamento
	if(!dash.can)
	{
		dash.cooldown--
		if(dash.cooldown<=0)
		{
			dash.can = true
		}
	}
	
	if(_i.dash and dash.can)
	{
		state = "dash"
		image_index = 0;
	}

	
}
	

#endregion

#region coyote


coyote_def_time = 20;
coyte_time = coyote_def_time

 coyte = function()
 {
	if(place_meeting(x,y+1,colisores))
	{
		coyte_time = coyote_def_time
	}
	else
	{
		coyte_time--
	}
 }

#endregion

#region trampolin

trampolin_def_time = 10;
trampolin_time = trampolin_def_time;

trampolin = 0

trampolin_meet = function()
{
	var _trampolin = instance_place(x+sign(hspd)*3, y+sign(vspd)*3, obj_trampolin);
	
	if (_trampolin != noone) {
	    // Agora posso acessar as variáveis dele!
	    trampolin = _trampolin.id
		state = "trampolin"
	}

}

#endregion


#region métodos

swipe = function()
{
	if(hspd!=0)
	{
		image_xscale = sign(hspd)
	}
}


move_and_fall = function()
{
	var _i = global.inputs
	var _move = _i.right - _i.left
	
	hspd = spd*_move
	vspd = grv + vspd
}

fall = function()
{
	vspd = grv + vspd
}


jump = function()
{
	var _i = global.inputs
	if(coyte_time  and _i.jump)
		{
			vspd -= jump_force
			state = "jump"
			image_index = 0

		}
}

hit = function()
{
	if(place_meeting(x,y,inimigo))
	{
			state = "hit"
			image_index = 0
	}
}


fall_strong = function()
{
	if(place_meeting(x,y+1,colisores) and altura_certa)
		{
			instance_create_layer(x,y+sprite_height-80,layer,obj_smoke_jump_effect)
			altura_certa = 0;
			Obj_tremetala.treme = 20;

		}
}


attack = function()
{
	var _i = global.inputs
	if(_i.attack)
	{
		image_index = 0
		state = "attack"
	}
}
	

	

	
	


#endregion

#region combo


combo_action = false
combo_def_time = 20;
combo_time = combo_def_time

combo = function()
{
	
	if(combo_time>0)
	{
		combo_time--
	}
	else
	{
		combo_action = false
	}

		
	 
		
		
}


#endregion


global.hit_dirh = 1
global.hit_dirv = 1



 
