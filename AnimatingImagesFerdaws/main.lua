







-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)


local snoopDogg = display.newImageRect("Images/snoop.png", 300, 300)
local snoopDoggWidth = snoopDogg.width 
local snoopDoggHeight = snoopDogg.height

local eminem = display.newImageRect("Images/eminem.jpg", 400,400)
local eminemWidth = eminem.width 
local emniemHeight = eminem.height


local tupac = display.newImageRect("Images/tupac.png", 300, 300)
local tupacWidth = tupac.width 
local tupacHeight = tupac.height 
 
local alreadyTouchedsnoopDogg = false 
local alreadyTouchedeminem = false
local alreadyTouchedtupac = false

snoopDogg.x = 400
snoopDogg.y = 500

eminem.x = 100
eminem.y = 400


tupac.x = 700
tupac.y = 400
