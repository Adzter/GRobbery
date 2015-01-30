include('shared.lua')

local onCooldown = false
local cooldownTimer = 0

function ENT:Draw()
    -- self.BaseClass.Draw(self) -- Overrides Draw
    self:DrawModel() -- Draws Model Client Side
end