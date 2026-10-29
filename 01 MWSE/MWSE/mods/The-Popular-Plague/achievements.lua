local sb_achievements = include("sb_achievements.interop")

if sb_achievements == nil then
    return
end

local iconPath = "Icons\\md24\\v\\"

local cats = {
    popplague = sb_achievements.registerCategory("The Popular Plague")
}

sb_achievements.registerAchievement {
    id = "md24_paintings",
    category = cats.popplague,
    conditionType = sb_achievements.conditionType.progressAmount,
    progress = function()
        return tes3.getGlobal("md24_globPaintings")
    end,
    progressMax = function()
        return 4
    end,
    icon = iconPath .. "achievement_paintings.tga",
    colour = sb_achievements.colours.violet,
    title = "From Concept To Creation", desc = "Find all 4 paintings in the Nadir."
}

sb_achievements.registerAchievement {
    id = "md24_void",
    category = cats.popplague,
    conditionType = sb_achievements.conditionType.progressAmount,
    progress = function()
        return tes3.getGlobal("md24_globVoid")
    end,
    progressMax = function()
        return 1
    end,
    icon = iconPath .. "achievement_void.tga",
    colour = sb_achievements.colours.violet,
    title = "Fly Around And Find Out", desc = "Jump into the void."
}

sb_achievements.registerAchievement {
    id = "md24_shill",
    category = cats.popplague,
    conditionType = sb_achievements.conditionType.progressAmount,
    progress = function()
        return tes3.getGlobal("md24_globShill")
    end,
    progressMax = function()
        return 7
    end,
    icon = iconPath .. "achievement_shill.tga",
    colour = sb_achievements.colours.violet,
    title = "Chronic Shill", desc = "Infect 7 villagers."
}
