
SMODS.Booster { --Normal Turf Pack
    key = "turf_normal",
    weight = 2,
    kind = 'uma_turf',
    cost = 4,
    pos = { x = 0, y = 0 },
    atlas = 'p_umas',
    config = { extra = 3, choose = 1 },
    group_key = "k_umg_turf_pack",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "uma_turf_related"
        }
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,

    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "vremade_standard_edition" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        local _enhancement = uma_turf_pack_poll()
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            enhancement = _enhancement,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "vremade_sta"
        }
    end
}

SMODS.Booster { --Jumbo Turf Pack
    key = "turf_jumbo",
    weight = 1,
    kind = 'uma_turf',
    cost = 6,
    pos = { x = 1, y = 0 },
    atlas = 'p_umas',
    config = { extra = 5, choose = 1 },
    group_key = "k_umg_turf_pack",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "uma_turf_related"
        }
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,

    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "vremade_standard_edition" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        local _enhancement = uma_turf_pack_poll()
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            enhancement = _enhancement,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "vremade_sta"
        }
    end
}

SMODS.Booster { --Mega Turf Pack
    key = "turf_mega",
    weight = 0.25,
    kind = 'uma_turf',
    cost = 8,
    pos = { x = 2, y = 0 },
    atlas = 'p_umas',
    config = { extra = 5, choose = 2 },
    group_key = "k_umg_turf_pack",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "uma_turf_related"
        }
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,

    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "vremade_standard_edition" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        local _enhancement = uma_turf_pack_poll()
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            enhancement = _enhancement,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "vremade_sta"
        }
    end
}

uma_turf_pack_poll = function() --Utilize the Uma Weighted Function to hold all Enhancement data for all Turf Packs in one place
    local items = {
        "m_uma_turf",
        "m_uma_dirt",
        "m_uma_mossy",
        "m_uma_blossom"
    }
    local weights = {
        17,--12,
        0, --8,
        7, --4,
        1  --1
    }
    return Uma_weighted_picker(items, weights, "turf_pack")
end