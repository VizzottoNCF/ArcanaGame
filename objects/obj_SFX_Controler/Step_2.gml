// get the volume
var _sfxVol = 1 * global.MasterVolume



// coin sound
if coinSnd == true
{
	// play sound
	var _snd = audio_play_sound(snd_wahwah, 8, false)
	audio_sound_gain(_snd, _sfxVol, 0)
	
	// reset variable
	coinSnd = false
}