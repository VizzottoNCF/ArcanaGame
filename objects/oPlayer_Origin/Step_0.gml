/// @description Insert description here

gf_player_update()


depth=-bbox_bottom


// draws sprites for body, cape and hat 
PlayerSillhouette_sprite_id.depth = depth+1
PlayerBody_sprite_id.depth = depth
PlayerCape_sprite_id.depth = depth-1
PlayerHat_sprite_id.depth = depth-2




 
//#region Câmera
//// Calcula coordenada para centralizar o jogador no centro das dimensões da câmera
//var xCam = clamp(oPlayer_Hitbox.x - view_wview /2,0,room_width-view_wview)
//var yCam = clamp(oPlayer_Hitbox.y - view_hview /2,0,room_width-view_hview)

//// Calcular current X e current Y da câmera
//var curX = camera_get_view_x(view_camera[0])
//var curY = camera_get_view_y(view_camera[0])

//// Realiza um lerp entre o X e o Y da câmera para o que centraliza o jogador
//// (para movimentação suave da camera)
//var newCamX = lerp(curX, xCam, 0.1)
//var newCamY = lerp(curY, yCam, 0.1)

//// Setta a posição nova da câmera
//camera_set_view_pos(view_camera[0], newCamX, newCamY)
//#endregion
