SMODS.ConsumableType {
    key = 'uma_better_Tarot',
    default = 'c_uma_better_strength',
    primary_colour = G.C.UMA.BETTER_TAROT,
    secondary_colour = G.C.UMA.BETTER_TAROT2,
    collection_rows = { 4, 5 },
}

SMODS.ConsumableType {
    key = 'uma_worse_Tarot',
    default = 'c_uma_worse_strength',
    primary_colour = G.C.UMA.WORSE_TAROT,
    secondary_colour = G.C.UMA.WORSE_TAROT2,
    collection_rows = { 4, 5 },
}



--BETTER TAROTS
--Check compatibility with Fortune Teller
SMODS.Consumable { --The Fool
    key = 'better_fool',
    set = 'uma_better_Tarot',
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
    end
}

SMODS.Consumable { --The Magician
    key = 'better_magician',
    set = 'uma_better_Tarot',
    pos = { x = 1, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 4, mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

SMODS.Consumable { --The High Priestess
    key = 'better_high_priestess',
    set = 'uma_better_Tarot',
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
                        SMODS.add_card({ set = 'uma_Planet' })
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
    end
}

SMODS.Consumable { --The Empress
    key = 'better_empress',
    set = 'uma_better_Tarot',
    pos = { x = 3, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 4, mod_conv = 'm_mult' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --The Emperor
    key = 'better_emperor',
    set = 'uma_better_Tarot',
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
    end
}

SMODS.Consumable { --The Hierophant
    key = 'better_heirophant',
    set = 'uma_better_Tarot',
    pos = { x = 5, y = 0 },
    atlas = 'c_umas',
    config = { max_highlighted = 4, mod_conv = 'm_bonus' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --The Lovers
    key = 'better_lovers',
    set = 'uma_better_Tarot',
    pos = { x = 0, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_wild' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --The Chariot
    key = 'better_chariot',
    set = 'uma_better_Tarot',
    pos = { x = 1, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --Justice
    key = 'better_justice',
    set = 'uma_better_Tarot',
    pos = { x = 2, y = 1 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --The Hermit
    key = 'better_hermit',
    set = 'uma_better_Tarot',
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
    end
}

SMODS.Consumable { --The Wheel of Fortune
    key = 'better_wheel_of_fortune',
    set = 'uma_better_Tarot',
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
    end
}

SMODS.Consumable { --Strength
    key = 'better_strength',
    set = 'uma_better_Tarot',
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
}

SMODS.Consumable { --The Hanged Man crashes the game
    key = 'better_hanged_man',
    set = 'uma_better_Tarot',
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
}

SMODS.Consumable { --Death
    key = 'better_death',
    set = 'uma_better_Tarot',
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
}

SMODS.Consumable { --The Devil
    key = 'better_devil',
    set = 'uma_better_Tarot',
    pos = { x = 3, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_gold' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --The Tower
    key = 'better_tower',
    set = 'uma_better_Tarot',
    pos = { x = 4, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 2, mod_conv = 'm_stone' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable { --Judgement
    key = 'better_judgement',
    set = 'uma_better_Tarot',
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
    end
}



--WORSE TAROTS

SMODS.Consumable { --The Magician
    key = 'worse_magician',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Empress
    key = 'worse_empress',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Emperor
    key = 'worse_emperor',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Hierophant
    key = 'worse_heirophant',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Lovers
    key = 'worse_lovers',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Chariot
    key = 'worse_chariot',
    set = 'uma_worse_Tarot',
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
    end
}
--Update justice description
SMODS.Consumable { --Justice
    key = 'worse_justice',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Hermit
    key = 'worse_hermit',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Wheel of Fortune
    key = 'worse_wheel_of_fortune',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --Strength
    key = 'worse_strength',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Hanged Man
    key = 'worse_hanged_man',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --Temperance
    key = 'worse_temperance',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Devil
    key = 'worse_devil',
    set = 'uma_worse_Tarot',
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
    end
}
 
SMODS.Consumable { --The Tower
    key = 'worse_tower',
    set = 'uma_worse_Tarot',
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
    end
}

SMODS.Consumable { --The Star
    key = 'worse_star',
    set = 'uma_worse_Tarot',
    pos = { x = 11, y = 2 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Diamonds' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
        calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end
}

SMODS.Consumable { --The Moon
    key = 'worse_moon',
    set = 'uma_worse_Tarot',
    pos = { x = 6, y = 3 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Clubs' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
        calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end
}

SMODS.Consumable { --The Sun
    key = 'worse_sun',
    set = 'uma_worse_Tarot',
    pos = { x = 7, y = 3 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Hearts' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
        calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end
}

SMODS.Consumable { --The World
    key = 'worse_world',
    set = 'uma_worse_Tarot',
    pos = { x = 9, y = 3 },
    atlas = 'c_umas',
    config = { max_highlighted = 1, suit_conv = 'Spades' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    calculate = function(self, card, context)
        card.ability.extra_value = -11
        card:set_cost()
    end
}