function love.load()
	love.window.setMode(800, 600, {resizable=true})
	scale = 1
	moveMap = false
	offsetx = love.graphics.getWidth() * 0.2
	offsety = 0
	buttonState = 0.7

	course = love.graphics.newImage("Motegi (JAP).png") -- load race track
	coursex = 0
	coursey = 0

	courseGrid = { } -- grid of spaces for bike on course
		courseGrid[1] = {}
			courseGrid[1][1] = {}
				courseGrid[1][1][1] = 1435
				courseGrid[1][1][2] = 705
				courseGrid[1][1][3] = 210
			courseGrid[1][2] = {}
				courseGrid[1][2][1] = 525
				courseGrid[1][2][2] = 860
				courseGrid[1][2][3] = 300
			courseGrid[1][3] = {}
				courseGrid[1][3][1] = 1150
				courseGrid[1][3][2] = 540
				courseGrid[1][3][3] = 0



	rider = love.graphics.newImage("rider.png") -- lad and place biker
	riderGridX = 1
	riderGridY = 3
end

function love.draw()
	love.graphics.setColor(1, 1, 1, 1) -- draw map in backgroud
	love.graphics.push()
	love.graphics.translate(offsetx, offsety)
	love.graphics.scale(scale)
	love.graphics.draw(course, coursex, coursey, 0)
	riderx = coursex + courseGrid[riderGridX][riderGridY][1]
	ridery = coursey + courseGrid[riderGridX][riderGridY][2]
	ridera = math.rad(courseGrid[riderGridX][riderGridY][3])
	love.graphics.draw(rider, riderx, ridery, ridera)
	love.graphics.pop()
	love.graphics.setColor(0.5, 0.5, 0.5, 1) -- draw ui
	uiWidth = love.graphics.getWidth() * 0.2
	uiHeight = love.graphics.getHeight()
	love.graphics.rectangle("fill", 0, 0, uiWidth, uiHeight) -- draw button
	love.graphics.setColor(buttonState,buttonState,buttonState,255)
	love.graphics.rectangle("fill", 50, 10, love.graphics.getWidth() * 0.2 - 100, 50)
end

function love.mousepressed(x, y, button, istouch, presses)
	if x > love.graphics.getWidth() * 0.1 then -- check if pressed outside ui, then move map
		moveMap = true
	end
	if (x > 50 and x < love.graphics.getWidth() * 0.2 - 50) and (y > 10 and y < 60) then -- when button pressed change button colog and call function to move biker
		buttonState = 0.5
		generateMove()
	end
end

function love.mousereleased(x, y, button, istouch, presses) -- clear all effects of mouse press
	if buttonState == 0.5 then
		buttonState = 0.3
	end
	moveMap = false
end

function love.mousemoved(x, y, dx, dy, istouch)
	if moveMap then -- move map on mouse press
		offsetx = offsetx + dx
		offsety = offsety + dy
	end
	if (x > 50 and x < love.graphics.getWidth() * 0.2 - 50) and (y > 10 and y < 60) then 
		buttonState = 0.3
	else
		buttonState = 0.7
	end
end

function love.wheelmoved(x, y) -- map zoom
	scale = scale + (y * 0.01)
end

-- function love.mousepressed(x, y, button, istouch, presses)
--	if button == 1 then
--		coursex = x
--		coursey = y
--	end
-- end

function generateMove() -- generate new position for rider/riders
	riderGridY = (riderGridY + 1) % 3 + 1
end