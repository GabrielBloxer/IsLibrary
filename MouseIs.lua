local mouse = {}

MousePosX = love.mouse.getX()
MousePosY = love.mouse.getY()


function mouse:Is_Clickig_With_Button1_In_Position(x, y, w, h)
	if mouse:IsClickingWithButton1() then
		return CheckMousePosInQuad(love.mouse.getX(), love.mouse.getY(), x, y, w, h)
	end
end

local function CheckMousePosInQuad(mouseX, mouseY, objX, objY, objW, objH)
	if (not (mouseY >= objY and mouseY <= objY + objH)) then
		return false
	end
	if (not (mouseX >= objX and mouseX <= objX + objW)) then
		return false
	end

	return true
end

function mouse:isMoving(dt)
	local MousePosXOld = MousePosX
	local MousePosYOld = MousePosY

	if love.mouse.getX() ~= MousePosXOld and love.mouse.getY()  ~= MousePosYOld then
		MousePosXNew = love.mouse.getX()
		MousePosYNew = love.mouse.getY()
		if MousePosXNew ~= MousePosXOld and MousePosYNew ~= MousePosYOld then
			MousePosX = MousePosXNew
			MousePosY = MousePosYNew
			return true
		end
	else
		return false
	end	
end

function mouse:notIsMoving(dt)
	local MousePosXOld = MousePosX
	local MousePosYOld = MousePosY

	if love.mouse.getX() == MousePosXOld and love.mouse.getY()  == MousePosYOld then
		MousePosXNew = love.mouse.getX()
		MousePosYNew = love.mouse.getY()
		if MousePosXNew == MousePosXOld and MousePosYNew == MousePosYOld then
			MousePosX = MousePosXNew
			MousePosY = MousePosYNew
			return true
		end
	else
		return false
	end	
end

function mouse:IsClickingWithButton1()
	if love.mouse.isDown(1) then
		return true
	else
		return false
	end
end

function mouse:IsClickingWithButton2()
	if love.mouse.isDown(2)  then
		return true
	else
		return false
	end
end

return mouse