-- Tittle:Drawing Shapes
-- Name:Ferdaws
-- Course:ICS20/3C


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

local verticesPentagon = {80,-120, 120,-50, -60,150, -100,-150, 0,-150}
local pentagon = display.newPolygon(170,192, verticesPentagon )
local textSize = 50


pentagon:setFillColor(0.9,0.3,0.5)


pentagonText = display.newText("pentagon", 0, 0, Arial,textSize)
-- anchor the text and set its (x,y) position
pentagonText.anchorX = 0
pentagonText.anchorY = 0
pentagonText.x = 265
pentagonText.y = 192

local verticesHexagon = {60,-120, 120,0, 0,120, -60,120, -120,0, -100,-120}
local hexagon = display.newPolygon(170,585, verticesHexagon)
local textSize = 50

hexagon:setFillColor(0.50,0.85,0.20)
 
hexagonText = display.newText("hexagon", 0, 0,Arial, textSize)



-- anchor the text and set its (x,y) position

hexagonText.anchorX = 0
hexagonText.anchorY = 0
hexagonText.x = 170
hexagonText.y =700

local verticesOctagon = {60,-120, 100,-60, 100,60, 60,120, -20,120, -100,60, -100,-60, -40,-120}
local octagon = display.newPolygon(768,585, verticesOctagon)
local textSize = 50

octagon:setFillColor(0.63,0.79,0.32)

OctagonText = display.newText("Octagon", 0, 0,Arial, textSize)



-- anchor the text and set its (x,y) position
OctagonText.anchorX = 0
OctagonText.anchorY = 0
OctagonText.x = 768
OctagonText.y = 700





