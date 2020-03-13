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

local verticesPentagon = {-90,-120, 100,-90, 80,60, -120,60, -160,0,}
local pentagon = display.newPolygon(256,192, verticesPentagon )
local textSize = 50


pentagon:setFillColor(0.9,0.3,0.5)

pentagonText = display.newText("Pentagon", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position 
pentagonText.anchorX = 0
pentagonText.anchorY = 0
pentagonText.x = 180
pentagonText.y = 300

local verticesHexagon = {100,-120, 70,120, 80,120, 80,-120, }
local hexagon = display.newPolygon(256,576, verticesHexagon)
