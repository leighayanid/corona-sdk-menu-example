

--global variables
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2
withScrn = display.contentWidth
heightScrn = display.contentHeight
topScrn = display.screenOriginY
leftScrn = display.screenOriginX


backgroundfill = display.newRect(leftScrn, topScrn, withScrn, heightScrn)
local splash = display.newImage( "images/splash.png", 400, 400 )
splash.x = centerX
splash.y = centerY

local function endSplash( event )
	splash:removeSelf( )
	splash = nil

	gradient = graphics.newGradient(
 		{ 80, 211, 255 },
  		{80, 100, 180 },
  			"up" )
	backgroundfill:setFillColor(gradient)

	local storyboard = require ("storyboard")
	storyboard.purgeOnSceneChange = true
	storyboard.gotoScene ( "mainmenu", { effect = "slideDown"} )
end

--global listener for transition
listener = function (obj )
	
end

timer.performWithDelay( 4000 , endSplash )

