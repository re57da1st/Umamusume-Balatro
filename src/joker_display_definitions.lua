local jd_def = JokerDisplay.Definitions

jd_def["j_uma_helios"] = { --Daitaku Helios
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text1", colour = lighten(G.C.SUITS["Clubs"], 0.35) },
        { text = ", " },
        { ref_table = "card.joker_display_values", ref_value = "localized_text2", colour = lighten(G.C.SUITS["Diamonds"], 0.35) },
        { text = ")" }
    },
    calc_function = function(card)
        local count = 0
        if G.play then
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit("Clubs") or scoring_card:is_suit("Diamonds") then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
        else
            count = 3
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text1 = localize("Clubs", 'suits_plural')
        card.joker_display_values.localized_text2 = localize("Diamonds", 'suits_plural')
    end
}

jd_def["j_uma_daiwa"] = { --Daiwa Scarlet
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "daiwa", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(Base Mult)" }
    },
    calc_function = function(card)
        local queens = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 12 then queens = queens + 1 end
            end
        end
        card.joker_display_values.daiwa = queens * (card.ability.extra.q_mult or 0)
    end
}

jd_def["j_uma_oguri"] = { --Oguri Cap
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "chips" },
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = {
        { text = "(", colour = G.C.UI.TEXT_INACTIVE },
        { ref_table = "card.joker_display_values", ref_value = "state" },
        { text = ")", colour = G.C.UI.TEXT_INACTIVE }
    },
    calc_function = function(card)
        card.joker_display_values.state = (card.ability.extra.state == 1 and localize('uma_oguri_full') or localize('uma_oguri_hungry'))
    end,

    style_function = function(card, text, reminder_text, extra)
            if reminder_text and reminder_text.children and reminder_text.children[2] then
                reminder_text.children[2].config.colour = card.ability.extra.state == 1 and G.C.GREEN or
                    G.C.UI.TEXT_INACTIVE
            end
        end
}

jd_def["j_uma_bakushin"] = { --Sakura Bakushin O
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text1", colour = G.C.UMA.BAKUSHIN },
        { ref_table = "card.joker_display_values", ref_value = "mult_pot", colour = G.C.UMA.BAKUSHIN },
        { text = " " },
        { ref_table = "card.joker_display_values", ref_value = "localized_text2", colour = G.C.UMA.BAKUSHIN },
        { text = ")" }
    },
 
    calc_function = function(card)
        local sign = "+"
        if card.ability.extra.mult_pot < 0 then sign = "" end
        card.joker_display_values.mult = card.ability.extra.mult
        card.joker_display_values.mult_pot = card.ability.extra.mult_pot
        card.joker_display_values.localized_text1 = sign
        card.joker_display_values.localized_text2 = localize("uma_mult_pot")
    end
}

jd_def["j_uma_mambo"] = { --Matikanetannhauser
    text = {
        { text = "+", colour = G.C.CHIPS }, --chips display
        { ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS },

        { text = " ",},

        { text = "+", colour = G.C.MULT }, --mult display
        { ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT },

        { text = " ",},

        {  --xMult display
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
        }
    },
    calc_function = function(card)
        card.joker_display_values.chips = card.ability.extra.chips
        card.joker_display_values.mult = card.ability.extra.mult
        card.joker_display_values.xmult = card.ability.extra.xmult
    end
}