/// @description Insert description here
// You can write your code in this editor
scr_pou(obj_pop_up)


if(place_meeting(x,y,obj_mouse))
{
	if(mouse_check_button_pressed(mb_left))
	{
		state = "hit"
		life--
	}
}


if(life<=0)
{
	state = "die"
}


switch(state)
{
	case "apear":
	{
		sprite_index = spr_popup_apear
		
		
		if(image_index>=image_number-1)
		{
			state = "iddle"
		}
	}
	break;
	
	case "iddle":
	{
		var _rI = random_range(50,200)
		var _rII = random_range(300,500)
		
		
		
		sprite_index = spr_pop_up
		
		
		if(distance_to_object(obj_player)>_rII)
		{
			x = obj_player.x + sign(obj_player.hspd*-1) * _rI
			y = obj_player.y + sign(obj_player.vspd*-1) * _rI
			state = "apear"
		}
	}
	break;
	
	case "hit":
	{
		sprite_index = spr_popup_hit
		
		
		if(image_index>=image_number-1)
		{
			state = "iddle"
		}
		
		if(place_meeting(x,y,obj_mouse))
		{
			if(mouse_check_button_pressed(mb_left))
			{
				image_index = 0;
			}
		}
	}
	break;
	
	case "die":
	{
		sprite_index = spr_popup_destroy
		if(image_index>=image_number-1)
		{
			instance_destroy()
		}
		
	}
	break;
	
	
	
}

show_debug_message(life)