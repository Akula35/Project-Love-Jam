function love.load()
	love.window.setMode(800, 600, {resizable=true})
	sx = 1
	sy = 1
	moveMap = false
	offsetx = love.graphics.getWidth() * 0.1
	offsety = 0

	course = love.graphics.newImage("Motegi (JAP).png")
	coursex = 0
	coursey = 0

	rider = love.graphics.newImage("rider.png")
	riderx = coursex + 1150
	ridery = coursey + 540
end

function love.draw()
	love.graphics.setColor(255, 255, 255, 255) -- draw map in backgroud
	love.graphics.push()
	love.graphics.translate(offsetx, offsety)
	love.graphics.scale(sx,sy)
	love.graphics.draw(course, coursex, coursey, 0)
	love.graphics.draw(rider, riderx, ridery, 0)
	love.graphics.pop()
	love.graphics.setColor(255, 0, 0, 255) -- draw ui
	uiWidth = love.graphics.getWidth() * 0.1
	uiHeight = love.graphics.getHeight()
	love.graphics.rectangle("fill", 0, 0, uiWidth, uiHeight)
end

function love.mousepressed(x, y, button, istouch, presses)
	if x > love.graphics.getWidth() * 0.1 then
		moveMap = true
	end
end

function love.mousereleased(x, y, button, istouch, presses)
	moveMap = false
end
function love.mousemoved(x, y, dx, dy, istouch)
	if moveMap then -- move map on mouse press
		offsetx = offsetx + dx
		offsety = offsety + dy
	end
end

function love.wheelmoved(x, y) -- map zoom
	newScale = sx + (y * 0.01)
	sx = newScale
	sy = newScale
end

-- function love.mousepressed(x, y, button, istouch, presses)
--	if button == 1 then
--		coursex = x
--		coursey = y
--	end
-- end

function generateMove()

end