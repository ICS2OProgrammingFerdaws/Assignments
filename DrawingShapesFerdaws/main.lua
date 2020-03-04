-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local vertices = {0,-150, 90,65, -130,65}
local triangle = display.newPolygon(768, 192, vertices )
local textSize = 50


triangle:setFillColor(0.9,0.3,0.5)


-- write triangle on screen. 
triangleText = display.newText("Triangle", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position 
triangleText.anchorX = 0
triangleText.anchorY = 0
triangleText.x = 700
triangleText.y = 300

-- set the colour of the newText
triangleText:setTextColor(1, 1, 1)

local verticesHexagon = {-30,30, -5,30, -30,23, 30,25 -10,25, -5,25, 30,23, 0,-30}
local hexagon = display.newPolygon(256,192, verticesHexagon )
local textSize = 50


hexagon:setFillColor(0.9,0.3,0.5)

-- anchor the text and set its (x,y) position 
hexagonText.anchorX = 0
hexagonText.anchorY = 0
hexagonText.x = 700
hexagonText.y = 300

