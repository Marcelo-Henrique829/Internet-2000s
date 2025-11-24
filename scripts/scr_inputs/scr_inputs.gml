      // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//inputs
global.inputs = {
	
	//teclas pressionadas
	left_p:false,	
	right_p:false,	
	
	left:false,	
	right:false,
	jump:false,
	interact:false,
	up:false,
	down:false,
	run:false,
	attack:false,
	dash:false
}
	
 player_cord = {

	x:false,
	y:false
}

global.gamepad_id = noone

function scr_inputs(_bool)
{
	if(!_bool) return;
	
	var _i = global.inputs
	
	_i.left = keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_axis_value(global.gamepad_id,gp_axislh) < -0.5;
	_i.right = keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_axis_value(global.gamepad_id,gp_axislh) > 0.5
	_i.jump = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	_i.interact = keyboard_check_pressed(vk_enter)
	_i.up = keyboard_check(ord("W")) or  keyboard_check(vk_up)
	_i.down = keyboard_check(ord("W")) or keyboard_check(vk_down)
	_i.run = keyboard_check(vk_lshift)  or gamepad_button_check(global.gamepad_id,gp_face4)
	_i.attack = keyboard_check_pressed(ord("J")) or mouse_check_button_pressed(mb_left)  or gamepad_button_check_pressed(global.gamepad_id,gp_face3)
	_i.dash = keyboard_check_pressed(ord("L"))  or gamepad_button_check_pressed(global.gamepad_id,gp_face2)


	
	
	_i.left_p = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left)
	_i.right_p = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right)
	

}


