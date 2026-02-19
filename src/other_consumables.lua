SMODS.ConsumableType {
    key = 'uma_mambo_consumable',
    default = 'c_uma_mambo_boots',
    primary_colour = G.C.UMA.MAMBO,
    secondary_colour = G.C.UMA.MAMBO2,
    collection_rows = { 3 },
    shop_rate = 0
}



--Mambo Cards
SMODS.Consumable { --Mambo Boots
    key = 'mambo_boots',
    set = 'uma_mambo_consumable',
    pos = { x = 10, y = 3 },
    atlas = 'c_umas',
    loc_vars = function(self, info_queue, card)
        return { vars = {
           G.P_CENTERS.j_uma_mambo.config.extra.chips_mod
        } }
    end,
    use = function(self, card, area, copier)

    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable { --Mambo Hat
    key = 'mambo_hat',
    set = 'uma_mambo_consumable',
    pos = { x = 11, y = 3 },
    atlas = 'c_umas',
    loc_vars = function(self, info_queue, card)
        return { vars = {
           G.P_CENTERS.j_uma_mambo.config.extra.mult_mod
        } }
    end,
    use = function(self, card, area, copier)

    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable { --Mambo Plushie
    key = 'mambo_plushie',
    set = 'uma_mambo_consumable',
    pos = { x = 12, y = 3 },
    atlas = 'c_umas',
    loc_vars = function(self, info_queue, card)
        return { vars = {
           G.P_CENTERS.j_uma_mambo.config.extra.xmult_mod
        } }
    end,
    use = function(self, card, area, copier)

    end,
    can_use = function(self, card)
        return true
    end
}