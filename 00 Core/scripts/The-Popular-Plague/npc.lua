return {
    eventHandlers = {
        md24_anim_dance = function(data)
            local self = require("openmw.self")
            local types = require("openmw.types")


            local npc = types.NPC.records[self.recordId]
            local race = types.NPC.races.records[npc.race]
            if race.isBeast then
                return
            end

            local animation = require("openmw.animation")
            animation.playBlended(self, "bellydance", { priority = animation.PRIORITY.Scripted })
        end,
    }
}