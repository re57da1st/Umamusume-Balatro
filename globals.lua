--- GLOBALS

G.C.UMA = {
    RED = HEX("FF0000"),
    BLACK = HEX("000000"),
    BLUE = HEX("0000FF"),
    GREEN = HEX("00FF00"),
    WHITE = HEX("FFFFFF"),
    TRANSPARENT = HEX("00000000"),
}

-- Hooks

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
    return loc_colour_ref(_c, _default)
end