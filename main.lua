g = love.graphics
k = love.keyboard
m = love.mouse

g3d = require "g3d"

love.graphics.setDefaultFilter("nearest","nearest")
scale = 5
love.window.setMode( 256*scale, 256*scale)
renderCanvas = g.newCanvas(256,256)


test = g3d.newModel("test.obj","texture.png")

function love.update(dt)
    g3d.camera.firstPersonMovement(dt)
end

function love.draw()
    g.setCanvas({renderCanvas, depth=true}) --we're drawing to a 256x256 "screen", it'll be upscalled when we draw it to the screen
    g.clear(0,0,0)

    test:draw()

    g.setCanvas()
    g.draw(renderCanvas,0,0 ,0 ,scale,scale)
end

function love.mousemoved(x,y,dx,dy)
    g3d.camera.firstPersonLook(dx,dy)
end