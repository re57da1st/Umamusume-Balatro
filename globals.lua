-- GLOBALS

G.C.UMA = { --Colors Definition 1
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
    TURF = HEX("70922D"),
    BLOSSOM = HEX("EFA7CD")
}

local loc_colour_ref = loc_colour
function loc_colour(_c, _default) --Colors Definition 2
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
    G.ARGS.LOC_COLOURS.uma_turf = G.C.UMA.TURF
    G.ARGS.LOC_COLOURS.uma_blossom = G.C.UMA.BLOSSOM
    return loc_colour_ref(_c, _default)
end

--Global Functions
Uma_rank_tally = function(rank, modifier) --Tally up the amount of a certain rank in the deck
    local tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == rank then tally = tally + 1 end
            end
        end
    return tally * (modifier and modifier or 1)
end

function Uma_weighted_picker(items, weights, seed) --Chooses a random value from {items} based on their assigned {weights}
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

function SMODS.current_mod.calculate(self, context) --Adds the most recently used Spectral/Tarot/Tarot+/Tarot - and Planet/Planet+ cards to trackable variables
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
end

function SMODS.current_mod.calculate(self, context) --Spread code for turf and blossom cards
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
end