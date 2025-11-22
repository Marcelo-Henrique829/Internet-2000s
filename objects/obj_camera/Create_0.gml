
#region // Configs

    global.cam_w = 640
    global.cam_h = 360
    global.view_width  = 1920;  
    global.view_height = 1080; 
    
    resolution_def_scale = 1//escala da resolução da camera
    resolution_scale = resolution_def_scale
    
    cam_spd = 0.4;

#endregion

target = obj_player;

surface_resize(application_surface, global.view_width,global.view_height); //aplicando a resolução
camera_set_view_size(view_camera[0],global.cam_w, global.cam_h); // aplicando a área que a câmera cobre

follow_player_fn = function()
{
    if (instance_exists(target))
    {
        var _x1 = x - global.cam_w / 2; //variavel que vai seguir o x do jogador
        var _y1 = y - global.cam_h / 2; //variavel que vai seguir o y do jogador
        
        _x1 = clamp(_x1, 0, room_width - global.cam_w); //clamp pra limitar o x da camera
        _y1 = clamp(_y1, 0, room_height - global.cam_h); //clamp pra limitar o y da camera
        
        camera_set_view_pos(view_camera[0],_x1,_y1); //comando que vai fazer a camera seguir o jogador
        
        x = lerp(x,target.x,cam_spd)
        y = lerp(y,target.y,cam_spd)
    }
}