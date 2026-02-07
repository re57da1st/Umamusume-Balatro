return {
    descriptions = {
        Joker = {
            j_uma_helios = {
                name = "Daitaku Helios",
                text = {
                    {
                        "{C:clubs}Clubs{} and {C:diamonds}Diamonds{} give",
                        "{X:mult,C:white}X#1#{} Mult when scored",
                        "{C:inactive}Wei Wei!!!{}"
                    }
                },
            },

            j_uma_daiwa = {
                name = "Daiwa Scarlet",
                text = {
                    {
                        "Adds {C:mult}+#1#{} Mult to played",
                        "hand's base mult for every",
                        "{C:attention}Queen{} in your deck"
                    }
                },
            },

            j_uma_agnes = {
                name = "Agnes Digital",
                text = {
                    "All played {C:attention}Kings{} and",
                    "{C:attention}Jacks{} become {C:hearts}Queens{}",
                    "when scored"
                },
            }
        }
    },
    misc = {
        challenge_names = {
            c_uma_test = "Hewwo everynyan :wave:",
            c_uma_legends = "Legends",
            c_uma_sapper = "Sapper"
        },

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",
            yuri="Yuri!",
            queen_count="Queen Mult"
        }
    }
}