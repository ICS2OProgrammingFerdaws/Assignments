-----------------------------------------------------------------------------------------
-- Name:Ferdaws
-- 
--
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
local lives 


----------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIN
----------------------------------------------------------------------------------------------------------------------------------------------------

local function AskQuestion(  )
	-- generate 2 random numbers between a max. and main. number
	randomNumber1 = math.random(0,20)
	randomNumber2 = math.random(0,20)

	correctAnswer = randomNumber1+randomNumber2

	-- creat question in text object 
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .."="
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
      correctObject.isVisible = true
      timer.performWithDelay(3000, HideCorrect)
    else
      wrongObject.isVisible = true
      timer.performWithDelay(2000,  HideIncorrect)
    end
  end
end


local function HideIncorrect()
  wrongObject.isVisible = false
  AskQuestion()
end

local function AskQuestion2( )

	randomNumber1 = math.random(0,20)
	randomNumber2 = math.random(0,20)

	correctAnswer =  randomNumber1 - randomNumber2

	questionObject.text = randomNumber1 .. "-" .. randomNumber2	
end

local function numericFieldListener( event )

	if ( event.phase == "began" ) then

		event.target.text=""

	elseif event.phase == "submitted" then
		userAnswer = tonumber (event.target.text)

		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
		 timer.performWithDelay(2000, HideCorrect)
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


local function AskQuestion3(  )

	randomNumber1 = math.random(0,10)
	randomNumber2 = math.random(0,10)

	correctAnswer = randomNumber1 * randomNumber2

	questionObject.text = randomNumber1 .. "*" .. randomNumber2
	
end




local function AskQuestion4(  )

	randomNumber1 = math.random(0,100)
	randomNumber2 = math.random(0,100)

	correctAnswer = randomNumber1 / randomNumber2

	questionObject.text = randomNumber1 .. "/" .. randomNumber2	
end
local function Division(  )

	if (firstNumber<secondNumber) then
		correctAnswer = randomNumber2/ randomNumber1
		questionObject.text = randomNumber2 .. "/" .. randomNumber1

	else
		correctAnswer = randomNumber1 - randomNumber2
		questionObject.text = randomNumber1 .. "/" .. randomNumber2
	end

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
numericField:addEventListener( "userInput", numericFieldListener )
wrongObject = display.newText ("Incorrect!", display.contentWidth/2, display.contentHeight/2, nil, 50)
wrongObject:setTextColor(65/255, 79/255, 3/255)
wrongObject.isVisible = false

------------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------------
AskQuestion()
AskQuestion2()
AskQuestion3()
AskQuestion4()










