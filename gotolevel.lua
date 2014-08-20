local storyboard  = require("storyboard")
local scene = storyboard.newScene( )
storyboard.purgeOnSceneChange = true


levels = 
{
	1,2,2,2,2,
	2,2,2,2,2,
	2,2,2,2,2
}

images = {
	{ getFile = "images/leveliconnotpressed.png", types = "play"},
	{ getFile = "images/levellocked.png", type = "locked"}
}

--function that triggers when the user tap any of the buttton
local function btnTap( event )
	playSFX(audioClick)
	event.target.xScale = 0.95
	event.target.yScale = 0.95
	if (event.target.destination == "mainmenu") then
		storyboard.gotoScene( event.target.destination , {effect = "slideDown"})
	else
		storyboard.gotoScene( event.target.destination, {effect = "slideUp"} )
	end
	return true
end


function scene:createScene( event )
	local group = self.view

		--diplay the level title
		local leveltitle = display.newImageRect( "images/leveltitle.png", 1000, 195)
		leveltitle.x = centerX
		leveltitle.y = topScrn + leveltitle.height - 75
		transition.from( leveltitle, {time = 1000, delay = 1, y = (heightScrn - 1000), transition = easing.outExpo, onComplete=listener} )
		group:insert(leveltitle)

			--back button
		backbutton = display.newImageRect("images/reloadbutton.png", 110, 110 )
		backbutton.y = heightScrn - 0.6 * backbutton.height
		backbutton.x = .6 * backbutton.width
		backbutton.destination = "mainmenu"
		backbutton:addEventListener( "tap", btnTap )
		group:insert(backbutton)


		--for level index
		local levelIndex = 0
			for i=0,2 do
				for j=1,5 do
					tablePlace = i*5 + j
					levelIndex = levelIndex+1
						local imagesId = levels[levelIndex]
							levelImg = display.newImageRect(images[imagesId].getFile,150, 150 )
							levelImg.x = 175 + (j* 175 )
							levelImg.y  = 300 + (i* 175 )
							transition.from( levelImg, {time = 1000, delay = 1, x = (withScrn - 1000), transition = easing.outExpo, onComplete=listener} )
							group:insert(levelImg)

							if images[imagesId].types == "play" then
							leveltxt = display.newText("Level "..tostring(tablePlace), 0,0, "Helvetica", 30)
							leveltxt.x = 175 + (j*175)
							leveltxt.y = 300+ (i*175)
							leveltxt:setTextColor (0, 0, 0)
							group:insert (leveltxt)
							levelImg.destination = "level0"..tostring(tablePlace)
							levelImg:addEventListener("tap", btnTap)
						end 		
				end
			end
			
end

function scene:enterScene( event )
	-- body
end

function scene:exitScene( event )
	-- body
		
end

function scene:destroyScene( event )
	-- body
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene ) 

return scene
