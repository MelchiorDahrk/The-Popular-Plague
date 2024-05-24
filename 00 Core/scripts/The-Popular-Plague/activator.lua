local self = require("openmw.self")
local types = require("openmw.types")
local nearby = require('openmw.nearby')

-- When created (via PlaceAtMe) find the associated actor and make them dance.

if self.recordId == "md24_start_dancing" then
    for _, actor in ipairs(nearby.actors) do
        if actor.type == types.NPC then
            local distance = (self.position - actor.position):length()
            if distance <= 8 then
                actor:sendEvent("md24_start_dancing", {})
            end
        end
    end
end

if self.recordId == "md24_stop_dancing" then
    for _, actor in ipairs(nearby.actors) do
        if actor.type == types.NPC then
            local distance = (self.position - actor.position):length()
            if distance <= 8 then
                actor:sendEvent("md24_stop_dancing", {})
            end
        end
    end
end

if self.recordId == "md24_anim_blow" then
    for _, actor in ipairs(nearby.actors) do
        if actor.type == types.NPC then
            local distance = (self.position - actor.position):length()
            if distance <= 8 then
                actor:sendEvent("md24_anim_blow", {})
            end
        end
    end
end