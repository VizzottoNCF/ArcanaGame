// info for curr song we are playing or trying to play
songInstance = noone // song currently playing
songAsset = noone // which song we should instanciate
targetSongAsset = OST_2_Name // which song we want to play
startFadeInTime = 0 // frames to fade in
endFadeOutTime = 0 // frames to fade out
fadeInInstVol = 1 //volume of songInstance


// fade music out and stop songs that are no longer playing
fadeOutInstances = array_create(0) // audio instance to fade out
fadeOutInstVol = array_create(0) // volumes of each audio
fadeOutInstTime = array_create(0) // time to fade out