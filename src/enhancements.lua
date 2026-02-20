SMODS.Enhancement { --Turf
    key = 'turf',
    pos = { x = 0, y = 0 },
    config = { xChips = 1.1 },
    atlas = 'e_umas',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.xChips } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                xchips = card.ability.xChips
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Enhancement { --Blossom
    key = 'blossom',
    pos = { x = 1, y = 0 },
    config = { xChips = 1.2 },
    atlas = 'e_umas',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.xChips } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                xchips = card.ability.xChips
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Enhancement { --Mossy
    key = 'mossy',
    pos = { x = 2, y = 0 },
    config = { bonus = 100 },
    atlas = 'e_umas',
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Enhancement { --Dirt
    key = 'dirt',
    pos = { x = 3, y = 0 },
    config = { },
    atlas = 'e_umas',

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,

    in_pool = function(self, args)
        return false
    end
}