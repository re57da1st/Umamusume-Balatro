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
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "if played hand contains",
                    "a {C:attention}#2#",
                    "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
                },
            },

            j_uma_goldship = {
                name = "Goldship",
                text = {
                    "{C:mult}+#1# {}to {C:mult}+#2# {}mult range",
                    "Mimics a certain {C:attention}boss blind",
                    "{C:inactive}>> #3# <<"
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
                    
                    "{C:uma_col_bakushin}+#3# Potential Mult{} at round begin,",
                    "lose {C:uma_col_bakushin}-#4# Potential Mult{} every {C:attention}#7#{} second(s).",
                    "Becomes real {C:mult}Mult{} at end of round.",
                    "{C:inactive}(Mult: {C:mult}+#1#{C:inactive}, Potential Mult: {C:uma_col_bakushin}#6##2#{C:inactive})",
                },
            },

            j_uma_mambo = {
                name = "Matikanetannhauser",
                text = {
                    "Gives {C:chips}+#1#{} Chips and {C:mult}+#2# {X:mult,C:white}X#3#{}",
                    " Mult. Using {C:attention}certain consumables{}",
                    " increase these values"
                },
            },

            j_uma_chiyono = {
                name = "Sakura Chiyono O",
                text = {
                    "Converts a played {C:uma_turf}Turf",
                    "card to a {C:uma_blossom}Blossom {}card",
                    "after scoring {C:inactive}(max 1)"
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
                    "Every played {C:attention}card{}",
                    "permanently gains",
                    "{C:mult}+#1#{} Mult when scored",
                },
            },

            j_uma_fuku = {
                name = "Matikanefukukitaru",
                text = {
                    "If final score is {C:attention}x#1# {}blind size,",
                    "create a {C:uma_col_better_tarot2}Better Tarot Card{},",
                    "else create a {C:uma_col_worse_tarot2}Worse Tarot Card"
                },
            },

            j_uma_love = {
                name = "{C:hearts}Still in Love",
                text = {
                    "#1# {C:hearts}Pure Hearts{},",
                    "#2#",
                    "{C:inactive}(#3#)"

                    --[[
                    "Retriggers all {C:hearts}Pure Hearts{},",
                    "debuffs all other cards",
                    "{C:inactive}(Overwrites certain boss blinds)"
                    ]]
                },
            },
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

        },

        uma_better_Tarot = {
            c_uma_better_chariot = {
                name = "The Chariot{C:green}+",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_uma_better_death = {
                name = "Death{C:green}+",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "convert the {C:attention}left{} cards",
                    "into the {C:attention}right{} card",
                    "{C:inactive}(Drag to rearrange)",
                },
            },
            c_uma_better_devil = {
                name = "The Devil{C:green}+",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_uma_better_emperor = {
                name = "The Emperor{C:green}+",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:spectral}Spectral{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
            c_uma_better_empress = {
                name = "The Empress{C:green}+",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
            c_uma_better_fool = {
                name = "The Fool{C:green}+",
                text = {
                    "Creates the last",
                    "{C:spectral}Spectral{}/{C:tarot}Tarot{} and {C:planet}Planet{} card",
                    "used during this run",
                    "{s:0.8,C:tarot}The Fools{s:0.8} excluded",
                },
            },
            c_uma_better_hanged_man = {
                name = "The Hanged Man{C:green}+",
                text = {
                    "Destroys up to",
                    "{C:attention}#1#{} selected cards",
                },
            },
            c_uma_better_heirophant = {
                name = "The Hierophant{C:green}+",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
            c_uma_better_hermit = {
                name = "The Hermit{C:green}+",
                text = {
                    "Doubles money",
                    "{C:inactive}(Max of {C:money}$#1#{C:inactive})",
                },
            },
            c_uma_better_high_priestess = {
                name = "The High Priestess{C:green}+",
                text = {
                    "Creates up to {C:attention}#1#{} random",
                    "{C:uma_col_better_planet2}Better Planet{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
            c_uma_better_judgement = {
                name = "Judgement{C:green}+",
                text = {
                    "Creates a random",
                    "{C:red}Rare{} {C:attention}Joker{} card",
                    "{C:inactive}(Must have room)",
                },
            },
            c_uma_better_justice = {
                name = "Justice{C:green}+",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_uma_better_lovers = {
                name = "The Lovers{C:green}+",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_uma_better_magician = {
                name = "The Magician{C:green}+",
                text = {
                    "Enhances {C:attention}#1#{} selected cards to",
                    "{C:attention}#2#s",
                },
            },
            c_uma_better_moon = {
                name = "The Moon{C:green}+",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                },
            },
            c_uma_better_star = {
                name = "The Star{C:green}+",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                },
            },
            c_uma_better_strength = {
                name = "Strength{C:green}+",
                text = {
                    "Increases rank of",
                    "up to {C:attention}#1#{} selected",
                    "cards by {C:attention}1",
                },
            },
            c_uma_better_sun = {
                name = "The Sun{C:green}+",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                },
            },
            c_uma_better_temperance = {
                name = "Temperance{C:green}+",
                text = {
                    "Gives the total sell",
                    "value of all current",
                    "Jokers {C:inactive}(Max of {C:money}$#1#{C:inactive})",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
                },
            },
            c_uma_better_tower = {
                name = "The Tower{C:green}+",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_uma_better_wheel_of_fortune = {
                name = "The Wheel of Fortune{C:green}+",
                text = {
                    "{C:green}#1# in #2#{} chance to add",
                    "{C:dark_edition}Holographic{} or",
                    "{C:dark_edition}Polychrome{} edition",
                    "to a random {C:attention}Joker",
                },
            },
            c_uma_better_world = {
                name = "The World{C:green}+",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                },
            },
        },

        uma_worse_Tarot = {
            c_uma_worse_chariot = {
                name = "The Chariot{C:red}-",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "enhance {C:attention}#1#{} selected",
                    "card into a {C:attention}#4#",
                },
            },
            c_uma_worse_death = {
                name = "Death{C:red}-",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "convert the {C:attention}left{} cards",
                    "into the {C:attention}right{} card",
                    "{C:inactive}(Drag to rearrange)",
                },
            },
            c_uma_worse_devil = {
                name = "The Devil{C:red}-",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "enhance {C:attention}#1#{} selected",
                    "card into a {C:attention}#4#",
                },
            },
            c_uma_worse_emperor = {
                name = "The Emperor{C:red}-",
                text = {
                    "Creates {C:attention}#1# random",
                    "{C:uma_col_worse_tarot}Worse Tarot{} card",
                    "{C:inactive}(Must have room)",
                },
            },
            c_uma_worse_empress = {
                name = "The Empress{C:red}-",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card to {C:attention}#2#s",
                },
            },
            c_uma_worse_fool = {
                name = "The Fool{C:red}-",
                text = {
                    "Creates the last",
                    "{C:tarot}Tarot{} or {C:planet}Planet{} card",
                    "used during this run",
                    "{s:0.8,C:tarot}The Fool{s:0.8} excluded",
                },
            },
            c_uma_worse_hanged_man = {
                name = "The Hanged Man{C:red}-",
                text = {
                    "Destroys {C:attention}#1#{} selected card",
                },
            },
            c_uma_worse_heirophant = {
                name = "The Hierophant{C:red}-",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card to {C:attention}#2#s",
                },
            },
            c_uma_worse_hermit = {
                name = "The Hermit{C:red}-",
                text = {
                    "Doubles money",
                    "{C:inactive}(Max of {C:money}$#1#{C:inactive})",
                },
            },
            c_uma_worse_high_priestess = {
                name = "The High Priestess{C:red}-",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:planet}Planet{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
            c_uma_worse_judgement = {
                name = "Judgement{C:red}-",
                text = {
                    "Creates a random",
                    "{C:red}Rare{} {C:attention}Joker{} card",
                    "{C:inactive}(Must have room)",
                },
            },
            c_uma_worse_justice = {
                name = "Justice{C:red}-",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "enhance {C:attention}#1#{} selected",
                    "card into a {C:attention}#4#",
                },
            },
            c_uma_worse_lovers = {
                name = "The Lovers{C:red}-",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "enhance {C:attention}#1#{} selected",
                    "card into a {C:attention}#4#",
                },
            },
            c_uma_worse_magician = {
                name = "The Magician{C:red}-",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card to {C:attention}#2#s",
                },
            },
            c_uma_worse_moon = {
                name = "The Moon{C:red}-",
                text = {
                    "Converts {C:attention}#1#{} selected ",
                    "card to {V:1}#2#{}",
                },
            },
            c_uma_worse_star = {
                name = "The Star{C:red}-",
                text = {
                    "Converts {C:attention}#1#{} selected ",
                    "card to {V:1}#2#{}",
                },
            },
            c_uma_worse_strength = {
                name = "Strength{C:red}-",
                text = {
                    "Increases rank of",
                    "{C:attention}#1#{} selected card by {C:attention}1",
                },
            },
            c_uma_worse_sun = {
                name = "The Sun{C:red}-",
                text = {
                    "Converts {C:attention}#1#{} selected ",
                    "card to {V:1}#2#{}",
                },
            },
            c_uma_worse_temperance = {
                name = "Temperance{C:red}-",
                text = {
                    "Gives the total sell",
                    "value of all current",
                    "Jokers {C:inactive}(Max of {C:money}$#1#{C:inactive})",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
                },
            },
            c_uma_worse_tower = {
                name = "The Tower{C:red}-",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "enhance {C:attention}#1#{} selected",
                    "card into a {C:attention}#4#",
                },
            },
            c_uma_worse_wheel_of_fortune = {
                name = "The Wheel of Fortune{C:red}-",
                text = {
                    "{C:green}#1# in #2#{} chance to add {C:dark_edition}Foil{}",
                    "edition to a random {C:attention}Joker",
                },
            },
            c_uma_worse_world = {
                name = "The World{C:red}-",
                text = {
                    "Converts {C:attention}#1#{} selected ",
                    "card to {V:1}#2#{}",
                },
            },
        },

        uma_mambo_consumable = {

            c_uma_mambo_boots = {
                name = "Mambo's Boots",
                text = {
                    "{C:attention}LOST AND FOUND:",
                    "Return boots to {C:uma_col_mambo2}Mambo{} and",
                    "gain {C:chips}+#1#{} Chips!"
                },
            },
            c_uma_mambo_hat = {
                name = "Mambo's Hat",
                text = {
                    "{C:attention}LOST AND FOUND:",
                    "Return hat to {C:uma_col_mambo2}Mambo{} and",
                    "gain {C:mult}+#1#{} Mult!"
                },
            },
            c_uma_mambo_plushie = {
                name = "Mambo's Plushie",
                text = {
                    "{C:attention}LOST AND FOUND:",
                    "Return plushie to {C:uma_col_mambo2}Mambo{} and",
                    "gain {X:mult,C:white}x#1#{} Mult!"
                },
            },
        },

        uma_Planet = {
            c_uma_better_mercury = {
                name = "Mercury{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_venus = {
                name = "Venus{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_earth = {
                name = "Earth{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_mars = {
                name = "Mars{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_jupiter = {
                name = "Jupiter{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_saturn = {
                name = "Saturn{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_uranus = {
                name = "Uranus{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_neptune = {
                name = "Neptune{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_pluto = {
                name = "Pluto{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_planet_x = {
                name = "Planet X{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_ceres = {
                name = "Ceres{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_eris = {
                name = "Eris{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            },

            c_uma_better_twin_moons = {
                name = "Twin Moons{C:green}+",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#{} 3 times",
                    "{C:mult}+#5#{} Mult and",
                    "{C:chips}+#6#{} chips",
                },
            }
        },

        Enhanced = {
            m_uma_turf = {
                name = "Turf Card",
                text = {
                    "{X:chips,C:white}x#1#{} chips",
                    "spreads {C:uma_turf}Turf {}to blank playings",
                    "cards when {C:attention}scored together",
                    "{C:inactive}(max 1 spread per hand)"
                },
            },

            m_uma_blossom = {
                name = "Blossom Card",
                text = {
                    "{X:chips,C:white}x#1#{} chips",
                    "spreads {C:uma_turf}Turf {}to blank playings",
                    "cards when {C:attention}scored together",
                    "{C:inactive}(max 1 spread per hand)"
                },
            },

            m_uma_mossy = {
                name = "Mossy Card",
                text = {
                    "{C:chips}+#1#{} chips",
                    "no rank or suit",
                },
            },

            m_uma_dirt = {
                name = "Dirt Card",
                text = {
                    "muffin,,,"
                },
            }
        },

        Other = {
            undiscovered_uma_better_tarot = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
                },
            },
            
            undiscovered_uma_mambo_consumable = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
                },
            },

            uma_pure_hearts = {
                name = "{C:hearts}Pure Hearts",
                text = {
                    "#1#",
                    "#2# {C:attention}#3# {C:hearts}#4#{},",
                    "#5#",
                    
                    --[[
                    "A playing card",
                    "that is {C:attention}only {C:hearts}hearts{},",
                    "and nothing else",
                    ]]
                }
            },

            uma_turf_related = {
                name = "Turf-related",
                text = {
                    "All cards will have one",
                    "of the following enhancements:",
                    "{C:uma_turf}Turf{}, Dirt, Mossy, {C:uma_blossom}Blossom{}",
                    
                    --[[
                    "A playing card",
                    "that is {C:attention}only {C:hearts}hearts{},",
                    "and nothing else",
                    ]]
                }
            },

            p_uma_turf_normal = {
                name = "Turf Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:uma_turf}Turf{}-related playing",
                    "cards to add to your deck",
                },
            },

            p_uma_turf_jumbo = {
                name = "Jumbo Turf Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:uma_turf}Turf{}-related playing",
                    "cards to add to your deck",
                },
            },

            p_uma_turf_mega = {
                name = "Mega Turf Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:uma_turf}Turf{}-related playing",
                    "cards to add to your deck",
                },
            },
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
            c_uma_mambo_challenge = "Matikanetannhauser",
            c_uma_chiyono_challenge = "Sakura Chiyono O",
            c_uma_norn_challenge = "Norn Ace",
            c_uma_obey_challenge = "Obey Your Master",
            c_uma_fuku_challenge = "Matikanefukukitaru",
            c_uma_love_challenge = "Still in Love",
            c_uma_legends = "All Legends",
            c_uma_all = "All horsies ^.^",
            c_uma_functional = "Everyone who's functional",
            c_uma_textured = "Everyone who's textured",
            c_uma_testIskIdea = "Special Tarot Tests",
            c_uma_testIskIdea2 = "Non-special Tarot Tests"
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
            uma_oguri_hungry="Hungry",
            uma_oguri_full="Full!",
            uma_twin_moon="Moon(s)",
            uma_bakushin1="Bakushin!",
            uma_bakushin2="Bakushinshi-n!",
            uma_bakushin3="Ba-...",
            uma_mult_pot="Potential Mult",
            uma_mambo_chips="More chips!",
            uma_mambo_mult="More Mult!",
            uma_mambo_xmult="More xMult!",
            uma_fuku_good = "Good fortune!",
            uma_fuku_bad = "Bad fortune...",
            uma_not_pure = "Not pure!",
            uma_spread = "Spread!",
            uma_bloom = "Bloom!",
            uma_goldship_no_effect = "No effect currently",
            uma_goldship_effect1 = "Flips and shuffles jokers",
            uma_goldship_effect2 = "Debuff faces cards",
            uma_goldship_effect3 = "Lose $1 per card played",
            uma_goldship_effect4 = "All face cards are drawn face down",
            uma_goldship_effect5 = "Debuff Spades",
            uma_goldship_effect6 = "Debuff Hearts",
            uma_goldship_effect7 = "Debuff Clubs",
            uma_goldship_effect8 = "Debuff Diamonds",

            uma_love_1_1 = "Retriggers all",
            uma_love_1_2 = "debuffs all other cards",
            uma_love_1_3 = "Overwrites certain boss blinds",
            uma_love_2_1 = "A playing card",
            uma_love_2_2 = "that is",
            uma_love_2_3 = "only",
            uma_love_2_4 = "Hearts",
            uma_love_2_5 = "and nothing else",

            uma_love_1_1_obsc = "R%%r%%ge%s a%l",
            uma_love_1_2_obsc = "%%%u%%s %l% %th%% %a%d%",
            uma_love_1_3_obsc = "%%%r%%%te% %er%a%n bo%s bl%n%%",
            uma_love_2_1_obsc = "A pl%%i%g c%r%",
            uma_love_2_2_obsc = "th%% %s",
            uma_love_2_3_obsc = "%n%%",
            uma_love_2_4_obsc = "%e%%%s",
            uma_love_2_5_obsc = "a%% n%%%i%% %ls%",

            b_uma_better_tarot_cards = "Tarot+ Cards",
            k_uma_better_tarot = "Tarot+",
            b_uma_worse_tarot_cards = "Tarot- Cards",
            k_uma_worse_tarot = "Tarot-",
            b_uma_mambo_consumable_cards = "Mambo Cards",
            k_uma_mambo_consumable = "Mambo's things",
            b_uma_planet_cards = "Planet+ Cards",
            k_uma_planet = "Planet+",
            k_uma_twin_turbo = 'Upgrade + Level Up!'
        },

        labels = {
            uma_better_tarot = "Tarot+",
            uma_worse_tarot = "Tarot-"
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