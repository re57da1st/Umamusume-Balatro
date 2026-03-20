CssAPI = {
    config = {
        mambo_rate = 4,
        family_tree_rate = 1.25
    }
}

SMODS.ConsumableType {
    key = 'uma_ccs',
    primary_colour = G.C.UMA.MAMBO,
    secondary_colour = G.C.UMA.MAMBO2,
    collection_rows = { 3, 4 },
    shop_rate = 0,
    rarities = {
        {key = 1, weight = CssAPI.config.mambo_rate},
        {key = 2, weight = CssAPI.config.family_tree_rate}
    }
}

--Mambo Cards
SMODS.Consumable { --Mambo Boots
    key = 'mambo_boots',
    rarity = 1,
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
    rarity = 1,
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
    rarity = 1,
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



--Family Tree Cards
SMODS.Consumable { --Posterity
    key = 'posterity',
    rarity = 2,
    set = 'uma_ccs',
    pos = { x = 12, y = 0 },
    atlas = 'c_umas',
    soul_pos = { x = 13, y = 0 },

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

SMODS.Consumable { --pedigree
    key = 'pedigree',
    rarity = 2,
    set = 'uma_ccs',
    pos = { x = 12, y = 1 },
    atlas = 'c_umas',
    soul_pos = { x = 13, y = 1 },

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    use = function(self, card, area, copier)
        local hand = G.hand.highlighted
        local value = (hand[1]:get_id())
        local values = {pseudorandom('pull', 1, value - 1)}
        values[#values + 1] = value - values[1]
        local ranks = {"Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"}
        local suit = hand[1].base.suit
        local enhancement, seal, edition = {nil, nil}, {nil, nil}, {nil, nil}
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



--Uma Creation
SMODS.Consumable { --Test Consumable
    key = 'ssr_ticket',
    cost = 15,
    set = 'uma_ccs',
    pos = { x = 13, y = 3 },
    atlas = 'c_umas',
    --soul_pos = { x = 13, y = 2 },

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    use = function(self, card, area, copier)

        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            func = function()
                G.SETTINGS.paused = true
                G.FUNCS.overlay_menu{
                    config = {no_esc = true},
                    definition = SMODS.uma_card_collection_UIBox(
                        G.P_CENTER_POOLS.uma_jokers,
                        {5, 5, 5},
                        {
                            no_materialize = true, 
                            modify_card = function(card, center)
                                Uma_create_select_card_ui(card, G.jokers)
                            end,
                            h_mod = 1.05,
                        }
                    ),
                }
                return true
            end
        }))

    end,

    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,

    in_pool = function(self, args)
        return false
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge("Carrot", SMODS.Gradients.uma_rainbow, G.C.UMA.WHITE, 1.2)
    end
}