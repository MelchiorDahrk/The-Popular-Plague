local self = require("openmw.self")
local types = require("openmw.types")
local animation = require("openmw.animation")
local interfaces = require('openmw.interfaces')

return {
    engineHandlers = {
        --- Cancel dancing animations when combat is started.
        ---
        onUpdate = function()
            local activePackage = interfaces.AI.getActivePackage()
            if activePackage ~= nil
                and activePackage.target ~= nil
                and animation.isPlaying(self, "bellydance")
            then
                animation.cancel(self, "bellydance")
            end
        end
    },
    eventHandlers = {
        --- Play dancing animations when "md24_anim_dance" is placed.
        ---
        md24_anim_dance = function(data)
            local npc = types.NPC.records[self.recordId]
            local race = types.NPC.races.records[npc.race]
            if race.isBeast then
                return
            end

            animation.playBlended(self, "bellydance", { priority = animation.PRIORITY.Scripted })
        end,
    }
}
