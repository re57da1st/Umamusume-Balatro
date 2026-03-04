SMODS.ConsumableType {
    key = 'uma_ccs',
    primary_colour = G.C.UMA.MAMBO,
    secondary_colour = G.C.UMA.MAMBO2,
    collection_rows = { 3, 2 },
    shop_rate = 0
}

--Mambo Cards
SMODS.Consumable { --Mambo Boots
    key = 'mambo_boots',
    set = 'uma_ccs',
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
    end,

    in_pool = function(self, args)
        return G.GAME.mambo_subset
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_mambo_cards_loc'), G.C.UMA.MAMBO2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Mambo Hat
    key = 'mambo_hat',
    set = 'uma_ccs',
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
    end,

    in_pool = function(self, args)
        return G.GAME.mambo_subset
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_mambo_cards_loc'), G.C.UMA.MAMBO2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Mambo Plushie
    key = 'mambo_plushie',
    set = 'uma_ccs',
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
    end,

    in_pool = function(self, args)
        return G.GAME.mambo_subset
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_mambo_cards_loc'), G.C.UMA.MAMBO2, G.C.UMA.WHITE, 1.2)
    end
}



--Github Cards
SMODS.Consumable { --Push
    key = 'push',
    set = 'uma_ccs',
    pos = { x = 12, y = 0 },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    use = function(self, card, area, copier)
        local hand = G.hand.highlighted
        local value = (hand[1]:get_id() + hand[2]:get_id() - (13 * Uma_rank_tally(14, hand)))
        local ranks = {"Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"}
        local suit, enhancement, seal, edition = {}, {}, {}, {}
        if hand[1].base.suit then suit[#suit + 1] = hand[1].base.suit end
        if hand[2].base.suit then suit[#suit + 1] = hand[2].base.suit end
        if hand[1].config.center.key ~= 'c_base' then enhancement[#enhancement + 1] = hand[1].config.center.key end
        if hand[2].config.center.key ~= 'c_base' then enhancement[#enhancement + 1] = hand[2].config.center.key end
        if #enhancement == 0 then enhancement[#enhancement + 1] = 'c_base' end
        if hand[1].seal then seal[#seal + 1] = hand[1].seal end
        if hand[2].seal then seal[#seal + 1] = hand[2].seal end
        if hand[1].edition then edition[#edition + 1] = hand[1].edition.key end
        if hand[2].edition then edition[#edition + 1] = hand[2].edition.key end
        SMODS.add_card(
            {
                rank = ranks[value],
                suit = ((#suit > 0) and suit[pseudorandom('suit', 1, #suit)] or nil),
                enhancement = (enhancement[pseudorandom('enhancement', 1, #enhancement)]),
                seal = ((#seal > 0) and seal[pseudorandom('seal', 1, #seal)] or nil),
                edition = ((#edition > 0) and edition[pseudorandom('edition', 1, #edition)] or nil)
            }
        )
        SMODS.destroy_cards(G.hand.highlighted)
    end,

    can_use = function(self, card)
        if #G.hand.highlighted == 2 then
            local value = (G.hand.highlighted[1]:get_id() + G.hand.highlighted[2]:get_id() - (13 * Uma_rank_tally(14, G.hand.highlighted)))
            if value <= 14 then return true end
            return false
        end
    end,

    in_pool = function(self, args)
        return G.GAME.family_tree_subset
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_family_tree_loc'), G.C.UMA.FAMILY_TREE2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --pull
    key = 'pull',
    set = 'uma_ccs',
    pos = { x = 12, y = 1 },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    use = function(self, card, area, copier)
        local hand = G.hand.highlighted
        local value = (hand[1]:get_id())
        local values = {pseudorandom('pull', 1, value - 1)}
        values[#values + 1] = value - values[1]
        local ranks = {"Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"}
        local suit, enhancement, seal, edition = {}, {nil, nil}, {nil, nil}, {nil, nil}
        suit = hand[1].base.suit
        enhancement[pseudorandom('enhancement_choose', 1, 2)] = hand[1].config.center.key
        if hand[1].seal then seal[pseudorandom('seal_choose', 1, 2)] = hand[1].seal end
        if hand[1].edition then edition[pseudorandom('edition_choose', 1, 2)] = hand[1].edition.key end
        for i = 1, 2 do
            SMODS.add_card(
                {
                    rank = ranks[values[i]],
                    suit = suit,
                    enhancement = (enhancement[i]),
                    seal = ((#seal > 0) and seal[i] or nil),
                    edition = ((#edition > 0) and edition[i] or nil)
                }
            )
        end
        SMODS.destroy_cards(G.hand.highlighted)
    end,

    can_use = function(self, card)
        if #G.hand.highlighted == 1 then return true end
        return false
    end,

    in_pool = function(self, args)
        return G.GAME.family_tree_subset
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_family_tree_loc'), G.C.UMA.FAMILY_TREE2, G.C.UMA.WHITE, 1.2)
    end
}