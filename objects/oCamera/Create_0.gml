/// @description Values

// Viewbox
camWidth = 1366
camHeight = 768


follow = oPlayer_Origin
if (instance_exists(follow))
{
	xTo = follow.x
	yTo = follow.y
}


x = follow.x
y = follow.y 


// VFXs
fade = false
sqcFade = noone


// Limitações para a camera em certas cenas
// "Muro" -- Floresta inicial, camera não pode ir além do muro antes de abrir a porta
CameraLimitX = ""
CameraLimitY = ""

h_bound = false
v_bound = false