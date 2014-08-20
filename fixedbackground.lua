staticGroup = display.newGroup( )

function createStaticBackgroundElements()
	
	--create all fixed background elements
	topWall = display.newRect( 0, 0, display.contentWidth, 0)
	bottomWall = display.newRect( 0, display.contentHeight - 10, display.contentWidth, 0)
	leftWall = display.newRect( 0, 0, 0, display.contentHeight )
	rightWall = display.newRect( display.contentWidth - 10, 0, 0, display.contentHeight )

	
end