---@diagnostic disable: lowercase-global

--- GLOBALS

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
    BETTER_PLANET2 = HEX("848FD2")
}

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
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
    return loc_colour_ref(_c, _default)
end

Uma_rank_tally = function(rank, modifier) --Tally up the amount of a certain rank in the deck
    local tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == rank then tally = tally + 1 end
            end
        end
    return tally * (modifier and modifier or 1)
end