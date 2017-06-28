
-----------composer------------------
local composer = require("composer")

local scene = composer.newScene()
composer.removeScene( "main")
composer.removeScene( "login")
--composer.removeScene( "home")
composer.removeScene( "cadastroProfessor" )
composer.removeScene( "cadastrarProfessor" )
composer.removeScene( "propostaAluno" )
composer.removeScene( "respostaProfessor" )
composer.removeScene( "pesquisarProfessor")
composer.removeScene( "negociacaoProfessor" )
composer.removeScene( "cadastro" )
composer.removeScene( "aceiteProfessor" )
composer.removeScene( "confirmaPropostaAluno" )

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


local widget = require ("widget")

----------newImageRect-------------
local imagehome = display.newImage("imagens/homeQA3.jpg")
imagehome.x = display.contentWidth/2
imagehome.y = display.contentHeight/2
imagehome.width = display.contentWidth*1.2
imagehome.height = display.contentHeight*1.2

----------newRect-------------
ret = display.newRect(display.contentCenterX, 84, display.contentWidth * 2, display.contentHeight * 0.08)
ret:setFillColor( 1, 1, 1 )
linha = display.newRect(display.contentCenterX*1.25, 25, display.contentWidth * .008, display.contentHeight * 0.1)
linha:setFillColor( 1, 1, 1, .7 )
local logo = display.newImageRect( "imagens/logo.png", 80, 80)
logo.x = display.contentCenterX/1.6
logo.y = display.contentCenterY/12
logo.width = display.contentWidth/1.8
logo.height = display.contentHeight/8

--------newText------------
local localizacaoTxt = display.newText("Funções do app", display.contentCenterX/2, display.contentCenterY /2.9, native.systemFont, 18 )
localizacaoTxt:setFillColor( 0, 0, 255 )

local meuGroup = display.newGroup()
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( localizacaoTxt )

-----------funcao--------
local function chamarlogin( event )
	if (event.phase == "ended") then
		local composer = require("composer")
		composer.gotoScene( "login" )
	end
end

local function chamarCadastrarProfessor( event )
	if (event.phase == "ended") then
	composer.gotoScene( "cadastrarProfessor" )
	end
end

local function chamarPesquisarProfessor( event )
	if (event.phase == "ended") then
	composer.gotoScene( "pesquisarProfessor" )
	end
end

local function chamartelaMain( event )
	if (event.phase == "ended") then
	composer.gotoScene( "main" )
	end
end

local function chamarpropostaAluno( event )
if(event.phase == "ended") then
local composer = require("composer")
composer.gotoScene( "propostaAluno")
	end
end

local function chamartelaRespProfessor( event )
	if (event.phase == "ended") then
	composer.gotoScene( "respostaProfessor" )
	end
end


-------newButton-----------
local inicio = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/18,
	label = "Início",
	id = "inicio",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
    onEvent = chamartelaMain
	} )


--Botões para acesso à funções
local login = widget.newButton( {
	x = 0,
	y = 0,
	label = "Fazer login",
	id = "login",
	fontSize =18,
	width = 200, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect",
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	--onEvent = chamarlogin
	}  )

local pesquisarProfessor = widget.newButton( {
	x = 0,
	y = 50,
	label = "Pesquisar Professor",
	id = "pesquisarProfessor",
	fontSize =18,
	width = 200, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect",
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	onEvent = chamarPesquisarProfessor
	}  )

local prpstAluno = widget.newButton( {
	x = 0,
	y = 100,
	label = "Proposta Aluno",
	id = "propostaaluno",
	fontSize =18,
	width = 200, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect",
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	onEvent = chamarpropostaAluno
	}  )

local respProfessor = widget.newButton( {
	x = 0,
	y = 150,
	label = "Resp. Professor",
	id = "respostaProfessor",
	fontSize =18,
	width = 200, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect",
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	onEvent = chamartelaRespProfessor
	}  )

local cadastrarProfessor = widget.newButton( {
	x = 0,
	y = 200,
	label = "Cadastrar Professor",
	id = "cadastrarProfessor",
	fontSize =18,
	width = 200, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect",
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	onEvent = chamarCadastrarProfessor
	}  )

local groupbtnHome = display.newGroup()
		groupbtnHome:insert(login)
		groupbtnHome:insert(pesquisarProfessor)
		groupbtnHome:insert(prpstAluno)
		groupbtnHome:insert(respProfessor)
		groupbtnHome:insert(cadastrarProfessor)
		--groupbtnHome:insert(login)

groupbtnHome.anchorX = 0
groupbtnHome.anchorY = 0

groupbtnHome.x = display.contentCenterX--/1.5
groupbtnHome.y = display.contentHeight/3.5

-- destroy()
function scene:destroy( event )
        local group = self.view
 		--group:insert(login)
 		group:insert(groupbtnHome)
 		group:insert(pesquisarProfessor)
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

--]]





