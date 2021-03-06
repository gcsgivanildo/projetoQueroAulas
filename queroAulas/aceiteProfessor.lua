
local composer = require("composer")
local dadosProf = require("funcoes")
local widget = require ("widget")

local scene = composer.newScene()
composer.removeScene( "home" )
composer.removeScene("respostaProfessor")

-- create()
function scene:create( event )
     local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 end
  
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    end
end
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end

local function chamartelaHome( event )
	if (event.phase == "ended") then	

	composer.gotoScene( "home" )
	end
end

local function chamartelaConfirmaProposta( event )
	if (event.phase == "ended") then	

	composer.gotoScene( "confirmaPropostaAluno" )
	end
end


----------newRect-------------
retLogo = display.newRect(display.contentCenterX, 22, display.contentWidth * 2, display.contentHeight * 0.18)
retLogo:setFillColor( 0, 0, 250 )
ret = display.newRect(display.contentCenterX, 84, display.contentWidth * 2, display.contentHeight * 0.08)
ret:setFillColor( 1, 1, 1 )
linha = display.newRect(display.contentCenterX*1.25, 25, display.contentWidth * .008, display.contentHeight * 0.1)
linha:setFillColor( 1, 1, 1, .7 )
local logo = display.newImageRect( "icones/chapeu.png", 80, 80 )
logo.x = display.contentCenterX / 3.5
logo.y = display.contentCenterY / 10

--------newText------------
local logotxt = display.newText("Quero Aulas", display.contentCenterX/1.1, display.contentCenterY/9, native.systemFont, 18 )
local localizacaoTxt = display.newText("Painel: Professor", display.contentCenterX/1.6, display.contentCenterY /2.9, native.systemFont, 18 )
localizacaoTxt:setFillColor( 0, 0, 255 )


local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( localizacaoTxt )



local lblMensgSucesso = display.newText("Sua proposta de Aceite \n          foi enviada!", display.contentCenterX, display.contentCenterY, native.systemFont, 18 )

-------newButton-----------
local inicio = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/18,
	label = "Início",	
	id = "inicio",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},	
    onEvent = chamartelaHome
	} )

-- destroy()
function scene:destroy( event )
       local group = self.view
 		group:insert(lblMensgSucesso)
 		group:insert(meuGroup)
 		
end
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene



