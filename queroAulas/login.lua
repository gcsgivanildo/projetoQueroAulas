-----------composer------------------
local composer = require("composer")

local scene = composer.newScene()
composer.removeScene( "main")
composer.removeScene( "cadastroProfessor" )
composer.removeScene( "login")
composer.removeScene( "home")
composer.removeScene( "pesquisarProfessor")



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


--<<<<<<< HEAD


-------------banco de dados------------------
local sqlite3 = require("sqlite3")
local path = system.pathForFile( "quero-aulas.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

local tableLogin = [[CREATE TABLE IF NOT EXISTS login (id INTEGER PRIMARY KEY autoincrement, usuario, senha);]]
print( tableLogin )
db:exec( tableLogin )

local usuariot = "givanildo"
local senhat = "cordeiro"

local insertLogin = [[INSERT INTO login VALUES (NULL, ']]..usuariot..[[',']]..senhat..[['); ]]
db:exec(insertLogin)



-------require-----------------
--=======
-->>>>>>> c1b9e741073b94d4642374e4af6324501f9851bf
local widget = require ("widget")


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
--local bemVindotxt = display.newText("    Seja\nBem Vindo", display.contentCenterX * 1.6, display.contentCenterY/9, native.systemFont, 18 )


local usuarioTxt = display.newText("Usuário", display.contentCenterX/4, display.contentCenterY /1.16, native.systemFont, 18 )
usuarioTxt:setFillColor( 1, 1, 1 )
local senhaTxt = display.newText("Senha", display.contentCenterX/4.4, display.contentCenterY /0.85, native.systemFont, 18 )



-------newTextField-----------
local usuarioTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY, display.contentWidth -50, display.contentHeight/15 )
local senhaTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY *1.3, display.contentWidth -50, display.contentHeight/15 )


local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( usuarioTf )
	meuGroup:insert( senhaTf )
	

-----------funcao--------
local function chamarHome( event )
	if (event.phase == "ended") then
		local composer = require("composer")
		composer.gotoScene( "home" )
	end
end

local function chamarMain( event )
	if (event.phase == "ended") then
		local composer = require("composer")
		composer.gotoScene( "main" )
	end
end

local function fazerLogin(  )
	if((nome == #dadosProfessor.usuario and senha == #dadosProfessor.usuario) 
		or nome == #dadosAluno.nome and senha == #dadosAlunos.senha)  then
		
	end
end

--------------botao----------------
local inicio = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/18,
	label = "Início",
	id = "inicio",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
    onEvent = chamarMain
	} )

local home = widget.newButton( {
	x = display.contentWidth /2,
	y = display.contentHeight/5.7,
	label = "Clique aqui para ter acesso ao site",
	id = "entrar",
	fontSize =18,
	width = 300, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect",
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	onEvent = chamarHome
	}  )

local logar = widget.newButton( {
	x = display.contentWidth /5.2,
	y = display.contentHeight *0.75,
	label = "Logar",	
	id = "logar",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	strokeColor = {default={0.9,0.9,0.9,1}, over={0.8,0.8,0.8, 1}},
    strokeWidth = 1,
    onEvent = ConcluirCadastroProfessor	
	}  )


-- destroy()
function scene:destroy( event )
        local group = self.view
 		group:insert(home)
 		group:insert(meuGroup)
 		group:insert(logar)
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
