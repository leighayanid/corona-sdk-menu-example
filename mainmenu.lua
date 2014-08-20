
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require("widget")
sounds = require("sounds")


--function that triggers when the user tap a button
local function btnTap(event)
	playSFX(audioClick)
	if (event.target.destination =="exitgameoverlay") then
		storyboard.showOverlay( "exitgameoverlay", {effect = "slideUp"})
	elseif (event.target.destination =="howtoplay") then
		storyboard.gotoScene (  event.target.destination, {effect = "slideLeft"} )
	else 
		storyboard.gotoScene (  event.target.destination, {effect = "slideUp"} )
	end
	
	return true
end


function scene:createScene( event )
	local group = self.view

	--load background music
	playGameMusic(audiogamebackground)

	local title = display.newImageRect( "images/title.png", 1000 , 300 )
	title.x = centerX
	title.y  = topScrn + title.height - 150
	transition.from( title, {time = 1000, delay = 1, y = (heightScrn - 3000), transition = easing.outExpo, onComplete=listener} )
	group:insert(title)
	
	-- create custom buttom
	local playBtn = widget.newButton
	{
	width = 700,
    height = 130,
    defaultFile = "images/button_menu.png",
    overFile = "images/button_menu_pressed.png",
    label="Play Game",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "46",
	}
	playBtn.x = centerX
	playBtn.y = centerY*1.2 - 1.2*playBtn.height + 40
	playBtn.destination = "gotolevel"
	playBtn:addEventListener("tap", btnTap)
	transition.from( playBtn, {time = 500, delay = 1, x = (withScrn - 4000), transition = easing.outExpo, onComplete=listener} )
	group:insert(playBtn)

	local optionsBtn = widget.newButton
	{
	width = 700,
    height = 130,
    defaultFile = "images/button_menu.png",
    overFile = "images/button_menu_pressed.png",
    label="Options",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "46",
	}
	optionsBtn.x = centerX
	optionsBtn.y = centerY*1.2 + 40
	optionsBtn.destination = "options"
	optionsBtn:addEventListener("tap", btnTap)
	transition.from( optionsBtn, {time = 800, delay = 1, x = (withScrn - 5000), transition = easing.outExpo, onComplete=listener} )
	group:insert(optionsBtn)

	local exitBtn = widget.newButton
	{
	width = 700,
    height = 130,
    defaultFile = "images/button_menu.png",
    overFile = "images/button_menu_pressed.png",
    label="Exit Game",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "46",
	}
	exitBtn.x = centerX
	exitBtn.y = optionsBtn.y + 1.2 *exitBtn.height 
	exitBtn.destination = "exitgameoverlay"
	exitBtn:addEventListener("tap", btnTap)
	transition.from( exitBtn, {time = 1100, delay = 1, x = (withScrn - 6000), transition = easing.outExpo, onComplete=listener} )
	group:insert(exitBtn)

	local questionBtn = widget.newButton
	{
	width = 100,
	height= 100,
	defaultFile = "images/question.png",
	overfile = "images/questionpressed.png",
	}
	questionBtn.y = heightScrn - 0.6 * questionBtn.height 
	questionBtn.x = .6 * questionBtn.width 
	questionBtn.destination = "howtoplay"
	questionBtn:addEventListener( "tap", btnTap )
	transition.from( questionBtn, {time = 1000, delay = 1, x = (withScrn - 6000), transition = easing.outExpo, onComplete=listener} )
	group:insert(questionBtn)

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	Runtime:removeEventListener( "tap", btnTap)
	
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

