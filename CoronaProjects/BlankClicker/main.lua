--title
local title = display.newText("Blank Clicker Game", display.contentCenterX, 32, native.systemFontBold, 64)

--count var and msg var
 count = 0
local msg = display.newText("Clicked Button "..count.." times.", display.contentCenterX, 128, native.systemFontBold, 64)

--button and a listener
local function tapListener( event )
	print("button object tapped: " .. tostring(event.target))
	msg:setFillColor( 0,0,0 ) -- dumb way to write over the previous message by changing its color 
	count = count + 1
	msg = display.newText("Clicked Button "..count.." times.", display.contentCenterX, 128, native.systemFontBold, 64)
	return true
end

--actual button
local button = display.newRect(display.contentCenterX, display.contentCenterY, 256, 64)

-- actually assign listener to button
button:addEventListener("tap", tapListener)