
--sounds for the game
audiogamebackground = audio.loadStream( "sounds/menuBackground.mp3")
audiomaingame = audio.loadStream( "sounds/gameBackground.mp3" )
audioClick = audio.loadSound( "sounds/sound_click.mp3")

onSound = true
onMusic = true

audio.reserveChannels( 1,2 )
--audio.reserveChannels( 2 )

function playSFX(soundfile, volumeLevel)
	if onSound == true then
		local volumeLevel = volumeLevel or 1.0
		audio.play( soundfile)
		audio.setVolume( volumeLevel, {soundfile})
	end
end

-- FOR TITLE MUSIC --

function playGameMusic( soundfile )

	if onMusic == true then
		audio.play( soundfile , {channel = 1, loops = -1} )
	end
end

function stopGameMusic(soundfile)
	if onSound==true then
		audio.stop(1)
	end	
end

function resetMusic( soundfile )
	if onMusic == true then
		audio.stop(1)
		audio.rewind(audiogamebackground)
	end
end

function pauseMusic (soundfile)
	if onMusic == true then 
	audio.pause()
	end
end

function resumeMusic (channel)
	if onMusic == true then 
	audio.resume(channel)
	end
end


-- FOR MAIN GAME MUSIC IN LEVELS

function playMainGameMusic(soundfile)
	if onMusic == true then
		audio.play( soundfile , {channel = 2, loops = -1} )
	end
end

function stopMainGameMusic(soundfile)
	if onSound == true then
		audio.stop( 2 )
	end
end

function resetMainGameMusic(soundfile)
	if onSound==true then
		audio.rewind(audiomaingame)
	end
end


