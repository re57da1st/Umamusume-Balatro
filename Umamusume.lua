--Mod File Loading
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

SMODS.Atlas({ --Boss (Bl)inds
    key = "bl_umas",
    path = "bl_umas.png",
    px = 34,
    py = 34,
    frames = 21,
    animate = true,
    atlas_table = "ANIMATION_ATLAS"
})

SMODS.Atlas({ --Card (B)acks (decks)
    key = "b_umas",
    path = "b_umas.png",
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
        j_uma_haru = true,
        j_uma_lilac = true,
        j_uma_neo = true,
        j_uma_mini = true,

        --Move above once complete
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
        j_uma_tact = true,
        j_uma_opera = true,
        j_uma_ebeyan = true,
        j_uma_g_city = true,
    }
})

SMODS.ObjectType({
    key = "uma_tarot_plus",
    default = "c_uma_better_strength",
    cards = {
        c_uma_better_fool = true,
        c_uma_better_magician = true,
        c_uma_better_high_priestess = true,
        c_uma_better_empress = true,
        c_uma_better_emperor = true,
        c_uma_better_heirophant = true,
        c_uma_better_chariot = true,
        c_uma_better_better_lovers = true,
        c_uma_better_justice = true,
        c_uma_better_hermit = true,
        c_uma_better_wheel_of_fortune = true,
        c_uma_better_strength = true,
        c_uma_better_hanged_man = true,
        c_uma_better_death = true,
        c_uma_better_devil = true,
        c_uma_better_tower = true,
        c_uma_better_judgement = true,
    }
})

SMODS.ObjectType({
    key = "uma_tarot_minus",
    default = "c_uma_worse_strength",
    cards = {
        c_uma_worse_magician = true,
        c_uma_worse_empress = true,
        c_uma_worse_emperor = true,
        c_uma_worse_heirophant = true,
        c_uma_worse_lovers = true,
        c_uma_worse_chariot = true,
        c_uma_worse_justice = true,
        c_uma_worse_hermit = true,
        c_uma_worse_wheel_of_fortune = true,
        c_uma_worse_strength = true,
        c_uma_worse_hanged_man = true,
        c_uma_worse_temperance = true,
        c_uma_worse_devil = true,
        c_uma_worse_tower = true,
        c_uma_worse_star = true,
        c_uma_worse_moon = true,
        c_uma_worse_sun = true,
        c_uma_worse_world = true,
    }
})

SMODS.ObjectType({
    key = "uma_planet_plus",
    default = "c_uma_better_pluto",
    cards = {
        c_uma_better_mercury = true,
        c_uma_better_venus = true,
        c_uma_better_earth = true,
        c_uma_better_mars = true,
        c_uma_better_jupiter = true,
        c_uma_better_saturn = true,
        c_uma_better_uranus = true,
        c_uma_better_neptune = true,
        c_uma_better_pluto = true,
        c_uma_better_planet_x = true,
        c_uma_better_ceres = true,
        c_uma_better_eris = true,
        c_uma_better_twin_moons = true,
    }
})

--Hooks
local oldgfuncsplaycardsfromhighlighted = G.FUNCS.play_cards_from_highlighted
G.FUNCS.play_cards_from_highlighted = function(e) --Agnes Hook to make sure cards don't get undairly debuffed
    for _, v in pairs(G.hand.highlighted) do
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

local oldgetcurrentpool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append) --Add each uma joker into the shop pool a 2nd time (2x more common) on URA deck
    local g, _pool_key = oldgetcurrentpool(_type, _rarity, _legendary, _append)
    if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_uma_ura' then
        for _, v in pairs(copy_table(g)) do
            if v ~= 'UNAVAILABLE' and G.P_CENTERS[v] and (G.P_CENTERS[v].set == 'Joker' or G.P_CENTERS[v].set == 'Consumeable') and G.P_CENTERS[v].original_mod and G.P_CENTERS[v].original_mod.id == 'uma' then
                table.insert(g, v)
            end
        end
    end
    return g, _pool_key
end