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
                        "{C:attention}Queen{} in your deck",
                    "{C:inactive}(Currently {C:mult}+#2#{}{C:inactive})",
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
            },

            j_uma_turbo = {
                name = "Twin Turbo",
                text = {
                    "Twin Towers"
                },
            },

            j_uma_goldship = {
                name = "Golshi",
                text = {
                    "Golshin Golshin Golshin!",
                    "Golshin Golshin Golshin!",
                    "Golshin, Golshin, Gol shin shin!"
                },
            },

            j_uma_oguri = {
                name = "Oguri Cap",
                text = {
                    "On round end, {C:attention}consume{} the",
                    "{C:attention}lowest{} rank card held in",
                    "hand, and gain {C:chips}+#2#{} chips",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                },
            },

            j_uma_bakushin = {
                name = "Sakura Bakushin O",
                text = {
                    "Bakushin Bakushin Bakushin!",
                    "Bakushin Bakushin Bakushin!",
                    "Bakushin, Bakushin, Baku shin shin!"
                },
            },

            j_uma_mambo = {
                name = "matikanetannhauser",
                text = {
                    "Mambo, Mambo!",
                    "Omatsuri Mambo!",
                    "Zabu Zabu, Yura Yura,",
                    "Omatsuri Mambo!"
                },
            },

            j_uma_chiyono = {
                name = "Sakura Chiyono O",
                text = {
                    "Chi-yo, Chiyo Chiyo Chiyono O!",
                    "Do-ki doki doki doki do-ki~?",
                    "Chi-yo, Chiyo Chiyo Chiyono O!",
                    "Suuki, suki suki shugi Chiyono O!"
                },
            },

            j_uma_norn = {
                name = "Norn Ace",
                text = {
                    "The 2nd most obessive horse in this mod"
                },
            },

            j_uma_obey = {
                name = "Obey Your Master",
                text = {
                    "The most American Japanese Horse girl I've ever seen"
                },
            }
        }
    },
    misc = {
        challenge_names = {
            c_uma_helios_challenge = "Daitaku Helios",
            c_uma_daiwa_challenge = "Daiwa Scarlet",
            c_uma_agnes_challenge = "Agnes Digital",
            c_uma_oguri_challenge = "Oguri Cap",
            c_uma_goldship_challenge = "Goldship",
            c_uma_legends = "All Legends",
            c_uma_test = "Hewwo everynyan :wave:",
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
            uma_yuri="Yuri!",
            uma_oguri="Yummy!"
        },
        poker_hand_descriptions = {
            ["uma_PPair"] = {
                
            }




        }
    }
}