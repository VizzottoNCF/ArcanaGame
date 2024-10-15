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
		array_push(fadeOutInstTime, endFadeOutTime)
		
		// reset songInstance and songAsset variables
		songInstance = noone
		songAsset = noone
	}
	
	// Play song if old song has faded out
	if array_length(fadeOutInstTime) == 0
	{
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
	
	// Fading song out
	for(var i = 0; i < array_length(fadeOutInstances); i++)
	{
		// Fade the volume
		if fadeOutInstTime[i] > 0
		{
			if fadeOutInstVol[i] > 0 {fadeOutInstVol[i] -= 1/fadeOutInstTime[i] }
		}
		
		// Immediately cut volume to 0 otherwise
		else
		{
			fadeOutInstVol[i] = 0
		}
		
		// Actually set the gain
		audio_sound_gain(fadeOutInstances[i], fadeOutInstVol[i]*_finalVol, 0)
		
		
		// Stop song when volume is at 0 and remove it from ALL arrays
		
		if fadeOutInstVol[i] <= 0
		{
			// stop the song
			if audio_is_playing(fadeOutInstances[i]) { audio_stop_sound(fadeOutInstances[i])}
			
			// remove it from arrays
			array_delete(fadeOutInstances, i, 1)
			array_delete(fadeOutInstVol, i, 1)
			array_delete(fadeOutInstTime, i, 1)
			
			// set the loop back 1 since an entry is being deleted
			i--
		}
	}









