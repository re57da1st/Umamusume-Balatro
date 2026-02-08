SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 68,
    py = 68
})

assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/challenges.lua"))()
if JokerDisplay then
    SMODS.load_file("src/joker_display_definitions.lua")()
end