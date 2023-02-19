
WinState = Class{__includes = BaseState}

function WinState:enter(params)
    self.paddle = params.paddle
    self.health = params.health
    self.score = params.score
    self.level = params.level
end

function WinState:update()
    gSounds['victory']:play()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gSounds['victory']:pause()
        gStateMachine:change('serve', {
            paddle = self.paddle,
            bricks = LevelMaker.createMap(self.level + 1),
            health = self.health,
            score = self.score,
            level = self.level
        })
    end
end

function WinState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("Level " .. tostring(self.level) .. " complete!", 0, VIRTUAL_HEIGHT / 4,
        VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to serve!', 0, VIRTUAL_HEIGHT / 2,
        VIRTUAL_WIDTH, 'center')
end