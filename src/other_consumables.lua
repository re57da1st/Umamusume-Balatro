-- This defines a new type of consumable with key "uma_Tarot",
-- if you want to create a regular Tarot ignore this and use set = "Tarot"
SMODS.ConsumableType {
    key = 'uma_mambo_consumable',
    default = 'c_uma_mambo_boots',
    primary_colour = G.C.UMA.MAMBO,
    secondary_colour = G.C.UMA.MAMBO2,
    collection_rows = { 3 },
    shop_rate = 0
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
    loc_vars = function(self, info_queue, card)
        return { vars = {
           10
        } }
    end,
    use = function(self, card, area, copier)

    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'mambo_hat',
    set = 'uma_mambo_consumable',
    pos = { x = 8, y = 5 },
    atlas = 'c_umas',
    loc_vars = function(self, info_queue, card)
        return { vars = {
           4
        } }
    end,
    use = function(self, card, area, copier)

    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'mambo_plushie',
    set = 'uma_mambo_consumable',
    pos = { x = 9, y = 5 },
    atlas = 'c_umas',
    loc_vars = function(self, info_queue, card)
        return { vars = {
           0.1
        } }
    end,
    use = function(self, card, area, copier)

    end,
    can_use = function(self, card)
        return true
    end
}