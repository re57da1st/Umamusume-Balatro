SMODS.current_mod.optional_features = function()
    return { retrigger_joker = true }
end

assert(SMODS.load_file("globals.lua"))()
assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/challenges.lua"))()
assert(SMODS.load_file("src/pokerhands.lua"))()
assert(SMODS.load_file("src/fuku.lua"))()
assert(SMODS.load_file("src/planets.lua"))()
assert(SMODS.load_file("src/other_consumables.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/boosters.lua"))()
assert(SMODS.load_file("src/interface.lua"))()
assert(SMODS.load_file("src/blind.lua"))()
assert(SMODS.load_file("src/backs.lua"))()
assert(SMODS.load_file("src/stickers.lua"))()

if JokerDisplay then SMODS.load_file("src/joker_display_definitions.lua")() end