
global.input = 
{
    left :noone,
    right :noone,
    jump :noone,
    sprint :noone
}
function scr_global_inputs()
{ 
    global.input.left   = keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad_id,gp_axislh) < - 0.25
    global.input.right  = keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad_id,gp_axislh) >  0.25
    global.input.jump   = keyboard_check(vk_space) or gamepad_button_check_pressed(global.gamepad_id,gp_face1)
    global.input.sprint = keyboard_check(vk_shift) or gamepad_button_check(global.gamepad_id,gp_face3)
    
}