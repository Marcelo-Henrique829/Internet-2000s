   

vspd = 0;
hspd = 0;
grv = 1;

def_spd = 5;
spd_max = 10;

spd = def_spd;
dir = 0;
jump_force = 25;


#region //animations funcitons

    iddle_anim_fn = function()
    {
       
        if(hspd!=0) sprite_index = spr_player_run_1 
        else sprite_index = spr_player_iddle  
            
        if(hspd!=0) image_xscale = sign(hspd)
    }


#endregion

#region //functions

    dir_fn = function()
    {
    
    	var _i = global.inputs
    	if(_i.left or _i.right)
    	{
    		dir = point_direction(0,0,_i.right - _i.left,0)
            spd = def_spd
    	}
        else spd = 0
    
    }
    
    move_and_fall_fn = function()
    {
        dir_fn()
        hspd = lengthdir_x(spd,dir)   
        vspd += grv
        vspd = clamp(vspd,-jump_force*5,15)
    
    }

    jump_fn = function()
    {
        var _i = global.inputs
        if(place_meeting(x,y+1,obj_wall))
        {
            if(_i.jump)
            {
                vspd -=jump_force
                image_index = 0
                state = jump_st;
            }
        }
    }

#endregion

 
iddle_st = function()
{
    move_and_fall_fn()
    iddle_anim_fn()
    jump_fn()
}

jump_st = function()
{
    move_and_fall_fn()
    sprite_index = spr_player_jump
    if(image_index>=image_number-1) image_index = image_number-2
    if(place_meeting(x,y+1,obj_wall)) state = iddle_st;
    if(hspd!=0) image_xscale = sign(hspd)
}

state = iddle_st;