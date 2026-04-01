SMODS.Sticker { --Wealth Sticker
    key = "wealth",
    atlas = 'st_umas',
    pos = { x = 0, y = 0 },
    badge_colour = G.C.UMA.WEALTH,
    config = { extra = { money = 2, safe = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability[self.key].extra.money
        } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability[self.key].extra.safe = true
            return {
                dollars = card.ability[self.key].extra.money
            }
        end
    end
}