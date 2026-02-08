SMODS.Challenge {
    key = 'helios_challenge',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_uma_helios'}
    },
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
        {id = 'j_uma_agnes'}
    },
    restrictions = {}
}