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
    key = "mercury",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 0, y = 3 },
    config = { hand_type = 'Pair' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Venus
SMODS.Consumable {
    key = "venus",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 1, y = 3 },
    config = { hand_type = 'Three of a Kind' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Earth
SMODS.Consumable {
    key = "earth",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 2, y = 3 },
    config = { hand_type = 'Full House' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Mars
SMODS.Consumable {
    key = "mars",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 3, y = 3 },
    config = { hand_type = 'Four of a Kind' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Jupiter
SMODS.Consumable {
    key = "jupiter",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 4, y = 3 },
    config = { hand_type = 'Flush' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Saturn
SMODS.Consumable {
    key = "saturn",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 5, y = 3 },
    config = { hand_type = 'Straight' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Uranus
SMODS.Consumable {
    key = "uranus",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 6, y = 3 },
    config = { hand_type = 'Two Pair' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Neptune
SMODS.Consumable {
    key = "neptune",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 7, y = 3 },
    config = { hand_type = 'Straight Flush' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}

-- Pluto
SMODS.Consumable {
    key = "pluto",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 8, y = 3 },
    config = { hand_type = 'High Card' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end
}

-- Planet X
SMODS.Consumable {
    key = "planet_x",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 9, y = 2 },
    config = { hand_type = 'Five of a Kind', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_planet_q'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end
}

-- Ceres
SMODS.Consumable {
    key = "ceres",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 8, y = 2 },
    config = { hand_type = 'Flush House', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end
}

-- Eris
SMODS.Consumable {
    key = "eris",
    set = "uma_Planet",
    cost = 3,
    pos = { x = 3, y = 2 },
    config = { hand_type = 'Flush Five', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.uma_Planet.text_colour,
            1.2)
    end
}