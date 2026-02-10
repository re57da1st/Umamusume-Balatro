SMODS.Challenge {
    key = 'helios_challenge',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_uma_helios'}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'daiwa_challenge',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_uma_daiwa'}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'agnes_challenge',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_uma_agnes'}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'turbo_challenge',
    rules = {
        custom = {},
        modifiers = {
            { id = 'consumable_slots', value = 4 }
        }
    },
    jokers = {
        {id = 'j_uma_helios'},
        {id = 'j_uma_daiwa'},
        {id = 'j_uma_turbo'}
    },
    deck = {},
    consumeables = {
        {id = 'c_uma_twin_moons'}
    },
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'goldship_challenge',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_uma_goldship'}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'oguri_challenge',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_uma_oguri'}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'legends',
    rules = {
        custom = {},
        modifiers = {
            { id = 'joker_slots', value = 7 },
        }
    },

    jokers = {
        {id = 'j_caino', eternal = true},
        {id = 'j_triboulet', eternal = true},
        {id = 'j_yorick', eternal = true},
        {id = 'j_chicot', eternal = true},
        {id = 'j_perkeo', eternal = true},
        {id = 'j_uma_helios', eternal = true},
        {id = 'j_uma_daiwa', eternal = true}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

SMODS.Challenge {
    key = 'test',
    rules = {
        custom = {},
        modifiers = {
            { id = 'hands', value = 67 },
            { id = 'discards', value = 67 },
            { id = 'dollars', value = 676767 },
            { id = 'joker_slots', value = 150 },
            { id = 'consumable_slots', value = 75 }
        }
    },
    jokers = {
        {id = 'j_uma_helios'},
        {id = 'j_uma_daiwa'},
        {id = 'j_uma_agnes'},
        {id = 'j_uma_turbo'},
        {id = 'j_uma_goldship'},
        {id = 'j_uma_oguri'},
        {id = 'j_uma_bakushin'},
        {id = 'j_uma_mambo'},
        {id = 'j_uma_chiyono'},
        {id = 'j_uma_norn'},
        {id = 'j_uma_obey'}
    },
    consumeables = {},
    vouchers = {},
    restrictions = {}
}

--{ s = 'D', r = 'Q', e = 'm_steel', d = 'polychrome', g = 'Red' }