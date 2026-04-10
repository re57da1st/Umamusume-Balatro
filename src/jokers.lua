--Joker definitions
SMODS.Joker{ --Daitaku Helios
    key = "helios",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 0, y = 0 },
    config = { extra = { Xmult = 1.5, race = {
        r1 = 10,
        r2 = 6,
        r3 = 1,
        rt = 35
    } } },
    atlas = 'j_umas',
    soul_pos = { x = 0, y = 1 },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            card.ability.extra.Xmult --Xmult, the value that Mult gets multiplied as when triggered
        } }
    end,

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and (context.other_card:is_suit("Clubs") or context.other_card:is_suit("Diamonds")) then
            --Checks for cards in play that are Clubs or Diamonds
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end

}

SMODS.Joker{ --Daiwa Scarlet
    key = "daiwa",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 1, y = 0 },
    config = { extra = { q_mult = 8, total_mult = 0, race = {
        r1 = 8,
        r2 = 4,
        r3 = 0,
        rt = 12
    } } },
    atlas = 'j_umas',
    soul_pos = { x = 1, y = 1 },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        card.ability.extra.total_mult = Uma_rank_tally(12, nil, card.ability.extra.q_mult)
        return { vars = {
            card.ability.extra.q_mult,  --Queen Mult, the amount of mult Daiwa gains per queen in the deck
            card.ability.extra.total_mult  --The total amount of mult Daiwa gains
        } }
    end,

    calculate = function(self, card, context)
        if context.modify_hand then --Context that happens after setting the poker hand type, and before scoring cards
            return {
                mult = Uma_rank_tally(12, nil, card.ability.extra.q_mult)
            }
        end
    end
}

SMODS.Joker{ --Agnes Digital
    key = "agnes",
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 2, y = 0 },
    config = { extra = { race = {
        r1 = 12,
        r2 = 5,
        r3 = 4,
        rt = 32
    } } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return nil
    end,

    calculate = function(self, card, context)
        if context.press_play and not context.blueprint then
            local queens = 0
            for _, card in ipairs(next(find_joker('Splash')) and G.hand.highlighted or select(4,G.FUNCS.get_poker_hand_info(G.hand.highlighted))) do
                if (card:get_id() == 11 or card:get_id() == 13) and not card.debuff then
                    queens = queens + 1
                    assert(SMODS.change_base(card, nil, "Queen"))
                    card.ability.played_this_ante = card.ability.uma_old_played_this_ante
                    SMODS.recalc_debuff(card)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if queens > 0 then
                return {
                    message = localize('uma_yuri'),
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker{ --Twin Turbo
    key = "turbo",
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 0 },
    atlas = 'j_umas',
    config = { extra = { mult_gain = 5, mult = 0, race = {
        r1 = 6,
        r2 = 2,
        r3 = 0,
        rt = 33
    } }, hand_type = 'uma_perfect_pair' },
    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = { card.ability.extra.mult_gain, localize('uma_perfect_pair', 'poker_hands'), card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and (next(context.poker_hands['uma_perfect_pair']) or next(context.poker_hands['Flush House'])) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                level_up = true,
                message = localize('uma_twin_turbo_trigger'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        if G.GAME.hands[self.config.hand_type].played > 0 then
            return true
        else
            return false
        end
    end
}

SMODS.Joker{ --Gold ship
    key = "goldship",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 4, y = 0 },
    atlas = 'j_umas',
    config = { extra = { max = 100, min = 0, top = 8, bottom = 1, randomBlind = 0,
        effects = {
            "uma_goldship_no_effect",
            "uma_goldship_effect1",
            "uma_goldship_effect2",
            "uma_goldship_effect3",
            "uma_goldship_effect4",
            "uma_goldship_effect5",
            "uma_goldship_effect6",
            "uma_goldship_effect7",
            "uma_goldship_effect8",
        },
        effects_jd = {
            "uma_goldship_no_effect_jd",
            "uma_goldship_effect1_jd",
            "uma_goldship_effect2_jd",
            "uma_goldship_effect3_jd",
            "uma_goldship_effect4_jd",
            "uma_goldship_effect5_jd",
            "uma_goldship_effect6_jd",
            "uma_goldship_effect7_jd",
            "uma_goldship_effect8_jd",
        },
        blinds = {
            "bl_final_acorn",
            "bl_plant",
            "bl_tooth",
            "bl_mark",
            "bl_goad",
            "bl_head",
            "bl_club",
            "bl_window"
        },
        race = {
            r1 = 13,
            r2 = 3,
            r3 = 2,
            rt = 28
        }
    } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            card.ability.extra.min,
            card.ability.extra.max,
            localize(card.ability.extra.effects[card.ability.extra.randomBlind + 1])
        } }
    end,

    calculate = function(self, card, context)

        if context.setting_blind then --Choose random effect at blind start

            local index = nil
            for i = 1, #card.ability.extra.blinds do
                if G.GAME.blind.config.blind.key == card.ability.extra.blinds[i] then
                    index = i
                end
                if not index then
                    card.ability.extra.randomBlind = pseudorandom('goldship', card.ability.extra.bottom, card.ability.extra.top)
                else
                    card.ability.extra.randomBlind = pseudorandom('goldship', card.ability.extra.bottom, card.ability.extra.top - 1)
                    if card.ability.extra.randomBlind >= index then
                        card.ability.extra.randomBlind = card.ability.extra.randomBlind + 1
                    end
                end
            end

            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    SMODS.recalc_debuff(playing_card)
                end
            end

            return {
                message = localize(card.ability.extra.effects[card.ability.extra.randomBlind + 1]),
                colour = G.C.GOLD,
                message_card = card,
                delay = 3
            }
        end

        --Effect 1, Flips and shuffles jokers
        if card.ability.extra.randomBlind == 1 and not context.blueprint then
            if context.before or context.final_scoring_step or context.setting_blind or context.drawing_cards then
                if #G.jokers.cards > 0 then
                    G.jokers:unhighlight_all()
                    for _, joker in ipairs(G.jokers.cards) do
                        joker:flip()
                        if G.jokers.cards[_].facing == 'back' then
                            stay_flipped = true
                        else
                            joker:flip()
                        end
                    end
                end
                    if #G.jokers.cards > 1 then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.2,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
            end

        end

        --Effect 2: Debuff face cards
        if card.ability.extra.randomBlind == 2 and not context.blueprint then

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if context.debuff_card:is_face(true) then
                    return { debuff = true }
                end
            end

        end

        --Effect 3: $-1 per card played
        if card.ability.extra.randomBlind == 3 and not context.blueprint then

            if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.play.cards do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.play.cards[i]:juice_up()
                                    return true
                                end,
                            }))
                            ease_dollars(-1)
                            delay(0.23)
                        end
                        return true
                    end
                }))
            end

        end

        --Effect 4: Flip face cards
        if card.ability.extra.randomBlind == 4 and not context.blueprint then

            if context.stay_flipped and context.to_area == G.hand and
                context.other_card:is_face(true) then
                return {
                    stay_flipped = true
                }
            end

        end

        --Effect 5: Debuff Spades
        if card.ability.extra.randomBlind == 5 and not context.blueprint then

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if context.debuff_card:is_suit('Spades', true) then
                    return { debuff = true }
                end
            end

        end

        --Effect 6: Debuff Hearts
        if card.ability.extra.randomBlind == 6 and not context.blueprint then

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if context.debuff_card:is_suit('Hearts', true) then
                    return { debuff = true }
                end
            end

        end

        --Effect 7: Debuff Clubs
        if card.ability.extra.randomBlind == 7 and not context.blueprint then

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if context.debuff_card:is_suit('Clubs', true) then
                    return { debuff = true }
                end
            end
        end

        --Effect 8: Debuff Diamonds
        if card.ability.extra.randomBlind == 8 and not context.blueprint then

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if context.debuff_card:is_suit('Diamonds', true) then
                    return { debuff = true }
                end
            end
        end

        --Disable random effects at blind end
        if context.end_of_round then
            card.ability.extra.randomBlind = 0
        end

        --Return mult value
        if context.joker_main then
            return {
                mult = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
            }
        end

        --print(card.ability.extra.randomBlind)
        --print('yay!!!!')
    end,

    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+", colour = G.C.MULT },
                {
                    dynatext = {
                        string = (
                            function()
                                local r_mult = {}
                                for i = G.P_CENTERS.j_uma_goldship.config.extra.min, G.P_CENTERS.j_uma_goldship.config.extra.max do
                                    r_mult[#r_mult + 1] = tostring(i)
                                end
                                return r_mult
                            end
                        )(),
                        colours = { G.C.MULT },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.5,
                        scale = 0.4,
                        min_cycle_time = 0
                    }
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.FILTER, 0.35) },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.localized_text = localize(card.ability.extra.effects_jd[card.ability.extra.randomBlind + 1])
            end
        }
    end
}

SMODS.Joker{ --Oguri Cap
    key = "oguri",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 5, y = 0 },
    config = { extra = { chips = 0, chip_mod = 20, state = 0, race = {
        r1 = 22,
        r2 = 6,
        r3 = 1,
        rt = 32
    } } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            card.ability.extra.chips, --The total amount of chips Oguri stores on the card
            card.ability.extra.chip_mod --The amount of chips Oguri gains per card "eaten"
        } }
    end,

    calculate = function(self, card, context)

        card.children.center:set_sprite_pos({ x = 5, y = card.ability.extra.state })

        if context.end_of_round and not context.blueprint then
            local food_rank, food_ID = 15, 15
            local food = nil
            for i = 1, #G.hand.cards do
                if food_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) and not G.hand.cards[i].debuff then
                    food_rank = G.hand.cards[i].base.nominal
                    food_ID = G.hand.cards[i].base.id
                    food = G.hand.cards[i]
                end
            end
            if food and food == context.other_card then
                SMODS.destroy_cards(food)
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                card.ability.extra.state = 1
                return {
                    message = localize('uma_oguri'),
                    colour = G.C.CHIPS,
                    message_card = card
                }
            end
        end

        if context.setting_blind and not context.blueprint then
            card.ability.extra.state = 0
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker{ --Sakura Bakushin O
    key = "bakushin",
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 6, y = 0 },
    config = { extra = { mult = 0, mult_pot = 0, mult_add = 10, mult_mod = 1, active = false, sign = "+", interval = 3, race = {
        r1 = 11,
        r2 = 2,
        r3 = 1,
        rt = 21
    } } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            card.ability.extra.mult, --The Mult value the card has
            card.ability.extra.mult_pot, --Mult potential, the value that changes with respect to time
            card.ability.extra.mult_add, --Mult Addition, the value of Potential Mult that gets added at blind start
            card.ability.extra.mult_mod, --Mult Mod, the amount of Potential Mult that goes down per interval
            card.ability.extra.active, --Active, Boolean state that decides if the timer continues to run
            card.ability.extra.sign, --Sign, the state of "+" or "-" that shows attached to the Potential Mult value
            card.ability.extra.interval --Interval, How many seconds go by before Potential Mult drops
        } }
    end,

    calculate = function(self, card, context)
        local event
        event = Event { --Timer function
            blockable = false,
            blocking = false,
            pause_force = true,
            no_delete = true,
            trigger = "after",
            delay = card.ability.extra.interval,
            timer = "UPTIME",
            func = function()
                if card.ability.extra.mult_pot < 0 then
                    card.ability.extra.sign = ""
                else
                    card.ability.extra.sign = "+"
                end
                if not card.ability.extra.active then return true end
                if not G.SETTINGS.paused then
                    card.ability.extra.mult_pot = card.ability.extra.mult_pot - card.ability.extra.mult_mod
                end
                event.start_timer = false
            end
        }

        if context.starting_shop and not context.blueprint then --Makes sure to stop timer in case card was debuffed at end of blind
            card.ability.extra.active = false
            card.ability.extra.mult_pot = 0
        end

        if context.end_of_round and not context.blueprint then --End of round
            if card.ability.extra.active then
                card.ability.extra.active = false
                card.ability.extra.mult = math.max(0, card.ability.extra.mult + card.ability.extra.mult_pot)
                local message
                if  card.ability.extra.mult_pot > 0 then
                    message =  localize('uma_bakushin2')
                elseif  card.ability.extra.mult_pot < 0 then
                    message =  localize('uma_bakushin3')
                    card.children.center:set_sprite_pos({ x = 7, y = 0 })
                else
                    return nil
                end
                local pot = card.ability.extra.mult_pot
                card.ability.extra.mult_pot = 0
                return {
                    message = message.." "..card.ability.extra.sign..pot,
                    colour = G.C.MULT,
                    message_card = card
                }
            end
        end

        if (context.setting_blind and not context.blueprint and not card.ability.extra.active) or --Start of Blind
        (G.GAME.blind and G.GAME.blind.in_blind and not card.ability.extra.active) then --Middle of blind without a timer running

            card.ability.extra.active = true
            if card.ability.extra.resume then
                card.ability.extra.resume = nil
            else
                card.ability.extra.mult_pot = card.ability.extra.mult_add
            end

            G.E_MANAGER:add_event(event)
            card.children.center:set_sprite_pos({ x = 6, y = 0 })
            return {
                message = localize('uma_bakushin1'),
                colour = G.C.ATTENTION,
                message_card = card
            }
        end

        if context.joker_main then --Adding current mult to hand
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker{ --Matikanetannhauser
    key = "mambo",
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 2, y = 1 },
    config = { extra = { chips = 10, chips_mod = 10, mult = 4, mult_mod = 4, xmult = 1.0, xmult_mod = 0.1, race = {
        r1 = 8,
        r2 = 2,
        r3 = 2,
        rt = 32
    } } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
           card.ability.extra.chips, --Starting Chips value
           card.ability.extra.mult,  --Starting Mult  value
           card.ability.extra.xmult, --Starting xMult value
           card.ability.extra.chips_mod, --Chips increase value
           card.ability.extra.mult_mod,  --Mult  increase value
           card.ability.extra.xmult_mod  --xMult increase value
        } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.mambo_subset = true
        Uma_CSS_check()
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.mambo_subset = (#SMODS.find_card("j_uma_mambo") > 0) and true or false
        Uma_CSS_check()
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.key == 'c_uma_mambo_boots' and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
            return {
                message = localize('uma_mambo_chips'),
                colour = G.C.CHIPS,
                message_card = card
            }
        elseif context.using_consumeable and context.consumeable.config.center.key == 'c_uma_mambo_hat' and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('uma_mambo_mult'),
                colour = G.C.MULT,
                message_card = card
            }
        elseif context.using_consumeable and context.consumeable.config.center.key == 'c_uma_mambo_plushie' and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            return {
                message = localize('uma_mambo_xmult'),
                colour = G.C.MULT,
                message_card = card
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult
            }
        end
    end
}

SMODS.Joker{ --Sakura Chiyono O
    key = "chiyono",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 1 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 5,
        r2 = 1,
        r3 = 1,
        rt = 10
    } } },

    loc_vars = function(self, info_queue, card)

        info_queue[#info_queue+1] = G.P_CENTERS.m_uma_turf
        info_queue[#info_queue+1] = G.P_CENTERS.m_uma_blossom
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end

    end,

    calculate = function(self, card, context)

        if context.after then
            local turf_count = 0
            local chiyono = #find_joker('j_uma_chiyono')
            if chiyono > 0 then
                for iteration = 1, chiyono do
                    turf_count = 0
                    for _, v in ipairs(context.scoring_hand) do
                        if SMODS.has_enhancement(v, "m_uma_turf") then
                            turf_count = turf_count + 1
                        end
                    end

                    

                    if turf_count > 0 then
                        local target = pseudorandom('turf',1,turf_count)
                        for _, v in ipairs(context.scoring_hand) do
                            if SMODS.has_enhancement(v, "m_uma_turf") then
                                target = target - 1
                                if target == 0 then
                                    v:set_ability('m_uma_blossom', nil, true)
                                    G.GAME.uma_global_counts.bloom = G.GAME.uma_global_counts.bloom + 1
                                    --print(G.GAME.uma_global_counts)
                                    return {
                                        message = localize('uma_bloom'),
                                        colour = G.C.UMA.BLOSSOM,
                                        message_card = v,
                                        delay = 1
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_uma_turf') or SMODS.has_enhancement(playing_card, 'm_uma_blossom') then
                return true
            end
        end
        return false
    end
}

SMODS.Joker{ --Norn Ace
    key = "norn",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 4, y = 1 },
    config = { extra = { dollars = 3, uma_count = 0 } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats_no_record",
                vars = { }
            }
        end
        return { vars = {
            card.ability.extra.dollars,
            card.ability.extra.dollars * card.ability.extra.uma_count
        } }
    end,

    calculate = function(self, card, context)
        local count = 0
        for _, v in ipairs(G.jokers.cards) do
            if v.config.center.pools and v.config.center.pools['uma_jokers'] then
                count = count + 1
            end
        end
        card.ability.extra.uma_count = count
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars * card.ability.extra.uma_count
    end
}

SMODS.Joker{ --Obey Your Master
    key = "obey",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 6, y = 1 },
    config = { extra = { mult = 2, race = {
        r1 = 5,
        r2 = 5,
        r3 = 5,
        rt = 40,
        name = "Pay the Butler"
    } } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats_renamed",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt,
                    card.ability.extra.race.name
                } }
        end
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end
}

SMODS.Joker{ --Matikanefukukitaru
    key = "fuku",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 8, y = 0 },
    config = { extra = { scaling = 1.5, race = {
        r1 = 6,
        r2 = 4,
        r3 = 1,
        rt = 22
    } } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            card.ability.extra.scaling
        } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.chips >= G.GAME.blind.chips * card.ability.extra.scaling and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'uma_tarot_plus',
                                area = G.consumeables
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        elseif context.end_of_round and context.main_eval and G.GAME.chips < G.GAME.blind.chips * card.ability.extra.scaling and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'uma_tarot_minus',
                                area = G.consumeables
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end
}

SMODS.Joker{ --Still in Love
    key = "love",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 9, y = 0 },
    config = { extra = {
        repetitions = 1,
        desc_1_1 = "R%%r%%ge%s a%l",
        desc_1_2 = "%%%u%%s %l% %th%% %a%d%",
        desc_1_3 = "%%%r%%%te% %er%a%n bo%s bl%n%%",
        desc_2_1 = "A pl%%i%g c%r%",
        desc_2_2 = "th%% %s",
        desc_2_3 = "%n%%",
        desc_2_4 = "%e%%%s",
        desc_2_5 = "a%% n%%%i%% %ls%",
        race = {
            r1 = 5,
            r2 = 2,
            r3 = 1,
            rt = 16
        }
    } },
    atlas = 'j_umas',
    soul_pos = { x = 9, y = 2 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "uma_pure_hearts",
            vars = {
                card.ability.extra.desc_2_1,
                card.ability.extra.desc_2_2,
                card.ability.extra.desc_2_3,
                card.ability.extra.desc_2_4,
                card.ability.extra.desc_2_5
            } }
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {  vars = {
            card.ability.extra.desc_1_1,
            card.ability.extra.desc_1_2,
            card.ability.extra.desc_1_3
        } }
    end,

    calculate = function(self, card, context)

        card.children.center:set_sprite_pos{ x = 9, y = (SMODS.find_card("j_uma_love") and 1 or 0) }
        card.children.floating_sprite:set_sprite_pos{ x = 9, y = (SMODS.find_card("j_uma_love") and 3 or 2) }

        if context.repetition and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end

        if context.debuff_card and context.debuff_card.area ~= G.jokers and not context.blueprint then
            if context.debuff_card:is_suit("Hearts", true) and not SMODS.has_enhancement(context.debuff_card, "m_wild") and
            (G.GAME.blind.config.blind.key ~= "bl_final_leaf" or G.GAME.blind.disabled) then
                return { prevent_debuff = true }
            else
                return { debuff = true }
            end
        end

        if context.debuff_card and context.debuff_card.area == G.jokers and not context.blueprint then
            if context.debuff_card.config.center.key == "j_smeared" then
                return {
                    message = localize('uma_not_pure'),
                    colour = G.C.SUITS["Hearts"],
                    message_card = context.debuff_card,
                    debuff = true
                }
            end
        end

        if SMODS.find_card("j_uma_love")  then
            card.ability.extra.desc_1_1 = localize("uma_love_1_1")
            card.ability.extra.desc_1_2 = localize("uma_love_1_2")
            card.ability.extra.desc_1_3 = localize("uma_love_1_3")
            card.ability.extra.desc_2_1 = localize("uma_love_2_1")
            card.ability.extra.desc_2_2 = localize("uma_love_2_2")
            card.ability.extra.desc_2_3 = localize("uma_love_2_3")
            card.ability.extra.desc_2_4 = localize("uma_love_2_4")
            card.ability.extra.desc_2_5 = localize("uma_love_2_5")
        else
            card.ability.extra.desc_1_1 = localize("uma_love_1_1_obsc")
            card.ability.extra.desc_1_2 = localize("uma_love_1_2_obsc")
            card.ability.extra.desc_1_3 = localize("uma_love_1_3_obsc")
            card.ability.extra.desc_2_1 = localize("uma_love_2_1_obsc")
            card.ability.extra.desc_2_2 = localize("uma_love_2_2_obsc")
            card.ability.extra.desc_2_3 = localize("uma_love_2_3_obsc")
            card.ability.extra.desc_2_4 = localize("uma_love_2_4_obsc")
            card.ability.extra.desc_2_5 = localize("uma_love_2_5_obsc")
        end
    end,

    joker_display_def = function(JokerDisplay)
        return {
            text = {
                {
                    dynatext = {
                        string = (
                            function()
                                local text = "You're mine..."
                                local hash = "@#$%&"
                                local set = {}
                                local loops = 10
                                for _=1, loops do
                                    local text2 = text
                                    --set[#set + 1] = text2
                                    for _=1, 3--[[( string.len(text) / 3 )]] do
                                        local char = pseudorandom('test', 1, string.len(text))
                                        local junk = pseudorandom('test', 1, string.len(hash))
                                        text2 =
                                            tostring(string.sub(text2, 1, char - string.len(text2) - 2)) ..
                                            tostring(string.sub( hash, junk, ( junk - string.len( hash ) - 1) )) ..
                                            tostring(char == string.len(text2) and "" or string.sub(text2, char - string.len(text2)))
                                        set[#set + 1] = text
                                        set[#set + 1] = text2
                                    end
                                end
                                return set
                            end
                        )(),
                        colours = { G.C.MULT },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.3,
                        scale = 0.4,
                        min_cycle_time = 0
                    }
                }
            },
            text_config = { colour = G.C.RED }
        }
    end
}

SMODS.Joker{ --Vodka
    key = "vodka",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 7, y = 1 },
    atlas = 'j_umas',
    config = { extra = { mult = 5, chips = 10, race = {
        r1 = 10,
        r2 = 5,
        r3 = 3,
        rt = 26
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.UMA.CHULT
            }
        end
    end
}

SMODS.Joker{ --Tokai Teio
    key = "teio",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 8, y = 1 },
    atlas = 'j_umas',
    config = { extra = { odds = 8, hospital = 0, recovery = 2, maxBuff = 2,  Xmult = 1.25, Xmult_mod = 2, race = {
        r1 = 9,
        r2 = 0,
        r3 = 0,
        rt = 12
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'teio')
        return {vars = {
            numerator, denominator, card.ability.extra.recovery, card.ability.extra.maxBuff, card.ability.extra.Xmult, card.ability.extra.Xmult_mod
        }}
    end,

    calculate = function(self, card, context)
        if context.press_play and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'teio', 1, card.ability.extra.odds) and card.ability.extra.maxBuff ~= 0 then
                card.ability.extra.hospital = card.ability.extra.recovery
                --print(card.ability.extra.hospital)
                SMODS.debuff_card(card, true, 'breakLeg')
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end
}

SMODS.Joker { --Haru Urara
    key = "haru",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 5, y = 2 },
    atlas = 'j_umas',
    config = { extra = { odds = 2, repetitions = 1, race = {
        r1 = 0,
        r2 = 5,
        r3 = 7,
        rt = 113
    } } },
    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_haru')
        return { vars = {
            numerator,
            denominator
        } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_uma_dirt')
            and SMODS.pseudorandom_probability(card, 'uma_haru', 1, card.ability.extra.odds) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_uma_dirt') then
                return true
            end
        end
        return false
    end
}

SMODS.Joker{ --Lucky Lilac
    key = "lilac",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 3, y = 4 },
    atlas = 'j_umas',
    config = { extra = { odds = 5, chips = 50, race = {
        r1 = 7,
        r2 = 4,
        r3 = 3,
        rt = 19
    } } },
    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'uma_lilac')
        return { vars = { numerator, denominator, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_lucky') and
            SMODS.pseudorandom_probability(card, 'uma_lilac', 1, card.ability.extra.odds) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
}

SMODS.Joker{ --Neo Universe
    key = "neo",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 4 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 7,
        r2 = 0,
        r3 = 3,
        rt = 13
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return nil
    end,

    calculate = function(self, card, context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Planet',
                                key_append = 'planet'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_planet'), colour = G.C.WHITE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
        end
    end,
}

SMODS.Joker{ --Mini the Lady
    key = "mini",
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    pos = { x = 0, y = 2 },
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    atlas = 'j_umas',
    config = { extra = { reduction = 10, percent = 50 } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats_no_record",
                vars = { }
            }
        end
        return {vars = {
            card.ability.extra.reduction,
            card.ability.extra.percent
        } }
    end,

    calculate = function(self, card, context)
        if context.press_play and G.GAME.current_round.hands_left == 1 and G.GAME.chips / G.GAME.blind.chips <= card.ability.extra.percent / 100 then
            G.GAME.blind.chips = G.GAME.blind.chips * (100 - card.ability.extra.reduction) / 100
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                message = localize('uma_mini'),
                colour = HEX("dfd858")
            }
        end
    end
}
--game crashes if maru is chosen by crimson heart with joker display turned on
SMODS.Joker{ --Maruzensky
    key = "maruzensky",
    blueprint_compat = false,
    rarity = 3,
    cost = 7,
    pos = { x = 4, y = 2 },
    atlas = 'j_umas',
    config = { extra = { hands = 1, race = {
        r1 = 8,
        r2 = 0,
        r3 = 0,
        rt = 8
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            card.ability.extra.hands
        } }
    end,

    add_to_deck = function(self, card, from_debuff)
        --print("start adding!")
        G.GAME.uma_max_hands_buffer = G.GAME.uma_max_hands_buffer + 1
        --print("max buffer: "..G.GAME.uma_max_hands_buffer)
        if G.GAME.uma_max_hands then
            G.GAME.uma_max_hands = math.min(G.GAME.uma_max_hands, card.ability.extra.hands)
        else
            G.GAME.uma_max_hands = card.ability.extra.hands
        end
        Uma_update_max_hands(G.hand.config.card_limit * 2)
        --print("added!")
    end,
    remove_from_deck = function(self, card, from_debuff)
        --print("start removing!")
        G.GAME.uma_max_hands_buffer = G.GAME.uma_max_hands_buffer - 1
        --print("max buffer: "..G.GAME.uma_max_hands_buffer)
        Uma_update_max_hands(G.hand.config.card_limit / 2)
        --print("removed!")
    end,
    
    calculate = function(self, card, context)
        return nil
    end,
}

SMODS.Joker{ --Forever Young
    key = "ebeyan",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 8, y = 2 },
    atlas = 'j_umas',
    soul_pos = { x = 8, y = 3 },
    config = { extra = { xmult = 1.3, race = {
        r1 = 11,
        r2 = 1,
        r3 = 3,
        rt = 15
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            card.ability.extra.xmult
        } }
    end,

    calculate = function(self, card, context)

        local eventTrigger = Event({ func = function()
            return {x_mult = card.ability.extra.xmult}
        end })

        local eventDebuffed = Event({ func = function()
                return {message = localize('k_debuffed'), colour = G.C.RED}
        end })

        local EbeyanEventBuffer = {}

        if context.individual and (context.cardarea == G.hand or context.scoring_hand) and not context.end_of_round and context.other_card:get_id() == 14 then
            if not context.other_card.debuff then
                EbeyanEventBuffer.x_mult = card.ability.extra.xmult
            else
                EbeyanEventBuffer.message = localize('k_debuffed')
                EbeyanEventBuffer.colour = G.C.RED
            end
        end

        if context.individual and (context.cardarea == G.hand or context.scoring_hand) and not context.end_of_round and SMODS.has_enhancement(context.other_card, "m_uma_dirt") then
            if next(EbeyanEventBuffer) == nil then  
                if not context.other_card.debuff then
                    EbeyanEventBuffer.x_mult = card.ability.extra.xmult
                else
                    EbeyanEventBuffer.message = localize('k_debuffed')
                    EbeyanEventBuffer.colour = G.C.RED
                end
            else
                EbeyanEventBuffer.extra = {}
                if not context.other_card.debuff then
                    EbeyanEventBuffer.extra.x_mult = card.ability.extra.xmult
                else
                    EbeyanEventBuffer.extra.message = localize('k_debuffed')
                    EbeyanEventBuffer.extra.colour = G.C.RED
                end
            end
        end

        if next(EbeyanEventBuffer) ~= nil then
            return EbeyanEventBuffer
        end
    end,

    in_pool = function(self, args)
        return true
    end
}

SMODS.Joker{ --Vivlos
    key = "vivlos",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 4 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 4,
        r2 = 6,
        r3 = 0,
        rt = 17
    } } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "uma_wealth",
            vars = {
                SMODS.Sticker.obj_table.uma_wealth.config.extra.money
            } }
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            nil
        } }
    end,
    calculate = function(self, card, context)
        if context.before then
            for _, v in ipairs(context.scoring_hand) do
                v:add_sticker('uma_wealth', true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        return true
                    end
                }))
            end
        end
        return nil
    end
}

SMODS.Joker{ --Daring Tact
    key = "tact",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 4 },
    atlas = 'j_umas',
    config = { extra = { increment = 1, current = 0, race = {
        r1 = 5,
        r2 = 1,
        r3 = 3,
        rt = 13
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.STOP_USE ~= 1 then
            card.ability.extra.current = (G.GAME.uma_global_counts.spread + G.GAME.uma_global_counts.bloom) * card.ability.extra.increment
        end
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            card.ability.extra.increment,
            card.ability.extra.current
        } }
    end,

    calculate = function(self, card, context)
        if G.GAME.STOP_USE ~= 1 or context.drawing_cards then
            card.ability.extra.current = (G.GAME.uma_global_counts.spread + G.GAME.uma_global_counts.bloom) * card.ability.extra.increment
        end
        if context.joker_main then
            card.ability.extra.current = (G.GAME.uma_global_counts.spread + G.GAME.uma_global_counts.bloom) * card.ability.extra.increment
            return {
                mult = card.ability.extra.current
            }
        end
    end
}

SMODS.Joker{ --Meisho Doto
    key = "meisho",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 2, y = 3 },
    atlas = 'j_umas',
    config = { extra = { basemult = 0, basechips = 0, mult = 10, chips = 25, race = {
        r1 = 10,
        r2 = 8,
        r3 = 2,
        rt = 27
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return { vars = {
            card.ability.extra.basechips,
            card.ability.extra.basemult,
            card.ability.extra.chips,
            card.ability.extra.mult
        } }
    end,

    calculate = function(self, card, context)
        if G.GAME.blind.boss and context.end_of_round and context.main_eval then
            card.ability.extra.basemult = card.ability.extra.basemult + card.ability.extra.mult
            card.ability.extra.basechips = card.ability.extra.basechips + card.ability.extra.chips
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.basemult,
                chips = card.ability.extra.basechips
            }
        end
    end
}

SMODS.Joker{ --T.M. Opera O, every single blind is a boss blind
    key = "opera",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 5, y = 3 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 14,
        r2 = 6,
        r3 = 3,
        rt = 26
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then--and context.main_eval then --context.final_scoring_step,,,,maybe
            G.GAME.blind.boss = true
        end
    end
}

SMODS.Joker{ --Admire Groove
    key = "aruvu",
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    pos = { x = 6, y = 3 },
    atlas = 'j_umas',
    config = { extra = { basemult = 0, addmult = 10, subtractmult = 5, suit = 'Clubs', race = {
        r1 = 8,
        r2 = 1,
        r3 = 3,
        rt = 21
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            card.ability.extra.addmult,
            card.ability.extra.subtractmult,
            card.ability.extra.basemult
        } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_suit(card.ability.extra.suit) then
                    card.ability.extra.basemult = card.ability.extra.basemult + card.ability.extra.addmult
                else
                    card.ability.extra.basemult = math.max(card.ability.extra.basemult - card.ability.extra.subtractmult, 0)
                end

            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.basemult
            }
        end
    end
}

SMODS.Joker{ --Belno Light
    key = "belno",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 4 },
    atlas = 'j_umas',
    config = { extra = { rounds = 4, round_reset = 4, race = {
        r1 = 10,
        r2 = 11,
        r3 = 3,
        rt = 45,
        name = "Twin Bee"
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats_renamed",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt,
                    card.ability.extra.race.name
                } }
        end
        return {vars = {
            card.ability.extra.round_reset,
            card.ability.extra.rounds
        } }
    end,

    calculate = function(self, card, context)
        if context.round_eval then
            card.ability.extra.rounds = card.ability.extra.rounds - 1

            if card.ability.extra.rounds <= 0 then
                card.ability.extra.rounds = card.ability.extra.round_reset
                local rando = 0
                for _, v in ipairs(G.jokers.cards) do
                    if v.config.center.blueprint_compat == true then
                        rando = rando + 1
                    end
                end
                if rando > 0 then
                    rando = pseudorandom('belno_choose', 1, rando)
                    for _, v in ipairs(G.jokers.cards) do
                        if v.config.center.blueprint_compat == true then
                            rando = rando - 1
                            if rando == 0 then
                                v.ability.uma_retriggers = (v.ability.uma_retriggers and v.ability.uma_retriggers or 0) + 1
                                return {
                                    message = localize('uma_trigger_added'),
                                    colour = SMODS.Gradients.uma_retrigger,
                                    message_card = v,
                                    extra = {
                                        message = tostring(card.ability.extra.rounds).." "..localize(card.ability.extra.rounds == 1 and "uma_round_singular" or "uma_round_plural"),
                                        colour = SMODS.Gradients.uma_retrigger,
                                        message_card = card
                                    }
                                }
                            end
                        end
                    end
                end
            end
            return {
                message = tostring(card.ability.extra.rounds).." "..localize(card.ability.extra.rounds == 1 and "uma_round_singular" or "uma_round_plural"),
                colour = SMODS.Gradients.uma_retrigger
            }
        end
    end,
        --v = the card you want to add a retrigger to
        --v.ability.uma_retriggers = (v.ability.uma_retriggers and v.ability.uma_retriggers or 0) + 1
    in_pool = function(self, args)
        return false
    end
}





SMODS.Joker{ --Spacer
    key = "spacer",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 9, y = 5 },
    display_size = { w = 71, h = 95 * 1.1 },
    atlas = 'j_umas',
    config = {},

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}





--Definitions for when they're ready
SMODS.Joker{ --Super Creek
    key = "creek",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 1, y = 2 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 8,
        r2 = 2,
        r3 = 2,
        rt = 16
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Air Groove
    key = "air",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 2, y = 2 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 9,
        r2 = 5,
        r3 = 3,
        rt = 19
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Nice Nature, scales on debuffed cards (still in love synergy. . . x x)
    key = "nature",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 3, y = 2 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 7,
        r2 = 6,
        r3 = 8,
        rt = 41
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Symboli Rudolf, scales off of rounds passed and bosses passed, smth like every roung passed gives X chips while everyboss gives 2X chips or mult wtv
    key = "rudolf",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 0, y = 3 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 13,
        r2 = 1,
        r3 = 1,
        rt = 16
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        if context.round_eval then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds <= 0 then
                local rando = 0
                for _, v in ipairs(G.jokers.cards) do
                    if v.config.center.blueprint_compat == true then
                        rando = rando + 1
                    end
                end
                if rando > 0 then
                    rando = pseudorandom('belno_choose', 1, rando)
                    for _, v in ipairs(G.jokers.cards) do
                        if v.config.center.blueprint_compat == true then
                            rando = rando - 1
                            if rando == 0 then
                                v.ability.uma_retriggers = (v.ability.uma_retriggers and v.ability.uma_retriggers or 0) + 1
                                card.ability.extra.rounds = card.ability.extra.round_reset
                            end
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Tamamo Cross
    key = "tamamo",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 1, y = 3 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 9,
        r2 = 3,
        r3 = 2,
        rt = 18
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Mihono Bourbon
    key = "bourbon",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 3, y = 3 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 7,
        r2 = 1,
        r3 = 0,
        rt = 8
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Mayano Top Gun
    key = "mayano",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 4, y = 3 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 8,
        r2 = 4,
        r3 = 5,
        rt = 21
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker{ --Gold City, spend 10 dollars to draw X amount of cards to ur hand
    key = "g_city",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 6, y = 2 },
    atlas = 'j_umas',
    config = { extra = { race = {
        r1 = 3,
        r2 = 4,
        r3 = 3,
        rt = 20
    } } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.show_placings then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = "uma_race_stats",
                vars = {
                    card.ability.extra.race.r1,
                    card.ability.extra.race.r2,
                    card.ability.extra.race.r3,
                    card.ability.extra.race.rt
                } }
        end
        return {vars = {
            nil
        } }
    end,

    calculate = function(self, card, context)
        return nil
    end,

    in_pool = function(self, args)
        return false
    end
}

--[[

To do list:
    Frisk:

    Potential horses:
        uper eek
        air goove
        ice ature
        udolf
        tamtsi
        robo horse
        mayano top gun
        old ity
        bel-woah
    Ideas:
        Gains +1/3/5 mult for each small/big/boss blind beaten
        smth with percentage of enhanced cards in deck
        Every even # round do smth every odd # round do smth
            Utilize G.GAME.uma_money_mod to multiply incoming money

    Joel:
    Potential horses:
    idk man!

    Joker Display:
        whoever else we've made man idk

    Do messages  for cards that need it

    Texturing:
        The rest of the horses (prioritize complete jokers)
        Turf Cards
            Dirt
        Boosters:
            Add Booster variation

    Fix all bugs stated



Checklist

ADD QUEEN RELATED JOKERS

Twin Turbo: Perfect Pair
    Fix perfect pair to trigger properly when wild cards are in play

Matthew ideas:
	Other:
		every queen scored increases this joker by +2 chips
		every card held in hand gives $3 at end of round but you recieve no interest
		maybe put a card that says every queen scored has a 1 in 2 chance to give $4
]]--