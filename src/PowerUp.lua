PowerUp = Class {}

function PowerUp:init(params)
    self.skin = 0
    self.power = params.power
    self.x = params.brick.x + ((params.brick.width / 2) / 2)
    self.y = params.brick.y
    self.width = 16
    self.height = 16
    self.inPlay = true
    self.dy = 0
end

function PowerUp:update(dt)
        self.y = self.y + self.dy * dt
end

function PowerUp:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['power_ups'][self.skin], self.x, self.y)
    end
end

function PowerUp:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end

    return true
end
