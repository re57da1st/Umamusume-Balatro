SMODS.Challenge {--Choose your Uma!
    key = 'horse',
    rules = {
        modifiers = {
            { id = 'consumable_slots', value = 7 }
        }
    },
    jokers = {
    },
    consumeables = {
        {id = 'c_uma_ssr_ticket'},
        {id = 'c_uma_ssr_ticket'},
        {id = 'c_uma_ssr_ticket'},
        {id = 'c_uma_ssr_ticket'},
        {id = 'c_uma_ssr_ticket'}
    },
    vouchers = {
    }
}

SMODS.Challenge {--Unstable Income
    key = 'unstable_income',
    rules = {
        custom = {
            { id = 'unstable_income', value = { 20, 50 } },
            { id = 'unstable_income_loc1', },
            { id = 'unstable_income_loc2', },
        }
    },
    jokers = {
    },
    consumeables = {
    },
    vouchers = {
    }
}

SMODS.Challenge {--Unstable Income
    key = 'all_horses',
    rules = {
    },
    jokers = {

        --Commons
        {id = 'j_uma_norn'},
        {id = 'j_uma_haru'},
        {id = 'j_uma_lilac'},
        {id = 'j_uma_mini'},
        {id = 'j_uma_doto'},


        --Uncommons
        {id = 'j_uma_spacer'},
        {id = 'j_uma_turbo'},
        {id = 'j_uma_chiyono'},
        {id = 'j_uma_obey'},
        {id = 'j_uma_vodka'},
        {id = 'j_uma_teio'},
        {id = 'j_uma_neo'},
        {id = 'j_uma_vivlos'},
        {id = 'j_uma_tact'},
        {id = 'j_uma_belno'},
        {id = 'j_uma_aruvu'},
        {id = 'j_uma_opera'},


        --Rares
        {id = 'j_uma_spacer'},
        {id = 'j_uma_agnes'},
        {id = 'j_uma_goldship'},
        {id = 'j_uma_oguri'},
        {id = 'j_uma_bakushin'},
        {id = 'j_uma_mambo'},
        {id = 'j_uma_fuku'},
        {id = 'j_uma_love'},
        {id = 'j_uma_maruzensky'},
        {id = 'j_uma_ebeyan'},
        {id = 'j_uma_tachyon'},


        --Legendaries
        {id = 'j_uma_spacer'},
        {id = 'j_uma_helios'},
        {id = 'j_uma_daiwa'},


        --Unknown
        {id = 'j_uma_spacer'},
        {id = 'j_uma_creek'},
        {id = 'j_uma_air'},
        {id = 'j_uma_nature'},
        {id = 'j_uma_rudolf'},
        {id = 'j_uma_tamamo'},
        {id = 'j_uma_bourbon'},
        {id = 'j_uma_mayano'},
        {id = 'j_uma_g_city'},
    },
    consumeables = {
    },
    vouchers = {
    }
}


--Example card definition:
--{ s = 'D', r = 'Q', e = 'm_steel', d = 'polychrome', g = 'Red' }

Uma_Challenge_ban("c_fragile_1", {
    cards = {
        {id = 'p_uma_turf_normal', ids = {
        'p_uma_turf_normal',
        'p_uma_turf_jumbo',
        'p_uma_turf_mega'
        }},
        {id = 'c_uma_pedigree'}
    },
    tags = {},
    other = {}
})


