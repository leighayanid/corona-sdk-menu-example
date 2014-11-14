-- Rolly Bear World Project by Christian Peeters
-- See all tutorial @christian.peeters.com

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local physics = require("physics")
--local level01 = require("level01")
local sounds = require ("sounds")

-- local forward references should go here --

local function btnTap(event)
	event.target.xScale = 0.95
	event.target.yScale =0.95
	
	--storyboard.gotoScene (event.target.destination, { params ={levelNum = params.levelNum}, effect = "fade"} )
	if (event.target.destination == "exit") then
		os.exit()
	else 
		storyboard.gotoScene (event.target.destination,{ effect = "slideDown",delay=1000} )
	end	
	return true
	
end

 function catchBackgroundOverlay(event)
	return true 
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

local backgroundOverlay = display.newRect (group, leftScrn-1000, topScrn-1000, withScrn+1000, heightScrn+1000)
			backgroundOverlay:setFillColor( black)
			backgroundOverlay.alpha = 0.7
			backgroundOverlay.isHitTestable = true
			backgroundOverlay:addEventListener ("tap", catchBackgroundOverlay)
			backgroundOverlay:addEventListener ("touch", catchBackgroundOverlay)

local overlay = display.newImageRect ("images/overlay.png", 700 , 400)
			overlay.x = centerX
			overlay.y = centerY + 100
			group:insert (overlay)

local exitBtn = display.newImageRect ("images/noexitbutton.png", 150, 150 )
			exitBtn.x = centerX + overlay.width / 4
			exitBtn.y = centerY + overlay.height/2.2
			exitBtn.destination = "exit" 
			exitBtn:addEventListener("tap", btnTap)
			group:insert(exitBtn)	


local reloadBtn = display.newImageRect ("images/exitbutton.png" ,150, 150)
			reloadBtn.x = centerX - overlay.width / 4
			reloadBtn.y = centerY + overlay.height/2.2
			params = event.params
			reloadBtn.destination = "mainmenu"
			reloadBtn:addEventListener ("tap", btnTap)
			group:insert (reloadBtn)

end



-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view


end



scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )


return scene