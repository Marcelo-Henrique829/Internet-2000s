x = mouse_x
y = mouse_y
depth = -9999
image_index = 0
var _meet = place_meeting(x,y,colisores)
if(_meet) image_index = 1 
    else image_index = 0

window_set_cursor(cr_none)