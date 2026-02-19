SMODS.Joker{ --Daitaku Helios
    key = "helios",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 0, y = 0 },
    config = { extra = { Xmult = 1.5 } },
    atlas = 'j_umas',
    soul_pos = { x = 0, y = 1 },

    loc_vars = function(self, info_queue, card)
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
    config = { extra = { q_mult = 8, total_mult = 0} },
    atlas = 'j_umas',
    soul_pos = { x = 1, y = 1 },

    loc_vars = function(self, info_queue, card)
        card.ability.extra.total_mult = Uma_rank_tally(12, card.ability.extra.q_mult)
        return { vars = {
            card.ability.extra.q_mult,  --Queen Mult, the amount of mult Daiwa gains per queen in the deck
            card.ability.extra.total_mult  --The total amount of mult Daiwa gains
        } }
    end,

    calculate = function(self, card, context)
        if context.modify_hand then --Context that happens after setting the poker hand type, and before scoring cards
            return {
                mult = Uma_rank_tally(12, card.ability.extra.q_mult)
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
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
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

SMODS.Joker{ --Twin Turbo works wif flush house nyat perfect pair
    key = "turbo",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 3, y = 0 },
    atlas = 'j_umas',
    config = { extra = { mult_gain = 5, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, localize('uma_perfect_pair', 'poker_hands'), card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and (next(context.poker_hands['uma_perfect_pair']) or next(context.poker_hands['Flush House'])) then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker{ --Goldship
    key = "goldship",
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 4, y = 0 },
    atlas = 'j_umas',
    config = { extra = { max = 100, min = 40, top = 4, bottom = 1}},
    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
        local loc_mult = ' ' .. (localize('k_mult')) .. ' '
        main_start = {
            { n = G.UIT.T, config = { text = '  +', colour = G.C.MULT, scale = 0.32 } },
            { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = 'rand()', colour = G.C.JOKER_GREY }, { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11) .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'), colour = G.C.RED },
                            loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
                            loc_mult, loc_mult, loc_mult, loc_mult },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start}
        
    end,

    calculate = function(self, card, context)
        local randomBlind = pseudorandom('goldship', card.ability.extra.bottom, card.ability.extra.top)
            if (context.before or context.final_scoring_step or context.setting_blind) and randomBlind==1 then
                if #G.jokers.cards > 0 then
                    G.jokers:unhighlight_all()
                    for _, joker in ipairs(G.jokers.cards) do
                        joker:flip()
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
                if randomBlind==2 and context.setting_blind then
                    debuff = { is_face = true }
                end
                if randomBlind==3 and context.setting_blind then
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
                if randomBlind==4 and context.setting_blind then
                                if context.stay_flipped and context.to_area == G.hand and
                context.other_card:is_face(true) then
                return {
                    stay_flipped = true
                }
            end
                end
                if context.joker_main then
                return {
                mult = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
                }
            end
    print(randomBlind)
    print('yay!!!!')
            end,
        }
--Doesn't eat lowest "buffed" card if all cards lower ranked are debuffed
SMODS.Joker{ --Oguri Cap
    key = "oguri",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 5, y = 0 },
    config = { extra = { chips = 0, chip_mod = 20, state = 0 } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
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
                if food_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
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
--Timer doesn't persist when exiting to menu
SMODS.Joker{ --Sakura Bakushin O
    key = "bakushin",
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 6, y = 0 },
    config = { extra = { mult = 0, mult_pot = 0, mult_add = 10, mult_mod = 1, active = false, sign = "+", interval = 3 } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
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

        if context.setting_blind and not context.blueprint then --Start of Blind
            card.ability.extra.active = true
            card.ability.extra.mult_pot = card.ability.extra.mult_add
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
    cost = 6,
    pos = { x = 2, y = 1 },
    config = { extra = { chips = 10, chips_mod = 10, mult = 4, mult_mod = 4, xmult = 1.0, xmult_mod = 0.1, consumable_rarity = 4 } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        return { vars = {
           card.ability.extra.chips, --Starting Chips value
           card.ability.extra.mult,  --Starting Mult  value
           card.ability.extra.xmult, --Starting xMult value
           card.ability.extra.chips_mod, --Chips increase value
           card.ability.extra.mult_mod,  --Mult  increase value
           card.ability.extra.xmult_mod  --xMult increase value
        } }
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

        if (context.starting_shop or context.reroll_shop) and not context.blueprint then
            Mambo_check(false)
        end

        if context.selling_self and not context.blueprint then
            Mambo_check(true)
        end

        Mambo_check = function(sell_bool)
            G.GAME.uma_mambo_consumable_rate = #SMODS.find_card("j_uma_mambo") - (sell_bool and 1 or 0) > 0 and card.ability.extra.consumable_rarity or 0
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
    blueprint_compat = false,
    rarity = 3,
    cost = 7,
    pos = { x = 3, y = 1 },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{ --Norn Ace
    key = "norn",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 4, y = 1 },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{ --Obey Your Master
    key = "obey",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 6, y = 1 },
    config = { extra = { mult = 2 } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
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
    config = { extra = { scaling = 1.5 } },
    atlas = 'j_umas',

    loc_vars = function(self, info_queue, card)
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
                                set = 'uma_better_Tarot',
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
                                set = 'uma_worse_Tarot',
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
        desc_1_3 = "%%%r%%%te% %er%a%n boss bl%n%%",
        desc_2_1 = "A pl%%i%g c%r%",
        desc_2_2 = "th%% %s",
        desc_2_3 = "%n%%",
        desc_2_4 = "%e%%%s",
        desc_2_5 = "a%% n%%%i%% %ls%"
    } },
    atlas = 'j_umas',

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
        return {  vars = {
            card.ability.extra.desc_1_1,
            card.ability.extra.desc_1_2,
            card.ability.extra.desc_1_3
        } }
    end,

    calculate = function(self, card, context)

        card.children.center:set_sprite_pos{ x = 9, y = (SMODS.find_card("j_uma_love") and 0 or 0) }

        if context.repetition and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end

        if context.debuff_card and context.debuff_card.area ~= G.jokers and not context.blueprint then
            if context.debuff_card:is_suit("Hearts", true) and not SMODS.has_enhancement(context.debuff_card, "m_wild") then
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
}

--[[

To do list:
    Frisk:
        Code Twin Turbo
        Code Goldship
        Code Fuku
    Potential horses:
        uper eek
        air goove
        ice ature
        aruzensky
        udolf
        tamtsi
        MEISHO DOTOOOOO
        robo horse
        mayano top gun
        odka odka odka
            queen scaling
            lesbians
        
    Joel:
        Code Chiyono O
            turns turf cards into blossom cards
        Code Norn Ace
        Retexture unfinished horses
        Fix Bakushin Bug
        Check up on bugs

        Enhancements:
            Turf
                gives x1.1 xChips when scored
                spreads to 1 random card when played with a non-turf card

    Potential horses:
        Vivlos
        Neo universe
        Lucky Lilac
        Daring Tact

Checklist

ADD QUEEN RELATED JOKERS

Helios: DONE
Daiwa: DONE
Agnes: DONE
    Splash bug: DONE (could be done better apparently)
    Check compatbiility with boss "only play 1 hand type"
Oguri Cap: DONE
    Oguri Cap no longer eats da game ^^!
Bakushin: DONE
    Pause menu bug: DONE 
    leave/rejoin bug: not fixed
    Debuff bug: DONE

Twin Turbo: Buff Two Pair, and Perfect Pair more?
    new poker hand - Perfect Pair: DONE
        "2 pairs of matching suits with different ranks,",
        "may be played with 1 other unscored card",
    	100 Chips x 10 Mult
        35 l_chips x 3 l_mult
            
        Process:
            Check all cards in hand, and tally up how many of each suit there is
            if a suit has 4+ cards then
                then store the name of the suit [suit]
                check all cards in hand again, and tally up each rank that matches [suit]
                if there are 2+ entries that have 2+ ranks in hand then
                    store each matching rank that matches [rank]
                    return all cards that match [suit] and any [rank]
                else
                    return nil
                end
            else
                return nil
            end

Gold Ship: Smth silly

Mambo: Has base chips, mult, and Xmult, values increase as certain consumeable cards show up and are bought/used for each

Chiyono O: no clue

Norn Ace: no clue

Obey Your Master: no clue




    


Matthew ideas:
	Goldship (his goat)
		Scoring queens gain a random seal and enhancement
		Gains +10 mult when a Queen is scored, shuffles all jokers before scoring
		If hand is 4oak, randomize suits and ranks of cards, gain +50 Mult
		Constantly plays the golshin song???

		Goldship note: could have multiple abilites, randomly triggers one of them

	Haru Urara:
		Doubles chips and mult if final hand AND 0 discards left	
	
	Other:
		every queen scored increases this joker by +2 chips
		every card held in hand gives $3 at end of round but you recieve no interest
		maybe put a card that says every queen scored has a 1 in 2 chance to give $4

	Carrot tarot card
		Create a random Horse Joker (common and uncommon)
	Carrot spectral card
		Create a random Horse Joker (Rare and Legendary)

	Stable Deck:
		Every Horse card trigger gives $5, and increases base boss blind by 5% - 15%

]]--