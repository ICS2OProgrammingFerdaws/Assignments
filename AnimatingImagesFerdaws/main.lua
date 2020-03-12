







-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)
--------------------------------------------------------------------------------------------------------------------------
-- LOCAL SECTION
-------------------------------------------------------------------------------------------------------------------------------------
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
local textSize = 50
-------------------------------------------------------------------------------------------------------------------------------------------
-- LOCATION SECTION
--------------------------------------------------------------------------------------------------------------------------------
snoopDogg.x = 400
snoopDogg.y = 500

eminem.x = 100
eminem.y = 400


tupac.x = 700
tupac.y = 400
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOUCH SECTION 
-----------------------------------------------------------------------------------------------------------------------------------------
local function snoopDoggListener(touch)

	if	(touch.phase == "began") then 
		if	(alreadyTouchedsnoopDogg == false) then 
			alreadyTouchedsnoopDogg = true
		end
	end 	 
		
		

	if (	(touch.phase == "moved") and (alreadyTouchedsnoopDogg == true)	) then
		snoopDogg.x = touch.x
		snoopDogg.y = touch.y
	end 

	

	if	(touch.phase == "ended") then 
		alreadyTouchedsnoopDogg = false
		alreadyTouchedsnoopDogg = false
	end 
end


-- add the respective listener to oject 
snoopDogg:addEventListener("touch", snoopDoggListener)



local function eminemListener( touch )
	
	if	(touch.phase == "began") then
		if	(alreadyTouchedeminem == false) then 
			alreadyTouchedeminem = true 
		end
	
	end


	if(	(touch.phase == "moved") and (alreadyTouchedeminem == true)	) then
		eminem.x = touch.x
		eminem.y = touch.y
	end


	if	(touch.phase == "ended") then
		alreadyTouchedeminem = false
		alreadyTouchedeminem = false 
	end 		

end

-- add the respective listener to oject 
eminem:addEventListener("touch", eminemListener)


function tupacListener( touch )


	if (touch.phase == "began") then 
		if	(alreadyTouchedtupac == false) then 
			alreadyTouchedtupac = true
		end
	end
	

	if	(	(touch.phase == "moved") and (alreadyTouchedtupac == true)	) then
		tupac.x = touch.x
		tupac.y = touch.y
	end 
	
	if	(touch.phase == "ended") then
		alreadyTouchedtupac = false
		alreadyTouchedtupac = false	
	end
end


-- add the respective listener to oject 
tupac:addEventListener("touch", tupacListener)
-----------------------------------------------------------------------------------------------
-- TEXT SECTION
---------------------------------------------------------------------------------------------------------
rappers = display.newText("Rappers", 0, 0, Arial, textSize)

rappers.anchorX = 0
rappers.anchorY = 0
rappers.x = 500
rappers.y = 700

rappers:setTextColor(1, 1, 1)
----------------------------------------------------------------------------------------------------------
-- FADE SECTION
--------------------------------------------------------------------------------------------------------------
-- global variables
scrrolSpeed = 3 
snoopDogg.alpha = 0

local function MoveSnoop( event )
	snoopDogg.x = snoopDogg.x + scrrolSpeed

	snoopDogg.alpha = snoopDogg.alpha + 0.01
end

Runtime:addEventListener("event", MoveSnoop)