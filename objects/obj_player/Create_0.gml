enum STATE 
{
    IDDLE,
    JUMP,
    HIT,
    HANGING,
    DEFEAT,
    APEAR
    	
}
#region movimentação
	vspd = 0;
	hspd = 0;
	grv = 0.7;
	spd = 5;
	def_spd = 5;
	dir = 0;
	spd_max = 7;
	jump_force = 20;
	
	instance_create_layer(0,0,layer,obj_input_controler)
#endregion

#region estado/arrays

	morte = 0;
	state = STATE.APEAR;
	colisores = [obj_parede,obj_grude,obj_par_colisor];
	inimigo = [obj_pop_up,obj_aviso,obj_xis]
	altura_certa = 0;
	
#endregion

#region hit

hit_cooldown = 10;
hit_time = hit_cooldown;
hit_strong = 10


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

#endregion



 
