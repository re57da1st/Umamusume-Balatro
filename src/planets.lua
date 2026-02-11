SMODS.Consumable {
    key = "twin_moons",
    set = "Planet",
    cost = 3,
    pos = { x = 6, y = 5 },
    config = { hand_type = 'uma_perfect_pair', softlock = true },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_twin_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
            1.2)
    end
}