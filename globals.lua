-- GLOBALS

--Colors Definition 1
G.C.UMA = {
    RED = HEX("FF0000"),
    BLACK = HEX("000000"),
    BLUE = HEX("0000FF"),
    GREEN = HEX("00FF00"),
    WHITE = HEX("FFFFFF"),
    TRANSPARENT = HEX("00000000"),
    MAMBO = HEX("4D4979"),
    MAMBO2 = HEX("918EC3"),
    BAKUSHIN = HEX("FF93B8"),
    WORSE_TAROT = HEX("858585"),
    WORSE_TAROT2 = HEX("B7B7B7"),
    BETTER_TAROT = HEX("BE785A"),
    BETTER_TAROT2 = HEX("F7A985"),
    BETTER_PLANET = HEX("5B64AA"),
    BETTER_PLANET2 = HEX("848FD2"),
    BETTER_FAMILY_TREE = HEX("168536"),
    BETTER_FAMILY_TREE2 = HEX("12EA51"),
    TURF = HEX("70922D"),
    BLOSSOM = HEX("EFA7CD"),
    DIRT = HEX("966C4A"),
    CHULT = HEX('D002F0'),
}

SMODS.Gradient {
    key = "rainbow",
    colours = {
        HEX("e75110"),
        HEX("f9c231"),
        HEX("ffe022"),
        HEX("f3f700"),
        HEX("b5f318"),
        HEX("c5f09f"),
        HEX("6bd3bd"),
        HEX("80b2ec"),
        HEX("3f89e4"),
        HEX("313cde"),
        HEX("9492d6"),
        HEX("efa6b5"),
    },
    cycle = 5
}

--Colors Definition 2
local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then loc_colour_ref() end
    G.ARGS.LOC_COLOURS.uma_red = G.C.UMA.RED
    G.ARGS.LOC_COLOURS.uma_black = G.C.UMA.BLACK
    G.ARGS.LOC_COLOURS.uma_blue = G.C.UMA.BLUE
    G.ARGS.LOC_COLOURS.uma_green = G.C.UMA.GREEN
    G.ARGS.LOC_COLOURS.uma_white = G.C.UMA.WHITE
    G.ARGS.LOC_COLOURS.uma_transparent = G.C.UMA.TRANSPARENT
    G.ARGS.LOC_COLOURS.uma_potential = G.C.UMA.POT
    G.ARGS.LOC_COLOURS.uma_col_mambo = G.C.UMA.MAMBO
    G.ARGS.LOC_COLOURS.uma_col_mambo2 = G.C.UMA.MAMBO2
    G.ARGS.LOC_COLOURS.uma_col_bakushin = G.C.UMA.BAKUSHIN
    G.ARGS.LOC_COLOURS.uma_col_worse_tarot = G.C.UMA.WORSE_TAROT
    G.ARGS.LOC_COLOURS.uma_col_worse_tarot2 = G.C.UMA.WORSE_TAROT2
    G.ARGS.LOC_COLOURS.uma_col_better_tarot = G.C.UMA.BETTER_TAROT
    G.ARGS.LOC_COLOURS.uma_col_better_tarot2 = G.C.UMA.BETTER_TAROT2
    G.ARGS.LOC_COLOURS.uma_col_better_planet = G.C.UMA.BETTER_PLANET
    G.ARGS.LOC_COLOURS.uma_col_better_planet2 = G.C.UMA.BETTER_PLANET2
    G.ARGS.LOC_COLOURS.uma_col_better_family_tree = G.C.UMA.BETTER_FAMILY_TREE
    G.ARGS.LOC_COLOURS.uma_col_better_family_tree2 = G.C.UMA.BETTER_FAMILY_TREE2
    G.ARGS.LOC_COLOURS.uma_turf = G.C.UMA.TURF
    G.ARGS.LOC_COLOURS.uma_blossom = G.C.UMA.BLOSSOM
    G.ARGS.LOC_COLOURS.uma_dirt = G.C.UMA.DIRT
    G.ARGS.LOC_COLOURS.chult = G.C.UMA.CHULT
    return loc_colour_ref(_c, _default)
end



--Global Functions

--Tally up the amount of a certain rank in the deck
function Uma_rank_tally(rank, area, modifier)
    if not area then area = G.playing_cards end
    if not modifier then modifier = 1 end
    local tally = 0
        if area then
            for _, playing_card in ipairs(area) do
                if playing_card:get_id() == rank then tally = tally + 1 end
            end
        end
    return tally * modifier
end

--Chooses a random value from {items} based on their assigned {weights}
function Uma_weighted_picker(items, weights, seed)
    local size = math.min(#items, #weights)
    local weight_sum = 0
    for i = 1, size do
        weight_sum = weight_sum + weights[i]
    end
    local rng = pseudorandom(seed or 0)
    for i = 1, size do
        rng = rng - (weights[i] / weight_sum)
        if rng <= 0 then return items[i] end
    end
    return items[size]
end

--Enable/disable different subsets within the "Uma Assorted" set
function Uma_CSS_check()
    G.GAME.uma_ccs_rate = (
        (
            (G.GAME.mambo_subset and CssAPI.defaults.mambo_rate or 0) +
            (G.GAME.family_tree_subset and CssAPI.defaults.family_tree_rate or 0)
        ) * CssAPI.gamerate
    )
end

function Uma_update_max_hands()

    if G.GAME.uma_max_hands_buffer == 0 then
        G.GAME.round_resets.hands = G.GAME.uma_default_hands
        G.GAME.current_round.hands_left = G.GAME.round_resets.hand
        G.GAME.uma_max_hand = nil
    end

end



--Constantly running code for other required effects
function SMODS.current_mod.calculate(self, context)

    --Adds the most recently used Spectral/Tarot/Tarot+/Tarot- and Planet/Planet+ cards to trackable variables
    if context.using_consumeable then
        local item = context.consumeable
        if item.ability.set == 'Planet' or item.ability.set == 'uma_Planet' then
            G.GAME.uma_planet_card = item.config.center.key
        elseif item.ability.set == 'Tarot' or item.ability.set == 'uma_better_Tarot' or item.ability.set == 'uma_worse_Tarot' or item.ability.set == 'Spectral' then
            if item.config.center.key ~= 'c_fool' and item.config.center.key ~= 'c_uma_better_fool' then
                G.GAME.uma_tarot_card = item.config.center.key
            end
        end
    end

    --Spread code for turf and blossom cards
    if context.after then
        turf_count, normal_count = 0, 0
        for _, v in ipairs(context.scoring_hand) do
            if SMODS.has_enhancement(v, "m_uma_turf") or SMODS.has_enhancement(v, "m_uma_blossom") then
                turf_count = turf_count + 1
            end
            if SMODS.has_enhancement(v, "m_stone") or not next(SMODS.get_enhancements(v) or {}) then
                normal_count = normal_count + 1
            end
        end
        if turf_count * normal_count > 0 then
            local target = pseudorandom('turf',1,normal_count)
            for _, v in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, "m_stone") or not next(SMODS.get_enhancements(v) or {}) then
                    target = target - 1
                    if target == 0 then
                        if SMODS.has_enhancement(v, "m_stone") then
                            v:set_ability('m_uma_mossy', nil, true)
                        else
                            v:set_ability('m_uma_turf', nil, true)
                        end
                        return {
                            message = localize('uma_spread'),
                            colour = G.C.UMA.TURF,
                            message_card = v,
                            delay = 1
                        }
                    end
                end
            end
        end
    end

    --Tokai Teio un-debuff function (Since she can't un-debuff herself)
    if context.blind_defeated then
        --print("Defeated!")
        for _, v in ipairs(SMODS.find_card('j_uma_teio', true)) do
            --print('teio found')
            v.ability.extra.hospital = v.ability.extra.hospital - 1
            if v.ability.extra.hospital == 0 then
                SMODS.debuff_card(v, false, 'breakLeg')
                v.ability.extra.maxBuff = v.ability.extra.maxBuff - 1
                v.ability.extra.Xmult = v.ability.extra.Xmult * v.ability.extra.Xmult_mod
            end
        end
    end

    --(un)Stable Income challenge code
    if G.GAME.modifiers['unstable_income'] then
        if context.ending_shop and G.GAME.dollars >= G.GAME.modifiers.unstable_income[1] and #G.jokers.cards < G.jokers.config.card_limit then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    ease_dollars( math.floor(G.GAME.dollars * (G.GAME.modifiers.unstable_income[2] / -100) ) )
                    SMODS.add_card({set = "uma_jokers"})
                    return true
                end
            }))
        end
    end

     if G.GAME.uma_max_hands and G.GAME.current_round.hands_left > G.GAME.uma_max_hands and G.GAME.uma_max_hands_buffer > 0 then
        G.GAME.current_round.hands_left = G.GAME.round_resets.hands
    end

end

function SMODS.current_mod.reset_game_globals()

    G.GAME.uma_max_hands_buffer = 0
    G.GAME.uma_default_hands = G.GAME.round_resets.hands

    --Doubles the size of the consumable rate to make cards 2x more likely
    CssAPI.gamerate = 1
    if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_uma_ura' then
        CssAPI.gamerate = 2
    end

    --Any consumables that should be ON by default at the beginning of the run
    G.GAME.family_tree_subset = true

    --Update the consumable rate to match new changes
    Uma_CSS_check()
end