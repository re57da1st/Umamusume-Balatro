SMODS.ConsumableType {
    key = 'uma_Planet',
    default = 'c_uma_better_pluto',
    primary_colour = G.C.UMA.BETTER_PLANET,
    secondary_colour = G.C.UMA.BETTER_PLANET2,
    collection_rows = { 6, 6 },
}



--Planet Cards
SMODS.Consumable { --Twin Moons
    key = "twin_moons",
    set = "Planet",
    cost = 3,
    pos = { x = 4, y = 3 },
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



--Better Planet Cards
SMODS.Consumable {--Better Mercury
    key = "better_mercury",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 0, y = 4 },
    config = { hand_type = 'Pair' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Venus
    key = "better_venus",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 1, y = 4 },
    config = { hand_type = 'Three of a Kind' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Earth
    key = "better_earth",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 2, y = 4 },
    config = { hand_type = 'Full House' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Mars
    key = "better_mars",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 3, y = 4 },
    config = { hand_type = 'Four of a Kind' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Jupiter
    key = "better_jupiter",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 4, y = 4 },
    config = { hand_type = 'Flush' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Saturn
    key = "better_saturn",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 5, y = 4 },
    config = { hand_type = 'Straight' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Uranus
    key = "better_uranus",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 6, y = 4 },
    config = { hand_type = 'Two Pair' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Neptune
    key = "better_neptune",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 7, y = 4 },
    config = { hand_type = 'Straight Flush' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) },
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3
            }
        }
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Pluto
    key = "better_pluto",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 8, y = 4 },
    config = { hand_type = 'High Card' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Planet X
    key = "better_planet_x",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 9, y = 4 },
    config = { hand_type = 'Five of a Kind'},
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        
        badges[#badges + 1] = create_badge(localize('k_planet_q'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end,

    in_pool = function(self, args)
        return G.GAME.hands[self.config.hand_type].played > 0
    end
}

SMODS.Consumable {--Better Ceres
    key = "better_ceres",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 10, y = 4 },
    config = { hand_type = 'Flush House' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end,
    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end,

    in_pool = function(self, args)
        return G.GAME.hands[self.config.hand_type].played > 0
    end
}

SMODS.Consumable {--Better Eris
    key = "better_eris",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 11, y = 4 },
    config = { hand_type = 'Flush Five' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end,

    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end,

    in_pool = function(self, args)
        return G.GAME.hands[self.config.hand_type].played > 0
    end
}

SMODS.Consumable {--Better Twin Moons
    key = "better_twin_moons",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 5, y = 3 },
    config = { hand_type = 'uma_perfect_pair' },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                G.GAME.hands[card.ability.hand_type].l_mult * 3,
                G.GAME.hands[card.ability.hand_type].l_chips * 3,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_twin_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
            1.2)
    end,

    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end,

    in_pool = function(self, args)
        return G.GAME.hands[self.config.hand_type].played > 0
    end
}