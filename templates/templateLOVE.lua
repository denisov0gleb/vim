-------------------------------------------------------
--@ToDo:
--		1)
--		2)
--
-------------------------------------------------------

function love.load()
end


function love.update(dt)
	if love.keyboard.isDown('escape', 'q') then
		love.event.push('quit')
	end
end


function love.draw()
end
