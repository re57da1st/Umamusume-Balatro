--Mod File Loading
assert(SMODS.load_file("globals.lua"))()
assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/challenges.lua"))()
assert(SMODS.load_file("src/pokerhands.lua"))()
assert(SMODS.load_file("src/planets.lua"))()
assert(SMODS.load_file("src/tarots.lua"))()
assert(SMODS.load_file("src/other_consumables.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/boosters.lua"))()

if JokerDisplay then SMODS.load_file("src/joker_display_definitions.lua")() end

--Atlas Definitions
SMODS.Atlas({ --Mod Icon
    key = "modicon",
    path = "icon.png",
    px = 68,
    py = 68
})

SMODS.Atlas({ --(J)okers
    key = "j_umas",
    path = "j_umas.png",
    px = 71,
    py = 95
})

SMODS.Atlas({ --Test Jokers
    key = "test",
    path = "j_umas_test.png",
    px = 71,
    py = 95
})

SMODS.Atlas({ --(C)onsumables
    key = "c_umas",
    path = "c_umas.png",
    px = 71,
    py = 95
})

SMODS.Atlas({ --(E)nhancements
    key = "e_umas",
    path = "e_umas.png",
    px = 71,
    py = 95
})

SMODS.Atlas({ --Booster (P)acks
    key = "p_umas",
    path = "p_umas.png",
    px = 71,
    py = 95
})

--Pools

--Uma Jokers
--eval SMODS.add_card({set = "uma_jokers"})
SMODS.ObjectType({
    key = "uma_jokers",
    default = "j_uma_norn",
    cards = {
        j_uma_helios = true,
        j_uma_daiwa = true,
        j_uma_agnes = true,
        j_uma_turbo = true,
        j_uma_goldship = true,
        j_uma_oguri = true,
        j_uma_bakushin = true,
        j_uma_mambo = true,
        j_uma_chiyono = true,
        j_uma_norn = true,
        j_uma_obey = true,
        j_uma_fuku = true,
        j_uma_love = true,
        j_uma_vodka = true,
        j_uma_teio = true,

        --Move above once complete
        j_uma_mini = true,
        j_uma_creek = true,
        j_uma_air = true,
        j_uma_nature = true,
        j_uma_maruzensky = true,
        j_uma_rudolf = true,
        j_uma_tamamo = true,
        j_uma_meisho = true,
        j_uma_bourbon = true,
        j_uma_mayano = true,
        j_uma_belno = true,
        j_uma_vivlos = true,
        j_uma_neo = true,
        j_uma_lilac = true,
        j_uma_tact = true,
    },
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
    if check and self.sell_cost < 0 then
        return G.GAME.dollars + self.sell_cost >= G.GAME.bankrupt_at
    end
    return check
end