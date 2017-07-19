keyboard = {}

function keyboard.IsKeyDown(key)
	if love.keyboard.isDown(key) then
		return true
	else
		return false
	end
end

return keyboard