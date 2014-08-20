local storyboard = require( "storyboard" )
local scene = storyboard.newScene( )
local sounds = require("sounds")
storyboard.purgeOnSceneChange = true


local function btnTap(event )
	playSFX(audioClick)
	if (event.target.destination == "mainmenu") then
		storyboard.gotoScene( event.target.destination , {effect = "slideDown"} )
	else 
		storyboard.gotoScene( event.target.destination , {effect = "slideUp"} )
	end
	
	return true

end


function scene:createScene( event )
	local group = self.view

	local howtoplaytitle = display.newImageRect("images/howtoplay.png", 1000, 200)
	howtoplaytitle.x = centerX
	howtoplaytitle.y = topScrn + howtoplaytitle.height - 80
	transition.from( howtoplaytitle, {time = 2000, delay = 1, y = (heightScrn - 1000), transition = easing.outExpo, onComplete=listener} )
	group:insert(howtoplaytitle)

	backbutton = display.newImageRect("images/reloadbutton.png", 110, 110 )
	backbutton.y = heightScrn - 0.6 * backbutton.height 
	backbutton.x = .6 * backbutton.width 
	backbutton.destination = "mainmenu"
	backbutton:addEventListener( "tap", btnTap )
	group:insert(backbutton)

end


function scene:enterScene( event )
	

end


function scene:exitScene( event )
	
	Runtime:removeEventListener( "tap", btnTap )
end

function scene:destroyScene( event )
	-- body
	Runtime:removeEventListener( "tap", btnTap )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene