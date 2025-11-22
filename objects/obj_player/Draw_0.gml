/// @description Insert description here
// You can write your code in this editor
draw_self()


	
			
		if(sprite_index == spr_player_atk)
		{
			
			if(image_index <= 1)
			{
				switch(dir)
				{
					case 0:
					{
					
						instance_create_layer(x+20,y,layer,obj_attack)
					
	 				}
					break;
				
					case 180:
					{
						instance_create_layer(x-20,y+10,layer,obj_attack)
					
					}
					break;
					
					
				
				}
			
			}
			else
			{
				instance_destroy(obj_attack)
			}
		
		
			
		}
		
		

	
	

