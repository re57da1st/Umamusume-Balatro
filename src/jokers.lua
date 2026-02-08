SMODS.Atlas({
    key = "umas",
    path = "j_umas.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "helios",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 0, y = 0 },
    config = { extra = { Xmult = 1.5 } },
    atlas = 'umas',
    soul_pos = { x = 0, y = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card:is_suit("Clubs") or context.other_card:is_suit("Diamonds")) then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end

}

--Add a (currently: #1#) to Daiwa Description

SMODS.Joker{
    key = "daiwa",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 1, y = 0 },
    config = { extra = { q_mult = 5 } },
    atlas = 'umas',
    soul_pos = { x = 1, y = 1 },

    loc_vars = function(self, info_queue, card)
        local queen_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 12 then queen_tally = queen_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.q_mult, card.ability.extra.q_mult * queen_tally } }
    end,

    calculate = function(self, card, context)
        if context.modify_hand then
            local queens = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 12 then queens = queens + 1 end
                end
            end

            if queens > 0 then
                return {
                    mult = (card.ability.extra.q_mult * queens)
                }
            end
        end
    end
}

SMODS.Joker{
    key = "agnes",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 0 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    --Add compatibility with SPLASH

    calculate = function(self, card, context)
        if context.press_play and not context.blueprint then
            local queens = 0
            for _, card in ipairs(select(4,G.FUNCS.get_poker_hand_info(G.hand.highlighted))) do
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
                    message = localize('yuri'),
                    colour = G.C.RED
                }
            end
        end
    end
}






local oldgfuncsplaycardsfromhighlighted = G.FUNCS.play_cards_from_highlighted
---@diagnostic disable-next-line: duplicate-set-field
G.FUNCS.play_cards_from_highlighted = function(e)
    for k, v in pairs(G.hand.highlighted) do
        v.ability.uma = v.ability.played_this_ante
    end
    return oldgfuncsplaycardsfromhighlighted(e)
end