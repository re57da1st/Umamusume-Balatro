-- Frisk's Blind
SMODS.Blind {
    key = "frisk_blind",
    dollars = 8,
    mult = 2,
    pos = { x = 0, y = 26 },
    boss = { showdown = true },
    boss_colour = HEX("009cfd"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.hand_drawn and not context.first_hand_drawn then
                G.GAME.blind.chips = G.GAME.blind.chips * 1.25
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
        end
    end,

}