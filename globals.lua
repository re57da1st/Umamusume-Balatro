--Color Definitions
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
    BANISH = HEX("990000"),
    FENO = HEX("544178")
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

local old_loc_colour = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then old_loc_colour() end
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
    G.ARGS.LOC_COLOURS.uma_chult = G.C.UMA.CHULT
    G.ARGS.LOC_COLOURS.uma_wealth = G.C.UMA.WEALTH
    G.ARGS.LOC_COLOURS.uma_doto = G.C.UMA.DOTO
    G.ARGS.LOC_COLOURS.uma_banish = G.C.UMA.BANISH
    G.ARGS.LOC_COLOURS.uma_feno = G.C.UMA.FENO
    return old_loc_colour(_c, _default)
end
--Color Definitions





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

SMODS.Atlas({ --Card (B)acks [also known as "decks"]
    key = "b_umas",
    path = "b_umas.png",
    px = 71,
    py = 95
})

SMODS.Atlas({ --(St)ickers
    key = "st_umas",
    path = "st_umas.png",
    px = 71,
    py = 95
})
--Atlas Definitions





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
        j_uma_maruzensky = true,
        j_uma_ebeyan = true,
        j_uma_vivlos = true,
        j_uma_tact = true,
        j_uma_doto = true,
        j_uma_opera = true,
        j_uma_aruvu = true,
        j_uma_belno = true,
        j_uma_tachyon = true,
        j_uma_mayano = true,
        j_uma_festa = true,
        j_uma_dober = true,
        j_uma_orfevre = true,
        j_uma_rudolf = true,
        j_uma_g_city = true,
        j_uma_desire = true,
        j_uma_nature = true,
        j_uma_air = true,

        --Move above once complete
        j_uma_creek = true,
        j_uma_tamamo = true,
        j_uma_bourbon = true,
        j_uma_rickey = true,
        j_uma_almond = true,
        j_uma_donna = true,
        j_uma_transcend = true,
        j_uma_feno = true,
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
--Pools





--Global Functions

--Tally up the amount of a certain rank in the deck
---@param rank integer Which rank to tally
---@param area table Area to look at for tallying
---@param modifier number Value to multiply the total count by
---@return number return
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
---@param items table List of items to choose from
---@param weights table List of weights that correlate 1:1 to the items
---@param seed any the seed used for randomization
---@return any return The item that was chosen
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

--Utilize the Uma Weighted Function to hold all Enhancement data for all Turf Packs in one place
---@return any return A random uma-related enhancement
function Uma_turf_pack_poll()
    local items = {
        "m_uma_turf",
        "m_uma_dirt",
        "m_uma_mossy",
        "m_uma_blossom"
    }
    local weights = {
        12,
        7,
        5,
        1
    }
    return Uma_weighted_picker(items, weights, "turf_pack")
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
---@param max_hands integer Sets the max number of hands you can have at once
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
---@param string string The input string to check for
---@param table table The input table to check in
---@return boolean return
function Uma_check_table_for_string(string, table)
    for i, _ in pairs(table) do
        if string == table[i] then
            return true
        end
    end
    return false
end

--Add bans to pre-existing challenges non-destructively
---@param challenge string The challenge key you want to modify
---@param bans table a table of banned items you want to insert
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

--Gets the race data or a provided Uma
---@param horse string Pass in the card key here
---@return table stats {Name, #1st, #2nd, #3rd, #total}
function uma_get_data(horse)
    local name = G.P_CENTERS[horse].key
    local r1 = G.P_CENTERS[horse].config.extra.race.r1
    local r2 = G.P_CENTERS[horse].config.extra.race.r2
    local r3 = G.P_CENTERS[horse].config.extra.race.r3
    local rt = G.P_CENTERS[horse].config.extra.race.rt
    return {name, r1, r2, r3, rt}
end

--Gets the Ratio of 2 numbers, rounded to 2 decimal places
---@param numerator integer The set of races you want to include
---@param denominator integer Usually the total number of races
---@param modifier number Multiplies the ratio by the number (I.E. 100)
---@return number output the percentage, from 0 to 1, for the given ratio
function uma_ratio(numerator, denominator, modifier)
    modifier = modifier or 1
    return (math.floor(((numerator)/denominator)*100*modifier)/modifier)
end

--Compare the race stats of 2 umas
---@param umas table List of Uma keys to compare
---@param values table list of 1st, 2nd, 3rd places to compare (I.E. {1,1,0} for 1st and 2nd place only)
---@return integer output Lists the uma with the best stats (equal to their order in 'umas' input)
function uma_compare(umas, values)
    local ratios = {}
    for i = 1, #umas do
        local uma = uma_get_data(umas[i])
        print(uma)
        ratios[i] = uma_ratio(uma[2]*values[1] + uma[3]*values[2] + uma[4]*values[3] , uma[5], nil)
        print(ratios[i])
    end

    local best_uma = 0
    local best_ratio = 0

    for i = 1, #ratios do
        if ratios[i] > best_ratio then
            best_uma = i
            best_ratio = ratios[i]
        end
    end

    print(best_uma)
    return best_uma
end
--Global Functions





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
            Uma_update_max_hands(nil)
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

    if G.GAME.blind.boss and context.end_of_round and context.main_eval then
        G.GAME.uma_bosses_beaten = G.GAME.uma_bosses_beaten + 1
    end

    --Enable showing race placings if certain cards are in play
    G.GAME.show_placings = (G.GAME.uma_placing_req > 0)

    --Enable GHold city's draw button if she is present
    if G.uma_g_city_button and G.uma_g_city_button.states then
        G.uma_g_city_button.states.visible = (#find_joker("j_uma_g_city") ~= 0)
    end

    --Force all jokers to be common if certain conditions are met
    if G.GAME.uma_all_commons > 0 and G.GAME.uma_all_commons_check == false then
        G.GAME.uma_all_commons_check = true

        --Make it all commons
        for i = 1, #SMODS.ObjectTypes['Joker'].rarities do
            G.GAME.uma_stored_rarities[i] = SMODS.ObjectTypes['Joker'].rarities[i].weight
            SMODS.ObjectTypes['Joker'].rarities[i].weight = (i == 1 and 1 or 0)
        end
    end

    --Return jokers to their original rarities
    if G.GAME.uma_all_commons == 0 and G.GAME.uma_all_commons_check == true then
        G.GAME.uma_all_commons_check = false

        --Restore original
        for i = 1, #SMODS.ObjectTypes['Joker'].rarities do
            SMODS.ObjectTypes['Joker'].rarities[i].weight = G.GAME.uma_stored_rarities[i]
        end
    end

end
--Constantly running code for other required effects





--Code that runs at the beginning of every run
function SMODS.current_mod.reset_game_globals(run_start)

    if run_start then
        --Set up max hand values
        G.GAME.uma_max_hands_buffer = 0
        G.GAME.uma_default_hands = G.GAME.round_resets.hands
        Uma_update_max_hands(nil)

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
        G.GAME.uma_placing_req = 0
        G.GAME.uma_bosses_beaten = 0
        G.GAME.uma_enhanced_rate = 0

        --Global values used to force jokers to be common
        G.GAME.uma_all_commons = 0
        G.GAME.uma_all_commons_check = false
        G.GAME.uma_stored_rarities = {}

        G.GAME.uma_state = 0

        --Set up special rarity weights for the legendary desk
        if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_uma_legendary' then
            SMODS.ObjectTypes["Joker"].rarities[1].weight = 0.85
            SMODS.ObjectTypes["Joker"].rarities[2].weight = 0.11
            SMODS.ObjectTypes["Joker"].rarities[3].weight = 0.03
            SMODS.ObjectTypes["Joker"].rarities[4].weight = 0.01
        else
            SMODS.ObjectTypes["Joker"].rarities[1].weight = 0.70
            SMODS.ObjectTypes["Joker"].rarities[2].weight = 0.25
            SMODS.ObjectTypes["Joker"].rarities[3].weight = 0.05
            SMODS.ObjectTypes["Joker"].rarities[4].weight = 0
        end

        --Count every hand that is hidden by default and add it to a list
        G.GAME.uma_hidden_hands = {}
        for k in pairs(G.GAME.hands) do
            if not G.GAME.hands[k].visible then
                G.GAME.uma_hidden_hands[#G.GAME.uma_hidden_hands + 1] = k
            end
        end
    end

end
--Code that runs at the beginning of every run





--Hooks

--Agnes Hook to make sure cards don't get undairly debuffed
local old_g_funcs_play_cards_from_highlighted = G.FUNCS.play_cards_from_highlighted
G.FUNCS.play_cards_from_highlighted = function(e)
    for _, v in pairs(G.hand.highlighted) do
        v.ability.uma = v.ability.played_this_ante
    end
    g = old_g_funcs_play_cards_from_highlighted(e)
    return g
end

--Hook for cards to stop negative sell values from dropping your max money below the minimum
local old_card_can_sell_card = Card.can_sell_card
function Card:can_sell_card(context)
    local g = old_card_can_sell_card(self, context)
    if g and self.sell_cost < 0 then
        return G.GAME.dollars + self.sell_cost >= G.GAME.bankrupt_at
    end
    return g
end

--Add each uma joker into the shop pool a 2nd time (2x more common) on URA deck
local old_get_currentpool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
    local g, _pool_key = old_get_currentpool(_type, _rarity, _legendary, _append)
    if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_uma_ura' then
        for _, v in pairs(copy_table(g)) do
            if v ~= 'UNAVAILABLE' and G.P_CENTERS[v] and (G.P_CENTERS[v].set == 'Joker' or G.P_CENTERS[v].set == 'Consumeable') and G.P_CENTERS[v].original_mod and G.P_CENTERS[v].original_mod.id == 'uma' then
                table.insert(g, v)
            end
        end
    end
    return g, _pool_key
end

--If the run was left mid-blind, retrigger all bakushin timers upon entering again
local old_start_run = Game.start_run
function Game:start_run(args)
    local g = old_start_run(self, args)
    if G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.label == "j_uma_bakushin" then
                v.ability.extra.resume = true
                v.ability.extra.active = false
            end
        end
    end
    return g
end

--Multiply money gain based on G.GAME.uma_money_mod
local old_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    if G.GAME.uma_money_mod and mod > 0 then
        mod = mod * G.GAME.uma_money_mod
    end
    g = old_ease_dollars(mod, instant)
    return g
end

local old_game_start_run = Game.start_run
function Game:start_run(args)
    old_game_start_run(self, args)

    self.uma_g_city_button = UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = 'cm',
                        padding = 0.15,
                        r = 0.08,
                        hover = true,
                        shadow = true,
                        colour = SMODS.Gradients.uma_rainbow, -- color of the button background
                        button = 'uma_g_city_button_click', -- function in G.FUNCS that will run when this button is clicked
                        func = 'uma_g_city_button_func', -- function in G.FUNCS that will run every frame this button exists (optional)
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = 'Draw Card',
                                        colour = G.C.UI.TEXT_LIGHT, -- color of the button text
                                        scale = 0.4,
                                    }
                                }
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {
                                align = 'cm'
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = '$'..G.P_CENTERS.j_uma_g_city.config.extra.cost,
                                        colour = G.C.UI.TEXT_LIGHT, -- color of the button text
                                        scale = 0.4,
                                    }
                                },
                            }
                        }
                    }
                }
            }
        },
        config = {
            align = 'tm', -- position relative to the card, meaning "center left". Follow the SMODS UI guide for more alignment options
            major = G.deck,
            bond = 'weak',
            offset = { x = 0.2, y = -0.4 } -- depends on the alignment you want, without an offset the button will look as if floating next to the card, instead of behind it
        }
    }
    self.uma_g_city_button.states.visible = false

end

local old_create_card = SMODS.create_card
function SMODS.create_card(t)
    if t.set == "Base" and pseudorandom("uma_enhancedd_rate") <= G.GAME.uma_enhanced_rate then
        t.set = "Enhanced"
    end
    local card = old_create_card(t)
    return card
end

local old_destroy_cards = SMODS.destroy_cards
function SMODS.destroy_cards(cards, bypass_eternal, immediate, skip_anim)
    print("Destroying!!!")
    old_destroy_cards(cards, bypass_eternal, immediate, skip_anim)
end
--Hooks