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

SMODS.Joker{
    key = "daiwa",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 1, y = 0 },
    atlas = 'umas',
    soul_pos = { x = 1, y = 1 },

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
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

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local queens = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if (scored_card:get_id() == 11 or scored_card:get_id() == 13) then
                    queens = queens + 1
                    assert(SMODS.change_base(scored_card, nil, "Queen"))
                    scored_card.ability.played_this_ante = scored_card.ability.uma_old_played_this_ante
                    SMODS.recalc_debuff(scored_card)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
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
G.FUNCS.play_cards_from_highlighted = function(e)
    for k, v in pairs(G.hand.highlighted) do
        v.ability.uma = v.ability.played_this_ante
    end
    return oldgfuncsplaycardsfromhighlighted(e)
end