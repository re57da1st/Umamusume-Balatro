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
                    
                    "{C:attention}+#3# Potential Mult{} at round begin,",
                    "lose {C:attention}-#4# Potential Mult{} every {C:attention}#7#{} second(s).",
                    "Becomes real {C:mult}Mult{} at end of round.",
                    "{C:inactive}(Mult: {C:mult}+#1#{C:inactive}, Potential Mult: {C:attention}#6##2#{C:inactive})",
                    --[[
                    "Mult: {C:mult}#1#{}",
                    "Mult Pot: {C:attention}#2#{}",
                    "Mult Add: {C:attention}#3#{}",
                    "Mult Mod: {C:attention}#4#{}",
                    "Active: {C:attention}#5#{}",
                    ]]--
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
        },

        Planet = {
            c_uma_twin_moons = {
                name = "Twin Moons",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            }

        }
    },
    misc = {
        challenge_names = {
            c_uma_helios_challenge = "Daitaku Helios",
            c_uma_daiwa_challenge = "Daiwa Scarlet",
            c_uma_agnes_challenge = "Agnes Digital",
            c_uma_turbo_challenge = "Twin Turbo",
            c_uma_goldship_challenge = "Goldship",
            c_uma_oguri_challenge = "Oguri Cap",
            c_uma_bakushin_challenge = "Sakura Bakushin O",
            c_uma_legends = "All Legends",
            c_uma_test = "Hewwo everynyan :wave:"
        },

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
            uma_oguri="Yummy!",
            uma_twin_moon="Moon(s)",
            uma_bakushin1="Bakushin!",
            uma_bakushin2="Bakushinshi-n!",
            uma_bakushin3="Ba-...",
            uma_mult_pot="Potential Mult"
        },
        poker_hand_descriptions = {
            uma_perfect_pair = {
                "2 pairs of matching suits with different ranks,",
                "may be played with 1 other unscored card"
            }
        },
        poker_hands = {
            uma_perfect_pair = "Perfect Pair"
        }
    }
}