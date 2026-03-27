SMODS.ConsumableType {
    key = 'fuku_cards',
    primary_colour = G.C.UMA.BETTER_TAROT,
    secondary_colour = G.C.UMA.BETTER_TAROT2,
    collection_rows = { 5, 6, 5 },
}



--BETTER TAROTS
--Check compatibility with Fortune Teller
SMODS.Consumable { --The Fool
    key = 'better_fool',
    set = 'fuku_cards',
    pos = { x = 0, y = 0 },
    atlas = 'c_umas',

    loc_vars = function(self, info_queue, card)
        local uma_tarots, uma_planets = G.GAME.uma_tarot_card, G.GAME.uma_planet_card
        local uma_tarots_named = uma_tarots and localize({type = 'name_text', key = uma_tarots, set = G.P_CENTERS[uma_tarots].set}) or localize('k_none')
        local uma_planets_named = uma_planets and localize({type = 'name_text', key = uma_planets, set = G.P_CENTERS[uma_planets].set}) or localize('k_none')
        local colour_tarots, colour_planets = uma_tarots and G.C.GREEN or G.C.RED, uma_planets and G.C.GREEN or G.C.RED
        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "m", colour = colour_tarots, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. uma_tarots_named .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "m", colour = colour_planets, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. uma_planets_named .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }
        return { main_end = main_end }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    if G.GAME.uma_tarot_card then SMODS.add_card({ key = G.GAME.uma_tarot_card }) end
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    if G.GAME.uma_planet_card then SMODS.add_card({ key = G.GAME.uma_planet_card }) end
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and
            (G.GAME.uma_planet_card or G.GAME.uma_tarot_card)
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Magician
    key = 'better_magician',
    set = 'fuku_cards',
    pos = { x = 1, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 4, mod_conv = 'm_lucky' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The High Priestess
    key = 'better_high_priestess',
    set = 'fuku_cards',
    pos = { x = 2, y = 0 },
    atlas = 'c_umas',
    config = { extra = { planets = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.planets } }
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.planets, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                            SMODS.add_card {
                                set = 'uma_planet_plus',
                                area = G.consumeables
                            }
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,

    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Empress
    key = 'better_empress',
    set = 'fuku_cards',
    pos = { x = 3, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 4, mod_conv = 'm_mult' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Emperor
    key = 'better_emperor',
    set = 'fuku_cards',
    pos = { x = 4, y = 0 },
    atlas = 'c_umas',
    config = { extra = { tarots = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tarots } }
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.tarots, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Spectral' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,

    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Hierophant
    key = 'better_heirophant',
    set = 'fuku_cards',
    pos = { x = 5, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 4, mod_conv = 'm_bonus' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Lovers
    key = 'better_lovers',
    set = 'fuku_cards',
    pos = { x = 0, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_wild' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Chariot
    key = 'better_chariot',
    set = 'fuku_cards',
    pos = { x = 1, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_steel' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Justice
    key = 'better_justice',
    set = 'fuku_cards',
    pos = { x = 2, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_glass' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Hermit
    key = 'better_hermit',
    set = 'fuku_cards',
    pos = { x = 3, y = 1 },
    atlas = 'c_umas',
    config = { extra = { max = 40 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return true
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Wheel of Fortune
    key = 'better_wheel_of_fortune',
    set = 'fuku_cards',
    pos = { x = 4, y = 1 },
    atlas = 'c_umas',
    config = { extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'uma_wheel_of_fortune')
        return { vars = { numerator, denominator } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_wheel_of_fortune', 1, card.ability.extra.odds) then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

            local eligible_card = pseudorandom_element(editionless_jokers, 'uma_wheel_of_fortune')
            local edition = SMODS.poll_edition { key = "uma_wheel_of_fortune", guaranteed = true, no_negative = true, options = { 'e_polychrome', 'e_holo'} }
---@diagnostic disable-next-line: need-check-nil
            eligible_card:set_edition(edition, true)
            check_for_unlock({ type = 'have_edition' })
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Strength
    key = 'better_strength',
    set = 'fuku_cards',
    pos = { x = 5, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 4 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    -- SMODS.modify_rank will increment/decrement a given card's rank by a given amount
                    assert(SMODS.modify_rank(G.hand.highlighted[i], 1))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Hanged Man
    key = 'better_hanged_man',
    set = 'fuku_cards',
    pos = { x = 0, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 4 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Death
    key = 'better_death',
    set = 'fuku_cards',
    pos = { x = 1, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 3, min_highlighted = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        local rightmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x > rightmost.T.x then
                rightmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.hand.highlighted[i] ~= rightmost then
                        copy_card(rightmost, G.hand.highlighted[i])
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Devil
    key = 'better_devil',
    set = 'fuku_cards',
    pos = { x = 3, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_gold' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Tower
    key = 'better_tower',
    set = 'fuku_cards',
    pos = { x = 4, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_stone' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Judgement
    key = 'better_judgement',
    set = 'fuku_cards',
    pos = { x = 2, y = 3 },
    atlas = 'c_umas',

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_plus'), G.C.UMA.BETTER_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}



--WORSE TAROTS

SMODS.Consumable { --The Magician
    key = 'worse_magician',
    set = 'fuku_cards',
    pos = { x = 7, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_lucky' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

        calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Empress
    key = 'worse_empress',
    set = 'fuku_cards',
    pos = { x = 9, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_mult' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

        calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Emperor
    key = 'worse_emperor',
    set = 'fuku_cards',
    pos = { x = 10, y = 0 },
    atlas = 'c_umas',
    config = { extra = { tarots = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tarots } }
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.tarots, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'uma_worse_Tarot' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,

    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Hierophant
    key = 'worse_heirophant',
    set = 'fuku_cards',
    pos = { x = 11, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_bonus' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Lovers
    key = 'worse_lovers',
    set = 'fuku_cards',
    pos = { x = 6, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_wild', extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_worse_lovers')
        return { vars = { 
            card.ability.max_highlighted,
            numerator,
            denominator,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
        } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_worse_lovers', 1, card.ability.extra.odds) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)      
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Chariot
    key = 'worse_chariot',
    set = 'fuku_cards',
    pos = { x = 7, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_steel', extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_worse_chariot')
        return { vars = { 
            card.ability.max_highlighted,
            numerator,
            denominator,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
        } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_worse_chariot', 1, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Justice
    key = 'worse_justice',
    set = 'fuku_cards',
    pos = { x = 8, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_glass', extra = {odds = 2} },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_worse_justice')
        return { vars = { 
            card.ability.max_highlighted,
            numerator,
            denominator,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
        } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_worse_justice', 1, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    SMODS.destroy_cards(G.hand.highlighted)
                    play_sound('glass'..math.random(1, 6), math.random()*0.2 + 0.9,0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Hermit
    key = 'worse_hermit',
    set = 'fuku_cards',
    pos = { x = 9, y = 1 },
    atlas = 'c_umas',
    config = { extra = { max = 10} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return true
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Wheel of Fortune
    key = 'worse_wheel_of_fortune',
    set = 'fuku_cards',
    pos = { x = 10, y = 1 },
    atlas = 'c_umas',
    config = { extra = { odds = 4 } },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'uma_wheel_of_fortune')
        return { vars = { numerator, denominator } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_wheel_of_fortune', 1, card.ability.extra.odds) then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
            local eligible_card = pseudorandom_element(editionless_jokers, 'uma_wheel_of_fortune')
            local edition = SMODS.poll_edition { key = "uma_wheel_of_fortune", guaranteed = true, no_negative = true, options = { 'e_foil'} }
---@diagnostic disable-next-line: need-check-nil
            eligible_card:set_edition(edition, true)
            check_for_unlock({ type = 'have_edition' })
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Strength
    key = 'worse_strength',
    set = 'fuku_cards',
    pos = { x = 11, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 1},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    -- SMODS.modify_rank will increment/decrement a given card's rank by a given amount
                    assert(SMODS.modify_rank(G.hand.highlighted[i], 1))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Hanged Man
    key = 'worse_hanged_man',
    set = 'fuku_cards',
    pos = { x = 6, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 1},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --Temperance
    key = 'worse_temperance',
    set = 'fuku_cards',
    pos = { x = 8, y = 2 },
    atlas = 'c_umas',
    config = { extra = { max = 10,money = 0 } },

    loc_vars = function(self, info_queue, card)
        local money = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
                    money = money + G.jokers.cards[i].sell_cost
                end
            end
        end
        card.ability.extra.money = math.min(money, card.ability.extra.max)

        return { vars = { card.ability.extra.max, card.ability.extra.money } }
    end,

    use = function(self, card, area, copier)
        local money = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.set == 'Joker' then
                money = money + G.jokers.cards[i].sell_cost
            end
        end
        card.ability.extra.money = math.min(money, card.ability.extra.max)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.money, true)
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return true
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Devil
    key = 'worse_devil',
    set = 'fuku_cards',
    pos = { x = 9, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 1,mod_conv = 'm_gold', extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_worse_devil')
        return { vars = { 
            card.ability.max_highlighted,
            numerator,
            denominator,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
        } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_worse_devil', 1, card.ability.extra.odds) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)      
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Tower
    key = 'worse_tower',
    set = 'fuku_cards',
    pos = { x = 10, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, mod_conv = 'm_stone', extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_worse_tower')
        return { vars = { 
            card.ability.max_highlighted,
            numerator,
            denominator,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
        } }
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'uma_worse_tower', 1, card.ability.extra.odds) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)   
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Star
    key = 'worse_star',
    set = 'fuku_cards',
    pos = { x = 11, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Diamonds' },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Moon
    key = 'worse_moon',
    set = 'fuku_cards',
    pos = { x = 6, y = 3 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Clubs' },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The Sun
    key = 'worse_sun',
    set = 'fuku_cards',
    pos = { x = 7, y = 3 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Hearts' },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable { --The World
    key = 'worse_world',
    set = 'fuku_cards',
    pos = { x = 9, y = 3 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Spades' },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,

    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_tarot_minus'), G.C.UMA.WORSE_TAROT2, G.C.UMA.WHITE, 1.2)
    end
}



--Better Planet Cards

SMODS.Consumable {--Better Mercury
    key = "better_mercury",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Venus
    key = "better_venus",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Earth
    key = "better_earth",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Mars
    key = "better_mars",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Jupiter
    key = "better_jupiter",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Saturn
    key = "better_saturn",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Uranus
    key = "better_uranus",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Neptune
    key = "better_neptune",
    set = 'fuku_cards',
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
    end,

    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('uma_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end
}

SMODS.Consumable {--Better Pluto
    key = "better_pluto",
    set = 'fuku_cards',
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
        badges[#badges + 1] = create_badge(localize('uma_dwarf_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end,

    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end
}

SMODS.Consumable {--Better Planet X
    key = "better_planet_x",
    set = 'fuku_cards',
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
        
        badges[#badges + 1] = create_badge(localize('uma_X_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
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
    set = 'fuku_cards',
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
        badges[#badges + 1] = create_badge(localize('uma_dwarf_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
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
    set = 'fuku_cards',
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
        badges[#badges + 1] = create_badge(localize('uma_dwarf_planet_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
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
    set = 'fuku_cards',
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
        badges[#badges + 1] = create_badge(localize('uma_twin_moon_plus'), G.C.UMA.BETTER_PLANET2, G.C.UMA.WHITE, 1.2)
    end,

    use = function(self, card, area, copier)
        SMODS.upgrade_poker_hands({hands = card.ability.hand_type, level_up = 3})
    end,

    in_pool = function(self, args)
        return G.GAME.hands[self.config.hand_type].played > 0
    end
}

uma_tarot_plus_directory = {
    "c_uma_better_fool",
    "c_uma_better_magician",
    "c_uma_better_high_priestess",
    "c_uma_better_empress",
    "c_uma_better_emperor",
    "c_uma_better_heirophant",
    "c_uma_better_lovers",
    "c_uma_better_chariot",
    "c_uma_better_justice",
    "c_uma_better_hermit",
    "c_uma_better_wheel_of_fortune",
    "c_uma_better_strength",
    "c_uma_better_hanged_man",
    "c_uma_better_death",
    "c_uma_better_devil",
    "c_uma_better_tower",
    "c_uma_better_judgement"
}

uma_tarot_minus_directory = {
    "c_uma_worse_magician",
    "c_uma_worse_empress",
    "c_uma_worse_emperor",
    "c_uma_worse_heirophant",
    "c_uma_worse_lovers",
    "c_uma_worse_chariot",
    "c_uma_worse_justice",
    "c_uma_worse_hermit",
    "c_uma_worse_wheel_of_fortune",
    "c_uma_worse_strength",
    "c_uma_worse_hanged_man",
    "c_uma_worse_temperance",
    "c_uma_worse_devil",
    "c_uma_worse_tower",
    "c_uma_worse_star",
    "c_uma_worse_moon",
    "c_uma_worse_sun",
    "c_uma_worse_world"
}

uma_planet_plus_directory = {
    "c_uma_better_mercury",
    "c_uma_better_venus",
    "c_uma_better_earth",
    "c_uma_better_mars",
    "c_uma_better_jupiter",
    "c_uma_better_saturn",
    "c_uma_better_uranus",
    "c_uma_better_neptune",
    "c_uma_better_pluto",
    "c_uma_better_planet_x",
    "c_uma_better_ceres",
    "c_uma_better_eris",
    "c_uma_better_twin_moons"
}

SMODS.Joker:take_ownership("j_satellite", {
    loc_vars = function(self, info_queue, card)
        local planets_used = 0
        local planet_bool
        for k, v in pairs(G.GAME.consumeable_usage) do
            planet_bool = Uma_check_table_for_string(k, uma_planet_plus_directory)
            if (v.set == 'Planet' or planet_bool) then
                planets_used = planets_used + 1
            end
        end
        return { vars = { card.ability.extra, planets_used * card.ability.extra } }
    end,
    calc_dollar_bonus = function(self, card)
        local planets_used = 0
        local planet_bool
        for k, v in pairs(G.GAME.consumeable_usage) do
            planet_bool = Uma_check_table_for_string(k, uma_planet_plus_directory)
            if (v.set == 'Planet' or planet_bool) then
                planets_used = planets_used + 1
            end
        end
        return planets_used > 0 and planets_used * card.ability.extra or nil
    end
}, true)

SMODS.Joker:take_ownership("j_constellation", {
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
        local item = context.consumeable
        local planet_bool = Uma_check_table_for_string(item.ability.name, uma_planet_plus_directory)
            if (context.consumeable.ability.set == 'Planet' or planet_bool) then
                card.ability.x_mult = card.ability.x_mult + card.ability.extra
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.x_mult } }
                }
            end
        end
        if context.joker_main then
            return {
                Xmult = card.ability.x_mult
            }
        end
    end
}, true)