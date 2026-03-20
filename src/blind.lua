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
            if context.hand_drawn then
                local any_forced = nil
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_card.ability.forced_selection then
                        any_forced = true
                    end
                end
                if not any_forced then
                    G.hand:unhighlight_all()
                    local forced_card = pseudorandom_element(G.hand.cards, 'vremade_cerulean_bell')
                    forced_card.ability.forced_selection = true
                    G.hand:add_to_highlighted(forced_card)
                end
            end
        end
    end,
    disable = function(self)
        for _, playing_card in ipairs(G.playing_cards) do
            playing_card.ability.forced_selection = nil
        end
    end
}