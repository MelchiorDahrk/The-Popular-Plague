local storage = require('openmw.storage')
local world = require('openmw.world')
local types = require('openmw.types')

local data = storage.globalSection('The-Popular-Plague')

return {
    engineHandlers = {
        onActivate = function(object, actor)
            if types.NPC.objectIsInstance(object)
                and actor == world.players[1]
            then
                local activeSpells = types.Actor.activeSpells(object)
                local isDiseased = activeSpells:isSpellActive("md24_greatnewdisease")
                local globalVariables = world.mwscript.getGlobalVariables(actor)
                globalVariables.md24_globSpeakerState = isDiseased and 1 or 0
            end
        end
    },
    eventHandlers = {
        md24_furn_paradoxscale = function(e)
            data:set("cell", e.cell)
            data:set("position", e.position)
        end,
        md24_teleport_return = function()
            local cell = data:get("cell")
            local position = data:get("position")
            world.players[1]:teleport(cell, position)
        end
    }
}