-----------------------------------------------------------------------------------------
--Title: MathQuiz
-- Name: Ferdaws
-- Course: ICS2O/3C
----------------------------------------------------------------------------------------------
-- STATUS BAR
-----------------------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)

--Set the background colour
display.setDefault("background", 189/255,90/255,20/255)

----------------------------------------------------------------------------------------------------------------
--LOCAL FUNCTION
----------------------------------------------------------------------------------------------------------------

-- creat local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

local totalSeconds = 5
local secondsLeft = 5

local clockText 
local countDownTimer
local lives = 3 
local numCorrect = 0
local numWrong = 0

local heart1
local heart2
local heart3
local randomOperator
local randomOperator2

local youWin 
local youLose
----------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIN
----------------------------------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
  -- generated 2 random numbers between a max. and a main. number
  randomOperator = math.random(1,2)

  randomNumber1 = math.random(0, 8)
  randomNumber2 = math.random(0, 8)
  if (randomOperator == 1) then
     correctAnswer = randomNumber1 + randomNumber2

     -- create question in text object 
     questionObject.text = randomNumber1 .."+".. randomNumber2 .."=" 

  elseif (randomOperator == 2) then
  	 correctAnswer = randomNumber1 - randomNumber2
  	 questionObject.text = randomNumber1 .. "-" .. randomNumber2
  end
end


local function AskQuestion2( )
	randomOperator2 = math.random(3.4)
	randomNumber1 = math.random(0,10)
	randomNumber2 = math.random(0,10)
	if (randomOperator2 == 3) then
		correctAnswer = randomNumber1 * randomNumber2
		questionObject.text = randomNumber1 .. "*" .. randomNumber2
	elseif(randomOperator2 == 4) then
		correctAnswer = randomNumber1 / randomNumber2
		questionObject.text = randomNumber1 .. "/" .. randomNumber2
	end
end


local function HideCorrect()
  correctObject.isVisible = false
  AskQuestion()
end


local function HideIncorrect()
  wrongObject.isVisible = false
  AskQuestion()
end
  
local function NumericFieldListener( event )

  -- User begins editing "numericField"
  if  ( event.phase == "began" ) then

    -- clear text field
    event.target.text = ""

  elseif event.phase == "submitted" then

    -- when the answer is submitted (enter key is pressed) set user input to users answer
    userAnswer = tonumber(event.target.text)


    -- if the users answer and the correct answer are the same:
    if  (userAnswer == correctAnswer) then
      numCorrect = numCorrect + 1


      if (numCorrect == 5) then 
        youWin.isVisible = true
        numericField.isVisible = false
      else

       -- give a point if user gets the correct answer 
       correctObject.isVisible = true
       timer.performWithDelay(3000, HideCorrect)
     end
    else
      numWrong = numWrong + 1

      if (numWrong == 3) then
        youLose.isVisible = true
        numericField.isVisible = false
      else
       wrongObject.isVisible = true
       timer.performWithDelay(2000,  HideIncorrect)
     end
    end
  end
end







local function Negative(  )

	if (firstNumber<secondNumber) then
		correctAnswer = randomNumber2- randomNumber1
		questionObject.text = randomNumber2 .. "-" .. randomNumber1

	else
		correctAnswer = randomNumber1 - randomNumber2
		questionObject.text = randomNumber1 .. "-" .. randomNumber2
	end

end







local function UpdateTime( )
	secondsLeft = secondsLeft - 1
	clockText.text = secondsLeft .. ""
	if(secondsLeft == 0 ) then 
		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 3) then
			heart3.isVisible = false
		elseif(lives == 2) then
		 heart2.isVisible = false 
		end
	end
end


local function startTimer( )
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end
------------------------------------------------------------------------------------
--OBJECT CREATION
----------------------------------------------------------------------------------------

questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(32/255,60/255,1/255)

correctObject = display.newText( "Correct", display.contentWidth/2, display.contentHeight*2/3,nil, 50)
correctObject:setTextColor(34/255, 23/255, 79/255)
correctObject.isVisible = false

numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 120, 100)
numericField.inputType = "number"
numericField:addEventListener( "userInput", NumericFieldListener )

wrongObject = display.newText ("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
wrongObject:setTextColor(65/255, 79/255, 3/255)
wrongObject.isVisible = false

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7/ 8
heart1.y = display.contentHeight * 1 / 7
heart2 = display.newImageRect("Images/heart.png", 100 , 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
heart3 = display.newImageRect("Images/heart.png", 100 , 100)
heart3.x = display.contentWidth * 5 /8
heart3.y = display.contentHeight * 1 / 7

youWin = display.newImageRect("Images/You win.jpg",600 , 600)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight/2
youWin.isVisible = false

youLose = display.newImageRect("Images/You lose.gif", 600, 600)
youLose.x = display.contentWidth/2
youLose.y = display.contentHeight/2
youLose.isVisible = false
------------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------------
AskQuestion()
AskQuestion2()








