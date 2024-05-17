local self = require("openmw.self")
if self.recordId == "md24_anim_dance" then
    local nearby = require('openmw.nearby')
    for _, actor in ipairs(nearby.actors) do
        local distance = (self.position - actor.position):length()
        if distance <= 8 then
            actor:sendEvent("md24_anim_dance", {})
        end
    end
end
