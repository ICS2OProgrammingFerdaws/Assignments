-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Ferdaws
-- Date: june. 12, 2020
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-- load physics
local physics = require("physics")

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- GLOBAl VARIABLES
-----------------------------------------------------------------------------------------
soundOn = true 

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image

local platform1
local platform2
local platform3
local platform4

local spikes1
local spikes2
local spikes3

local spikes1platform
local spikes2platform
local spikes3platform

local torchesAndSign
local door
local door
local character

local heart1
local heart2
local heart3
local numLives = 3

local rArrow 
local uArrow
local lArrow

local motionx = 0
local SPEED = 6
local LINEAR_VELOCITY = -80
local GRAVITY = 5

local leftW 
local topW
local floor
local rightW

local meat1
local meat2
local meat3
local theMeat


local cake1
local cake2
local cake3
local theCake


local gun1
local gun2
local gun3
local theGun

local muteButton
local unmuteButton

local questionsAnswered = 0

----------------------------------------------------------------------------------------
-- SOUND FUNCTIONS
-------------------------------------------------------------------------------------------
local popSound = audio.loadSound("Sounds/Pop.mp3")
local popSoundChannel

local youLose = audio.loadSound("Sounds/YouLose.mp3")
local youLoseCannel

local youWin = audio.loadSound("Sounds/Cheer.m4a")
local youWinChannel

local bgSoundL1 = audio.loadSound("Sounds/2019-06-18_-_Creepy_Vibes_-_David_Fesliyan.mp3")
local bgSoundL1Channel

-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
----------------------------------------------------------------------------------------- 
 
-- When right arrow is touched, move character right
local function right (touch)
    motionx = SPEED
    character.xScale = 1
end

-- When right arrow is touched, move character right
local function left (touch)
    motionx = -SPEED
    character.xScale = -1
end

-- When up arrow is touched, add vertical so it can jump
local function up (touch)
    if (character ~= nil) then
        character:setLinearVelocity( 0, LINEAR_VELOCITY )
    end
end

-- Move character horizontally
local function movePlayer (event)
    character.x = character.x + motionx
end
 
-- Stop character movement when no arrow is pushed
local function stop (event)
    if (event.phase =="ended") then
        motionx = 0
    end
end


local function AddArrowEventListeners()
    rArrow:addEventListener("touch", right)
    lArrow:addEventListener("touch", left)
    uArrow:addEventListener("touch", up)
end

local function RemoveArrowEventListeners()
    rArrow:removeEventListener("touch", right)
    lArrow:removeEventListener("touch", left)
    uArrow:removeEventListener("touch", up)
end

local function AddRuntimeListeners()
    Runtime:addEventListener("enterFrame", movePlayer)
    Runtime:addEventListener("touch", stop )
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
end


local function Mute(touch)
    if(touch.phase == "ended") then 
        audio.pause(bgSoundL1Channel)

        soundOn = false
        muteButton.isVisible = true
        unmuteButton.isVisible = false 

    end
end


local function unMute(touch)
    if(touch.phase == "ended") then 
        audio.resume(bgSoundL1Channel)

        soundOn = true
        muteButton.isVisible = false
        unmuteButton.isVisible = true

    end
end


local function AddMuteUnmuteListeners( )
    unmuteButton:addEventListener("touch", Mute)
    muteButton:addEventListener("touch", unMute)
    
end

local function RemoveMuteUnmuteListeners( )
    unmuteButton:removeEventListener("touch", Mute)
    muteButton:removeEventListener("touch", unMute)
    
end

local function ReplaceCharacter()
    character = display.newImageRect("Images/Fox.png", 100, 150)
    character.x = display.contentWidth * 0.5 / 8
    character.y = display.contentHeight  * 0.1 / 3
    character.width = 75
    character.height = 100
    character.myName = "KickyKat"

    -- intialize horizontal movement of character
    motionx = 0

    -- add physics body
    physics.addBody( character, "dynamic", { density=0, friction=0.5, bounce=0, rotation=0 } )

    -- prevent character from being able to tip over
    character.isFixedRotation = true

    -- add back arrow listeners
    AddArrowEventListeners()

    -- add back runtime listeners
    AddRuntimeListeners()
end

local function MakeSoccermeatsVisible()
    meat1.isVisible = true
    meat2.isVisible = true
    meat3.isVisible = true
end

local function MakeHeartsVisible()
    heart1.isVisible = true
    heart2.isVisible = true
    heart3.isVisible = true
    
end

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWinTransition()
    composer.gotoScene( "you_win" )
end





local function onCollision( self, event )
    -- for testing purposes
    --print( event.target )        --the first object in the collision
    --print( event.other )         --the second object in the collision
    --print( event.selfElement )   --the element (number) of the first object which was hit in the collision
    --print( event.otherElement )  --the element (number) of the second object which was hit in the collision
    --print( event.target.myName .. ": collision began with " .. event.other.myName )

    if ( event.phase == "began" ) then

        --Pop sound
        if(soundOn == true) then 
         popSoundChannel = audio.play(popSound)
        end

        if  (event.target.myName == "spikes1") or 
            (event.target.myName == "spikes2") or
            (event.target.myName == "spikes3") then

            -- add sound effect here

            -- remove runtime listeners that move the character
            RemoveArrowEventListeners()
            RemoveRuntimeListeners()

            -- remove the character from the display
            display.remove(character)

            -- decrease number of lives
            numLives = numLives - 1

            if (numLives == 2) then
                -- update hearts
                heart1.isVisible = true
                heart2.isVisible = true
                heart3.isVisible = false
                
                timer.performWithDelay(200, ReplaceCharacter) 

            elseif (numLives == 1) then
                -- update hearts
                heart1.isVisible = true
                heart2.isVisible = false
                heart3.isVisible = false
                timer.performWithDelay(200, ReplaceCharacter) 

            elseif (numLives == 0) then
                -- update hearts
                heart1.isVisible = false
                heart2.isVisible = false
                heart3.isVisible = false
                YouLoseTransition() 
                if(soundOn == true ) then 
                 youLoseCannel = audio.play(youLose)
                end
 
            end
        end

        if  (event.target.myName == "meat1") or
            (event.target.myName == "meat2") or
            (event.target.myName == "meat3") then

            -- get the meat that the user hit
            themeat = event.target

            -- stop the character from moving
            motionx = 0

            -- make the character invisible
            character.isVisible = false

            -- show overlay with math question
            composer.showOverlay( "level1_question", { isModal = true, effect = "fade", time = 100})

            -- Increment questions answered
            questionsAnswered = questionsAnswered + 1
        end

        if (event.target.myName == "door") then
            --check to see if the user has answered 5 questions
            if (questionsAnswered == 3) then
                -- after getting 3 questions right, go to the you win screen
                YouWinTransition()
                if(soundOn == true ) then
                 youWinChannel = audio.play(youWin)
                end
            end
        end        

    end
end


local function AddCollisionListeners()
    -- if character collides with meat, onCollision will be called
    spikes1.collision = onCollision
    spikes1:addEventListener( "collision" )
    spikes2.collision = onCollision
    spikes2:addEventListener( "collision" )
    spikes3.collision = onCollision
    spikes3:addEventListener( "collision" )

    -- if character collides with meat, onCollision will be called    
    meat1.collision = onCollision
    meat1:addEventListener( "collision" )
    meat2.collision = onCollision
    meat2:addEventListener( "collision" )
    meat3.collision = onCollision
    meat3:addEventListener( "collision" )
    

    door.collision = onCollision
    door:addEventListener( "collision" )
end

local function RemoveCollisionListeners()
    spikes1:removeEventListener( "collision" )
    spikes2:removeEventListener( "collision" )
    spikes3:removeEventListener( "collision" )

    meat1:removeEventListener( "collision" )
    meat2:removeEventListener( "collision" )
    meat3:removeEventListener( "collision" )
   

    door:removeEventListener( "collision")

end

local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody( platform1, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( platform2, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( platform3, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( platform4, "static", { density=1.0, friction=0.3, bounce=0.2 } )

    physics.addBody( spikes1, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( spikes2, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( spikes3, "static", { density=1.0, friction=0.3, bounce=0.2 } )    

    physics.addBody( spikes1platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( spikes2platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( spikes3platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )

    physics.addBody(leftW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(topW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(floor, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(rightW, "static", {density=1, friction=0.3, bounce=0.2} )

    physics.addBody(meat1, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(meat2, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(meat3, "static",  {density=0, friction=0, bounce=0} )

    physics.addBody(door, "static", {density=1, friction=0.3, bounce=0.2})

end

local function RemovePhysicsBodies()
    physics.removeBody(platform1)
    physics.removeBody(platform2)
    physics.removeBody(platform3)
    physics.removeBody(platform4)

    physics.removeBody(spikes1)
    physics.removeBody(spikes2)
    physics.removeBody(spikes3)

    physics.removeBody(spikes1platform)
    physics.removeBody(spikes2platform)
    physics.removeBody(spikes3platform)

    physics.removeBody(leftW)
    physics.removeBody(topW)
    physics.removeBody(floor)
    physics.removeBody(rightW)
 
end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeGame()

    -- make character visible again
    character.isVisible = true
    
    if (questionsAnswered > 0) then
        if (themeat ~= nil) and (themeat.isBodyActive == true) then
            physics.removeBody(themeat)
            themeat.isVisible = false
        end
    end

end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Bkg.jpg", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentWidth / 2 
    bkg_image.y = display.contentHeight / 2

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    
    
    -- Insert the platforms
    platform1 = display.newImageRect("Images/Platform.png", 250, 50)
    platform1.x = display.contentWidth * 1 / 8
    platform1.y = display.contentHeight * 1.6 / 4
        
    sceneGroup:insert( platform1 )

    platform2 = display.newImageRect("Images/Platform2.png", 150, 50)
    platform2.x = display.contentWidth /2.1
    platform2.y = display.contentHeight * 1.2 / 4
        
    sceneGroup:insert( platform2 )

    platform3 = display.newImageRect("Images/Platform.png", 180, 50)
    platform3.x = display.contentWidth *3 / 5
    platform3.y = display.contentHeight * 3.5 / 5
        
    sceneGroup:insert( platform3 )

    platform4 = display.newImageRect("Images/Platform2.png", 180, 50)
    platform4.x = display.contentWidth *4.7 / 5
    platform4.y = display.contentHeight * 1.3 / 5
        
    sceneGroup:insert( platform4 )

    spikes1 = display.newImageRect("Images/Level-1Spikes1.png", 250, 50)
    spikes1.x = display.contentWidth * 3 / 8
    spikes1.y = display.contentHeight * 2.5 / 5
    spikes1.myName = "spikes1"
        
    sceneGroup:insert( spikes1)

    spikes1platform = display.newImageRect("Images/Platform.png", 250, 50)
    spikes1platform.x = display.contentWidth * 3 / 8
    spikes1platform.y = display.contentHeight * 2.8 / 5
        
    sceneGroup:insert( spikes1platform)

    spikes2 = display.newImageRect("Images/Level-1Spikes2.png", 150, 50)
    spikes2.x = display.contentWidth * 6 / 8
    spikes2.y = display.contentHeight * 2.5 / 5
    spikes2.myName = "spikes2"
        
    sceneGroup:insert( spikes2)

    spikes2platform = display.newImageRect("Images/Platform2.png", 150, 50)
    spikes2platform.x = display.contentWidth * 6 / 8
    spikes2platform.y = display.contentHeight * 2.2 / 5
        
    sceneGroup:insert( spikes2platform)

    spikes3 = display.newImageRect("Images/Level-1Spikes3.png", 50, 150)
    spikes3.x = display.contentWidth * 5.5 / 8
    spikes3.y = display.contentHeight * 0.4 / 5
    spikes3.myName = "spikes3"
        
    sceneGroup:insert( spikes3)

    spikes3platform = display.newImageRect("Images/Platform2.png", 50, 150)
    spikes3platform.x = display.contentWidth * 5.8 / 8
    spikes3platform.y = display.contentHeight * 0.4 / 5
        
    sceneGroup:insert( spikes3platform)

    -- Insert the torchesAndSign Objects
    torchesAndSign = display.newImageRect("Images/Level-1Random.png", display.contentWidth, display.contentHeight)
    torchesAndSign.x = display.contentCenterX
    torchesAndSign.y = display.contentCenterY + 10

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( torchesAndSign )

    -- Insert the Door
    door = display.newImage("Images/Door (2).png", 200, 200)
    door.x = display.contentWidth/5 
    door.y = display.contentHeight*6.1/7
    door.myName = "door"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( door )

    -- Insert the Hearts
    heart1 = display.newImageRect("Images/heart.png", 80, 80)
    heart1.x = 50
    heart1.y = 50
    heart1.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart1 )

    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 130
    heart2.y = 50
    heart2.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart2 )

    heart3 = display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 210
    heart3.y = 50
    heart3.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart3 )


    --Insert the left arrow
    lArrow = display.newImageRect("Images/LeftArrowUnpressed.png", 100, 50)
    lArrow.x = display.contentWidth * 7.2 / 10
    lArrow.y = display.contentHeight * 9.5 / 10
   
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( lArrow)

    --Insert the right arrow
    rArrow = display.newImageRect("Images/RightArrowUnpressed.png", 100, 50)
    rArrow.x = display.contentWidth * 9.2 / 10
    rArrow.y = display.contentHeight * 9.5 / 10
   
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( rArrow)

    --Insert the left arrow
    uArrow = display.newImageRect("Images/UpArrowUnpressed.png", 50, 100)
    uArrow.x = display.contentWidth * 8.2 / 10
    uArrow.y = display.contentHeight * 8.5 / 10

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( uArrow)

    --WALLS--
    leftW = display.newLine( 0, 0, 0, display.contentHeight)
    leftW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( leftW )

    rightW = display.newLine( 0, 0, 0, display.contentHeight)
    rightW.x = display.contentCenterX * 2
    rightW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( rightW )

    topW = display.newLine( 0, 0, display.contentWidth, 0)
    topW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topW )

    floor = display.newImageRect("Images/Level-1Floor.png", 1024, 100)
    floor.x = display.contentCenterX
    floor.y = display.contentHeight * 1.06
    
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( floor )

    --meat1
    meat1 = display.newImageRect ("Images/Meat.png", 70, 70)
    meat1.x = 610
    meat1.y = 480
    meat1.myName = "meat1"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( meat1 )

    --meat2
    meat2 = display.newImageRect ("Images/Meat.png", 70, 70)
    meat2.x = 490
    meat2.y = 170
    meat2.myName = "meat2"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( meat2 )

    --meat2
    meat3 = display.newImageRect ("Images/Meat.png", 70, 70)
    meat3.x = 940
    meat3.y = 130
    meat3.myName = "meat3"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( meat3 )

    muteButton = display.newImageRect ("Images/Mute.png", 70, 70)
    muteButton.x = 50
    muteButton.y = 730
    muteButton.isVisible = false
    sceneGroup:insert(muteButton)


    unmuteButton = display.newImageRect ("Images/unmute.png", 70, 70)
    unmuteButton.x = 50
    unmuteButton.y = 730
    unmuteButton.isVisible = true
    sceneGroup:insert(unmuteButton)

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------
        -- start physics
        physics.start()

        -- set gravity
        physics.setGravity( 0, GRAVITY )

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        numLives = 3
        questionsAnswered = 0
        if(soundOn == true) then 
          bgSoundL1Channel = audio.play(bgSoundL1, {channel = 1 , loops = -1})
          muteButton.isVisible = false
          unmuteButton.isVisible = true
        end

        -- make all soccer meats visible
        MakeSoccermeatsVisible()

        -- make all lives visible
        MakeHeartsVisible()

        -- add physics bodies to each object
        AddPhysicsBodies()

        -- add collision listeners to objects
        AddCollisionListeners()

        -- create the character, add physics bodies and runtime listeners
        ReplaceCharacter()

        AddMuteUnmuteListeners()

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        audio.stop(bgSoundL1Channel)
        -- Called immediately after scene goes off screen.
        RemoveCollisionListeners()
        RemovePhysicsBodies()

        physics.stop()
        RemoveArrowEventListeners()
        RemoveRuntimeListeners()
        RemoveMuteUnmuteListeners()
        display.remove(character)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene