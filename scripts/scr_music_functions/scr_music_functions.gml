///@param _song = set to any song asset
///@param _fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
///@param _fadeIn = time (in frames) the target song (if not "noone") will take to fade in
function set_song_ingame(_song, _fadeOutCurrSong = 0, _fadeIn = 0)
{
	with (obj_Music_Controller)
	{
		targetSongAsset = _song
		endFadeOutTime = _fadeOutCurrSong
		startFadeInTime = _fadeIn
	}	
}