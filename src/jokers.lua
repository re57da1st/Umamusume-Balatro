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
    config = { extra = { Xmult = 1.3 } },
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

--Balance: Increase q_mult to +8?

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

--Only rare if other queen jokers are added

SMODS.Joker{
    key = "agnes",
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 2, y = 0 },
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

SMODS.Joker{
    key = "turbo",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 3, y = 0 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "goldship",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 4, y = 0 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "oguri",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 5, y = 0 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "bakushin",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 6, y = 0 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "mambo",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 2, y = 1 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "chiyono",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 3, y = 1 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "norn",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 4, y = 1 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
    end
}

SMODS.Joker{
    key = "obey",
    blueprint_compat = false,
    rarity = 1,
    cost = 2,
    pos = { x = 5, y = 1 },
    atlas = 'umas',

    loc_vars = function(self, info_queue, card)
        return nil
    end,

    calculate = function(self, card, context)
        return nil
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

--[[

Helios: DONE
Daiwa: DONE
Agnes: DONE
Twin Turbo: Perfect Pair hand type buff (2 pairs of same card)
Gold Ship: Smth silly
Oguri Cap: Consume card to deckfix and add 0.1 xmult to trigger
Bakushin: speed?
Obey Your Master: Every played card with Diamond suit permanently gains +1-3 mult when scored



Extra Mult Display (on card UI)
	+x chips
	+x Mult
	+x extra chips
	+x extra Mult

Add bonus permament bonus mult
	Add new ability called "perma_bonus_mult"

	UI Ability Table
		card.lua, line 731
			bonus_mult = ... self.ability.perma_bonus_mult

	Create function Card;get_chip_bonus_mult()

new poker hand - Perfect Pair?
	Two Flush Pair (2 sets of pairs where the suit and rank match individually)
	100 Chips x 10 Mult

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