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
            -- Play the dancing animation
            tes3.playAnimation({
                reference = actor.reference,
                mesh = "md24\\r\\belly_dance.nif",
                group = tes3.animationGroup.idle9,
            })
            -- Set dancing flag
            actor.reference.data.md24_dancing = true
        end
    end
end
event.register("referenceActivated", onReferenceActivated)

--- Cancel dancing animations when combat is started.
---
---@param e combatStartedEventData
local function onCombatStarted(e)
    local ref = e.actor.reference

    -- Is dancing flag was set
    if not ref.data.md24_dancing then
        return
    end

    -- Clear the dancing flag
    ref.data.md24_dancing = nil

    -- Interrupt the animation
    tes3.playAnimation({
        reference = e.actor.reference,
        group = table.choice({
            tes3.animationGroup.hit1,
            tes3.animationGroup.hit2,
            tes3.animationGroup.hit3,
            tes3.animationGroup.hit4,
            tes3.animationGroup.hit5,
        }),
    })
end
event.register("combatStarted", onCombatStarted)
