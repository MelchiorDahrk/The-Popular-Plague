--- Play dancing animations when "md24_anim_dance" is placed.
---
---@param e referenceActivatedEventData
local function onReferenceActivated(e)
    if e.reference.id ~= "md24_anim_dance" then
        return
    end

    local position = e.reference.position
    local actors = tes3.findActorsInProximity({ position = position, range = 128 })
    for _, actor in pairs(actors) do
        if actor.position:distance(position) <= 8
            and actor.object.race.isBeast == false
        then
            tes3.playAnimation({
                reference = actor.reference,
                mesh = "md24\\r\\belly_dance.nif",
                group = tes3.animationGroup.idle9,
            })
        end
    end
end
event.register("referenceActivated", onReferenceActivated)

--- Cancel dancing animations when combat is started.
---
---@param e combatStartedEventData
local function onCombatStarted(e)
    local object = e.target.object

    if object.objectType ~= tes3.objectType.npc then
        return
    end

    if object.mesh:lower() ~= "md24\\r\\belly_dance.nif" then
        return
    end

    local currentGroup = tes3.getAnimationGroups({ reference = e.target.reference })
    if currentGroup == tes3.animationGroup.idle9 then
        tes3.playAnimation({
            reference = e.target.reference,
            group = table.choice({
                tes3.animationGroup.hit1,
                tes3.animationGroup.hit2,
                tes3.animationGroup.hit3,
                tes3.animationGroup.hit4,
                tes3.animationGroup.hit5,
            }),
        })
    end
end
event.register("combatStarted", onCombatStarted)
