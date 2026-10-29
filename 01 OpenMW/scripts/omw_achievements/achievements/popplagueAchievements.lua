local popplagueAchievements = {
    {
        type = "global_variable",
        name = "From Concept To Creation",
        description = "Find all 4 paintings in the Nadir.",
        variable = "md24_globPaintings",
        value = 4,
        operator = function(self, givenValue)
            return givenValue == self.value
        end,
        enableProgress = true,
        icon = "Icons\\md24\\v\\achievement_paintings.tga",
        bgColor = "purple",
        id = "md24_paintings",
        hidden = false
    },
    {
        type = "global_variable",
        name = "Fly Around And Find Out",
        description = "Jump into the void.",
        variable = "md24_globVoid",
        value = 1,
        operator = function(self, givenValue)
            return givenValue == self.value
        end,
        enableProgress = true,
        icon = "Icons\\md24\\v\\achievement_void.tga",
        bgColor = "purple",
        id = "md24_void",
        hidden = false
    },
    {
        type = "global_variable",
        name = "Chronic Shill",
        description = "Infect 7 villagers.",
        variable = "md24_globShill",
        value = 7,
        operator = function(self, givenValue)
            return givenValue == self.value
        end,
        enableProgress = true,
        icon = "Icons\\md24\\v\\achievement_shill.tga",
        bgColor = "purple",
        id = "md24_shill",
        hidden = false
    },
}

return popplagueAchievements