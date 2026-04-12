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
    DIRT = HEX("AA6F40"),
    CHULT = HEX("D002F0"),
    WEALTH = HEX("EFAD29"),
    DOTO = HEX("595DDB"),
}

SMODS.Gradient {
    key = "rainbow",
    colours = {
        HEX("bf0000"),
        HEX("bf8f00"),
        HEX("60bf00"),
        HEX("00bf30"),
        HEX("00bfbf"),
        HEX("0030bf"),
        HEX("6000bf"),
        HEX("bf008f")
    },
    cycle = 5
}

SMODS.Gradient {
    key = "retrigger",
    colours = {
        HEX("A284EC"),
        HEX("BEA1F3")
    },
    cycle = 2
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
    G.ARGS.LOC_COLOURS.wealth = G.C.UMA.WEALTH
    G.ARGS.LOC_COLOURS.doto = G.C.UMA.DOTO
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

--Updates the max number of hands you can play, set by G.GAME.uma_max_hands
function Uma_update_max_hands(max_hands)
    if max_hands then
        G.hand.config.card_limit = max_hands
    end
    --print("max hand test")
    if G.GAME.uma_max_hands_buffer <= 0 then
    G.GAME.uma_max_hands_buffer = 0
        G.GAME.round_resets.hands = G.GAME.uma_default_hands
        G.GAME.uma_max_hands = nil
    else
        G.GAME.round_resets.hands = G.GAME.uma_max_hands
        G.GAME.current_round.hands_left = G.GAME.round_resets.hands
    end

end

--Checks a provided table to see if the provided string inside
function Uma_check_table_for_string(string, table)
    for i, _ in pairs(table) do
        if string == table[i] then
            return true
        end
    end
    return false
end

--Add bans to pre-existing challenges non-destructively
function Uma_Challenge_ban(challenge, bans)
    local old_data = SMODS.Challenges[challenge]
    if not old_data.restrictions then
        old_data.restrictions = {}
    end
    for _, v in pairs({"banned_cards", "banned_tags", "banned_other"}) do
        if not old_data.restrictions[v] then
            old_data.restrictions[v] = {}
        end
    end
    if next(bans.cards) ~= nil then
        for _, v in pairs(bans.cards) do
            table.insert(old_data.restrictions.banned_cards, v)
        end
    end
    if next(bans.tags) ~= nil then
        for _, v in pairs(bans.tags) do
            table.insert(old_data.restrictions.banned_tags, v)
        end
    end
    if next(bans.other) ~= nil then
        for _, v in pairs(bans.other) do
            table.insert(old_data.restrictions.banned_other, v)
        end
    end
    SMODS.Challenge:take_ownership(challenge, old_data, true)
end

--Refreshes Daring Tact's values
function Uma_Tact_refresh()
    for k, v in ipairs(G.jokers.cards) do
        if v.config.center_key == "j_uma_tact" then
            v.ability.extra.current = (G.GAME.uma_global_counts.spread + G.GAME.uma_global_counts.bloom) * v.ability.extra.increment

            SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = lighten(G.C.BLUE, 0.35) }, v)

        end
    end
end



--Constantly running code for other required effects
function SMODS.current_mod.calculate(self, context)

    --Adds the most recently used Spectral/Tarot/Tarot+/Tarot- and Planet/Planet+ cards to trackable variables
    if context.using_consumeable then
        local item = context.consumeable

        local tarot_bool = Uma_check_table_for_string(item.ability.name, uma_tarot_plus_directory) or
            Uma_check_table_for_string(item.ability.name, uma_tarot_minus_directory)
        local planet_bool = Uma_check_table_for_string(item.ability.name, uma_planet_plus_directory)

        if item.ability.set == 'Planet' or planet_bool then
            G.GAME.uma_planet_card = item.config.center.key
        elseif item.ability.set == 'Tarot' or tarot_bool or item.ability.set == 'Spectral' then
            if item.config.center.key ~= 'c_fool' and item.config.center.key ~= 'c_uma_better_fool' then
                G.GAME.uma_tarot_card = item.config.center.key
            end
        end
    end

    --Spread code for turf and blossom cards
    if context.after then
        turf_count, normal_count = 0, 0
        for _, v in ipairs(context.scoring_hand) do
            if (SMODS.has_enhancement(v, "m_uma_turf") or SMODS.has_enhancement(v, "m_uma_blossom")) and not v.debuff then
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
                        G.GAME.uma_global_counts.spread = G.GAME.uma_global_counts.spread + 1
                        SMODS.calculate_effect({message = localize('uma_spread'), colour = G.C.UMA.TURF, delay = 1}, v)
                        Uma_Tact_refresh()
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
            if v.ability.extra.hospital == -1 then
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

    --Limit your hands if G.GAME.uma_max_hands is set and G.GAME.uma_max_hands_buffer is filled
    if G.GAME.uma_max_hands and G.GAME.current_round.hands_left then
        if G.GAME.current_round.hands_left > G.GAME.uma_max_hands and G.GAME.uma_max_hands_buffer > 0 then
            Uma_update_max_hands()
        end
    end

    --Increase tarot and planet usage total if using a Tarot+, Tarot- or Planet+ card
    if context.using_consumeable then
        local name = context.consumeable.ability.name

        local tarot_bool = Uma_check_table_for_string(name, uma_tarot_plus_directory) or
            Uma_check_table_for_string(name, uma_tarot_minus_directory)
        local planet_bool = Uma_check_table_for_string(name, uma_planet_plus_directory)

        if tarot_bool then
            G.GAME.consumeable_usage_total.tarot = G.GAME.consumeable_usage_total.tarot + 1
        end
        if planet_bool then
            G.GAME.consumeable_usage_total.planet = G.GAME.consumeable_usage_total.planet + 1
        end
    end

    --Updates the status of Wealth stickers at end of round based on their "safe" marking
    if context.end_of_round and context.main_eval then
        for _, v in ipairs(G.playing_cards) do
            if v.ability["uma_wealth"] then
                if v.ability["uma_wealth"].extra.safe then
                    v.ability["uma_wealth"].extra.safe = false
                else
                    v:remove_sticker("uma_wealth", true)
                end
            end
        end
    end

    --Code that allows for joker re-triggers
    if context.retrigger_joker_check and context.other_card.ability and context.other_card.ability.uma_retrigger then
        return { repetitions = context.other_card.ability.uma_retrigger }
    end

end



--Code that runs at the beginning of every run
function SMODS.current_mod.reset_game_globals(run_start)

    if run_start then
        --Set up max hand values
        G.GAME.uma_max_hands_buffer = 0
        G.GAME.uma_default_hands = G.GAME.round_resets.hands
        Uma_update_max_hands()

        --Doubles the size of the consumable rate to make cards 2x more likely on URA Deck
        CssAPI.gamerate = 1
        if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_uma_ura' then
            CssAPI.gamerate = 2
        end

        --Any consumables that should be ON by default at the beginning of the run
        G.GAME.family_tree_subset = true

        --Update the consumable rate to match new changes
        Uma_CSS_check()

        --Set up global count values for the run
        G.GAME.uma_global_counts = {}
        G.GAME.uma_global_counts.spread = 0
        G.GAME.uma_global_counts.bloom = 0

        G.GAME.uma_state = 0
    end

end