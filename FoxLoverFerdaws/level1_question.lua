-----------------------------------------------------------------------------------------
--
-- level1_question.lua
-- Created by: Ferdaws
-- Date: june 12, 2020
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local wrongSound = audio.loadSound("Sounds/BoingSoundEffect.mp3")
local wrongSoundChannel


local bellSound = audio.loadSound("Sounds/bells006.mp3") 
local bellSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText


local answer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3

local answerText 
local wrongAnswerText1
local wrongAnswerText2

local answerPosition = 1
local bkg
local cover

local randomQuestionNum

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel1() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeGame()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    
    if (touch.phase == "ended") then
        if(soundOn == true) then
         bellSoundChannel = audio.play(bellSound)
        end

        BackToLevel1( )
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    
    if (touch.phase == "ended") then
        if(soundOn == true) then 
         wrongSoundChannel = audio.play(wrongSound)
        end
        BackToLevel1( )   
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    
    if (touch.phase == "ended") then
        if(soundOn == true) then 
         wrongSoundChannel = audio.play(wrongSound)
        end

        BackToLevel1( )    
    end 
end

local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    
    if (touch.phase == "ended") then
        if(soundOn == true) then 
         wrongSoundChannel = audio.play(wrongSound)
        end
        BackToLevel1( )
        
    end 
end

--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer )
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end

local function DisplayQuestion()
    randomQuestionNum = math.random  (1,10)
    if(randomQuestionNum == 1) then

     --creating the question depending on the selcetion number
     questionText.text = "What colour is the jungle?"

     --creating answer text from list it corispondes with the animals list
     answerText.text = "Green"
    
     --creating wrong answers
     wrongText1.text = "Black"
     wrongText2.text = "Red"
     wrongText3.text = "Blue" 

    elseif(randomQuestionNum == 2) then
     --creating the question depending on the selcetion number
     questionText.text = "Which animal shares the\n most DNA  with humans? "

     --creating answer text from list it corispondes with the animals list
     answerText.text = "chimpa\nnzees"
    
     --creating wrong answers
     wrongText1.text = "Tiger"
     wrongText2.text = "Cat"
     wrongText3.text = "Dog"

    elseif(randomQuestionNum == 3) then
     --creating the question depending on the selcetion number
     questionText.text = "On which country is \n amazon rainforest located?"

     --creating answer text from list it corispondes with the animals list
     answerText.text = "Brazil"
    
     --creating wrong answers
     wrongText1.text = "USA"
     wrongText2.text = "Africa"
     wrongText3.text = "Canada "

    elseif(randomQuestionNum == 4) then

     --creating the question depending on the selcetion number
     questionText.text = "Which animal live\n in the sea?"

     --creating answer text from list it corispondes with the animals list
     answerText.text = "All of \n them"
    
     --creating wrong answers
     wrongText1.text = "Fish "
     wrongText2.text = "Shark"
     wrongText3.text = "Whale"


    elseif (randomQuestionNum == 5 ) then
        --creating the question depending on the selcetion number
     questionText.text = "What does a Fox eat?"

     --creating answer text from list it corispondes with the animals list
     answerText.text = "Meat"
    
     --creating wrong answers
     wrongText1.text = "Grass"
     wrongText2.text = "Apple"
     wrongText3.text = "Orange"

    elseif(randomQuestionNum == 6) then

     --creating the question depending on the selcetion number
     questionText.text = "which animal can \n you keep as a pet?"

     --creating answer text from list it corispondes with the animals list
     answerText.text = "Dog"
    
     --creating wrong answers
     wrongText1.text = "Alli\ngator"
     wrongText2.text = "Wolf"
     wrongText3.text = "Lion"

    elseif(randomQuestionNum == 7) then
     --creating the question depending on the selcetion number
     questionText.text = "Which animal can you\n not keep as a pet?"
     --creating answer text from list it corispondes with the animals list
     answerText.text = "Wolf"
    
     --creating wrong answers
     wrongText1.text = "Dog"
     wrongText2.text = "Cat"
     wrongText3.text = "Snake"

    elseif (randomQuestionNum == 8) then
        --creating the question depending on the selcetion number
     questionText.text = "Which animal is not friendly?"
     --creating answer text from list it corispondes with the animals list
     answerText.text = "Lion"
    
     --creating wrong answers
     wrongText1.text = "Dog"
     wrongText2.text = "Cat"
     wrongText3.text = "Duck"   

    elseif(randomQuestionNum == 9) then
      --creating the question depending on the selcetion number
     questionText.text = "Which animal is friendly?"
     --creating answer text from list it corispondes with the animals list
     answerText.text = "Cat"
    
     --creating wrong answers
     wrongText1.text = "Fox"
     wrongText2.text = "Wolf"
     wrongText3.text = "Lion"


    elseif(randomQuestionNum == 10) then
         --creating the question depending on the selcetion number
     questionText.text = "Which animal does\n not exect anymore?"
     --creating answer text from list it corispondes with the animals list
     answerText.text = "Dinosaur"
    
     --creating wrong answers
     wrongText1.text = "Fox"
     wrongText2.text = "Wolf"
     wrongText3.text = "Lion"
    end
end









local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2


        
    elseif (answerPosition == 2) then

        answerText.x = X2
        answerText.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y1


    elseif (answerPosition == 3) then

        answerText.x = X2
        answerText.y = Y1
            
        wrongText1.x = X2
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X1
        wrongText3.y = Y1


    elseif (answerPosition == 4) then

        answerText.x = X1
        answerText.y = Y1
            
        wrongText1.x = X2
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y2

        wrongText3.x = X1
        wrongText3.y = Y2
            
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 75)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 75)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 75)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 75)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X1, Y1, Arial, 75)
    wrongText3.anchorX = 0

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)


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

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        AddTextListeners()
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
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
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