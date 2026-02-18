---@diagnostic disable: duplicate-set-field

--Mod File Loading

assert(SMODS.load_file("globals.lua"))()
assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/challenges.lua"))()
assert(SMODS.load_file("src/pokerhands.lua"))()
assert(SMODS.load_file("src/planets.lua"))()
assert(SMODS.load_file("src/tarots.lua"))()
assert(SMODS.load_file("src/other_consumables.lua"))()
if JokerDisplay then SMODS.load_file("src/joker_display_definitions.lua")() end

--Atlas Definitions

SMODS.Atlas({ --Mod Icon
    key = "modicon",
    path = "icon.png",
    px = 68,
    py = 68
})

SMODS.Atlas({ --Jokers
    key = "j_umas",
    path = "j_umas.png",
    px = 71,
    py = 95
})

SMODS.Atlas({ --Consumables
    key = "c_umas",
    path = "c_umas.png",
    px = 71,
    py = 95
})

--Hooks

local oldgfuncsplaycardsfromhighlighted = G.FUNCS.play_cards_from_highlighted
G.FUNCS.play_cards_from_highlighted = function(e) --Agnes Hook to make sure cards don't get undairly debuffed
    for k, v in pairs(G.hand.highlighted) do
        v.ability.uma = v.ability.played_this_ante
    end
    return oldgfuncsplaycardsfromhighlighted(e)
end

local card_can_sell_card_ref = Card.can_sell_card
function Card:can_sell_card(context) --Hook for cards to stop negative sell values from dropping your max money below the minimum
    local check = card_can_sell_card_ref(self, context)
    if check then
        return G.GAME.dollars + self.sell_cost >= G.GAME.bankrupt_at
    end
    return check
end