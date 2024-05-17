---@param ref tes3reference
local function startDancing(ref)
    if ref.object.race.isBeast then return end

    tes3.playAnimation({
        reference = ref,
        mesh = "md24\\r\\belly_dance.nif",
        group = tes3.animationGroup.idle9,
    })
end

event.register("referenceActivated", function(e)
    if e.reference.id ~= "md24_anim_dance" then
        return
    end

    local position = e.reference.position
    local actors = tes3.findActorsInProximity({ position = position, range = 128 })
    for _, actor in pairs(actors) do
        if actor.position:distance(position) <= 8 then
            startDancing(actor.reference)
        end
    end
end)
