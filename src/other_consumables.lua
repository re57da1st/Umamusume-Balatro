-- This defines a new type of consumable with key "uma_Tarot",
-- if you want to create a regular Tarot ignore this and use set = "Tarot"
SMODS.ConsumableType {
    key = 'uma_mambo_consumable',
    default = 'c_uma_mambo_boots',
    primary_colour = G.C.UMA.MAMBO,
    secondary_colour = G.C.UMA.MAMBO2,
    collection_rows = { 3 },
    shop_rate = 4
}
--[[
    You can add a card from this ConsumableType just like you would do a normal consumable using
    `SMODS.add_card{set = "uma_Tarot"}
--]]

SMODS.Consumable {
    key = 'mambo_boots',
    set = 'uma_mambo_consumable',
    pos = { x = 7, y = 5 },
    atlas = 'c_umas',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end
}

SMODS.Consumable {
    key = 'mambo_hat',
    set = 'uma_mambo_consumable',
    pos = { x = 8, y = 5 },
    atlas = 'c_umas',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end
}

SMODS.Consumable {
    key = 'mambo_plushie',
    set = 'uma_mambo_consumable',
    pos = { x = 9, y = 5 },
    atlas = 'c_umas',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end
}
