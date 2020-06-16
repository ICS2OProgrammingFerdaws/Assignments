-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Ferdaws
-- Date: MAy 25, 2020
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
-- HIDE THE STATUS BAR

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )

--------------------------------------------------------------------------------------------------------
-- Hide the Statusbar 
display.setStatusBar(display.HiddenStatusBar)
