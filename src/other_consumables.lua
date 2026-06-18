-- [whatever CSS stands for] Settings
CssAPI = {
    defaults = {
        mambo_rate = 4,
        family_tree_rate = 1.25,
        turf_pack_rate = {
            normal = 2,
            jumbo = 1,
            mega = 0.25}
    },
    gamerate = 1
}
-- [whatever CSS stands for] Settings





-- Consumable Type
SMODS.ConsumableType {
    key = 'uma_ccs',
    primary_colour = G.C.UMA.MAMBO,
    secondary_colour = G.C.UMA.MAMBO2,
    collection_rows = { 3, 4 },
    shop_rate = 0
}
-- Consumable Type





-- New Rarities
SMODS.Rarity {
    key = "mambo_rarity",
    default_weight = CssAPI.defaults.mambo_rate,
    disable_if_empty = true
}

SMODS.Rarity {
    key = "family_tree_rarity",
    default_weight = CssAPI.defaults.family_tree_rate,
    disable_if_empty = true
}
-- New Rarities





-- Mambo-related Conumables
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
-- Mambo-related Conumables





-- Family Tree Cards
SMODS.Consumable { --Posterity
    key = 'posterity',
    rarity = "uma_mambo_rarity",
    set = 'uma_ccs',
    pos = { x = 12, y = 0 },
    atlas = 'c_umas',
    soul_pos = { x = 13, y = 0 },

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    use = function(self, card, area, copier)
        local hand = G.hand.highlighted

        local value = (hand[1]:get_id() + hand[2]:get_id() - (13 * Uma_rank_tally(14, hand, nil)))
        local ranks = {"Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"}
        local suit, enhancement, seal, edition = {}, {}, {}, {}

        if hand[1].base.suit then suit[#suit + 1] = hand[1].base.suit end
        if hand[2].base.suit then suit[#suit + 1] = hand[2].base.suit end

        local new_card = {
            set = "Base",
            rank = ranks[value],
            suit = suit[pseudorandom('suit', 1, #suit)],
        }

        if hand[1].config.center.key ~= 'c_base' then enhancement[#enhancement + 1] = hand[1].config.center.key end
        if hand[2].config.center.key ~= 'c_base' then enhancement[#enhancement + 1] = hand[2].config.center.key end
        if #enhancement > 0 then new_card.enhancement = enhancement[pseudorandom('enhancement', 1, #enhancement)] end

        if hand[1].seal then seal[#seal + 1] = hand[1].seal end
        if hand[2].seal then seal[#seal + 1] = hand[2].seal end
        if #seal > 0 then new_card.seal = seal[pseudorandom('seal', 1, #seal)] end

        if hand[1].edition then edition[#edition + 1] = hand[1].edition.key end
        if hand[2].edition then edition[#edition + 1] = hand[2].edition.key end
        if #edition > 0 then new_card.edition = edition[pseudorandom('edition', 1, #edition)] end

        SMODS.add_card(new_card)

        SMODS.destroy_cards(G.hand.highlighted)
    end,

    can_use = function(self, card)
        if #G.hand.highlighted == 2 then
            local value = (G.hand.highlighted[1]:get_id() + G.hand.highlighted[2]:get_id() - (13 * Uma_rank_tally(14, G.hand.highlighted, nil)))
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
        local value = hand[1]:get_id()

        local new_card_1, new_card_2 =
            { set = "Base", suit = hand[1].base.suit},
            { set = "Base", suit = hand[1].base.suit}

        new_card_1.rank_num = pseudorandom('pull', 1, value - 1)
        new_card_2.rank_num = value - new_card_1.rank_num

        local ranks = {"Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"}

        new_card_1.rank = ranks[new_card_1.rank_num]
        new_card_2.rank = ranks[new_card_2.rank_num]

        if hand[1].config.center.key ~= "c_base" then ((pseudorandom('enhancement_choose', 1, 2) == 1) and new_card_1 or new_card_2).enhancement = hand[1].config.center.key end
        if hand[1].seal then ((pseudorandom('seal_choose', 1, 2) == 1) and new_card_1 or new_card_2).seal = hand[1].seal end
        if hand[1].edition then ((pseudorandom('edition_choose', 1, 2) == 1) and new_card_1 or new_card_2).edition = hand[1].edition.key end

        SMODS.add_card(new_card_1)
        SMODS.add_card(new_card_2)

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
-- Family Tree Cards





-- Other
SMODS.Consumable { --SSR Ticket
    key = 'ssr_ticket',
    cost = 0,
    set = 'uma_ccs',
    pos = { x = 13, y = 3 },
    atlas = 'c_umas',
    soul_pos = { x = 12, y = 4 },

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
        badges[#badges + 1] = create_badge("SSR Ticket", SMODS.Gradients.uma_rainbow, G.C.UMA.WHITE, 1.2)
    end
}
-- Other