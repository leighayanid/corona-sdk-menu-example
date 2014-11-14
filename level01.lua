local storyboard = require("storyboard")
local scene = storyboard.newScene()
local physics = require("physics")
local sounds = require("sounds")
storyboard.purgeOnSceneChange = true

--start the physic
physics.start()
physics.setGravity( 0, 0 )

--accelerometer
--system.setAccelerometerInterval( 100 )

--variable for menu screen
local menuScreenGroup
--display your background image here
--local mmScreen = display.newImage("images/mmScreen.png")
local playBtn

--game screen

local audioGameBackground
local paddle
local brick
local ball

--score/level text
local scoreText
local scoreNum
local levelText
local levelNum

--alert display group
local alertDisplayGroup
local alertBox
local conditionDisplay
local messageText

--
local bricks = display.newGroup( )
local brickWidth = 35
local brickHeight = 15
local row
local column
local score = 0
local scoreIncrease = 100
local currentLevel
local vx = 3
local vy = -3
local gameEvent = ""


local function btnTap( event )
	playSFX(audioClick)
	storyboard.gotoScene( event.target.destination , {effect = "slideDown"})

	return true
end

function scene:createScene(event)
	local group = self.view

	local background = display.newImage( "images/mmScreen.png", withScrn, heightScrn )
	group:insert(background)

end

function scene:enterScene(event)
	-- body
	playMainGameMusic(audiomaingame)
	resetMusic()
end

function scene:exitScene(event)

	stopMainGameMusic(audiomaingame)
	resetMusic(audiomaingame)
	resetMusic(audioGameBackground)
	Runtime:removeEventListener( "tap", btnTap )

end

function scene:destroyScene(event)
	-- body
end

scene:addEventListener( "createScene", scene)
scene:addEventListener( "enterScene", scene)
scene:addEventListener( "exitScene", scene)
scene:addEventListener( "destroyScene", scene)

return scene