
camera_set_view_size(view_camera[0],global.cam_w, global.cam_h);          //aplicando o tamanho definido para a camera
surface_resize(application_surface, global.view_width,global.view_height) //aplicando a resolução pra superficie do jogo

resolution_scale = lerp(resolution_scale,resolution_def_scale,0.01)

if(!view_enabled)
{
    view_visible[0] = true;
    view_enabled = true;
}