SMODS.Consumable {
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


-- This defines a new type of consumable with key "uma_Planet",
-- if you want to create a regular Planet ignore this and use set = "Planet"
SMODS.ConsumableType {
    key = 'uma_Planet',
    default = 'c_uma_pluto',
    primary_colour = G.C.SET.Planet,
    secondary_colour = G.C.SECONDARY_SET.Planet,
    collection_rows = { 6, 6 },
}
--[[
    You can add a card from this ConsumableType just like you would do a normal consumable using
    `SMODS.add_card{set = "uma_Planet"}
--]]

-- Mercury
SMODS.Consumable {
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

-- Venus
SMODS.Consumable {
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

-- Earth
SMODS.Consumable {
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

-- Mars
SMODS.Consumable {
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

-- Jupiter
SMODS.Consumable {
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

-- Saturn
SMODS.Consumable {
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

-- Uranus
SMODS.Consumable {
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

-- Neptune
SMODS.Consumable {
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

-- Pluto
SMODS.Consumable {
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

-- Planet X
SMODS.Consumable {
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

-- Ceres
SMODS.Consumable {
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

-- Eris
SMODS.Consumable {
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

--Twin Moons
SMODS.Consumable {
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