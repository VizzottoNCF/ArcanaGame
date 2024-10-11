// Play target song
if songAsset != targetSongAsset
{
	// tell old song to fade out
	if audio_is_playing(songInstance)
	{
		// add songInstances to array of songs to fade out
		array_push(fadeOutInstances, songInstance)
		
		// add the songInstance's starting volume 
		array_push(fadeOutInstVol, fadeInInstVol)
		
		//add fadeOutInstTime
	}
	
	
	if audio_exists(targetSongAsset)
	{
		// play song and store instance
		songInstance = audio_play_sound(targetSongAsset, 4, true)
	
		// start the song at volume 0
		audio_sound_gain(songInstance, 0, 0)
	
		fadeInInstVol = 0
	}
	
	// set songAsset to match targetSongAsset
	songAsset = targetSongAsset
}


var _finalVol = global.MasterVolume * global.MusicVolume

// Volume Control
//Main song volume
if audio_is_playing(songInstance)
{
	// fade audio in
	if startFadeInTime > 0
	{
		if fadeInInstVol < 1 { fadeInInstVol += 1/startFadeInTime} else fadeInInstVol = 1	
	}
	// immediately start the song if fade in is 0 frames
	else
	{
		fadeInInstVol = 1
	}	
	
	// Actually set gain
	audio_sound_gain(songInstance, fadeInInstVol * _finalVol, 0)
}
