event.register("initialized", function()
    if tes3.isModActive("The Popular Plague.esm") then
        require("The-Popular-Plague.music")
        require("The-Popular-Plague.quest")
    end
end)
