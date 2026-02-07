SMODS.Challenge {
    key = 'test',
    rules = {
        custom = {},
        modifiers = {
            { id = 'hands', value = 67 },
            { id = 'discards', value = 67 },
            { id = 'dollars', value = 676767 }
        }
    },
    jokers = {
        {id = 'j_uma_helios'},
        {id = 'j_uma_daiwa'},
        {id = 'j_uma_agnes'}
    },
    restrictions = {}
}

SMODS.Challenge {
    key = 'sapper',
    rules = {
        custom = {},
        modifiers = {}
    },
    jokers = {
        {id = 'j_vampire'},
        {id = 'j_midas_mask'}
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
