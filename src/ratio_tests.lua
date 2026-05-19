local uma_list = {
    "j_uma_helios",
    "j_uma_daiwa",
    "j_uma_agnes",
    "j_uma_turbo",
    "j_uma_goldship",
    "j_uma_oguri",
    "j_uma_bakushin",
    "j_uma_mambo",
    "j_uma_chiyono",
    "j_uma_norn",
    "j_uma_obey",
    "j_uma_fuku",
    "j_uma_love",
    "j_uma_vodka",
    "j_uma_teio",
    "j_uma_haru",
    "j_uma_lilac",
    "j_uma_neo",
    "j_uma_mini",
    "j_uma_maruzensky",
    "j_uma_ebeyan",
    "j_uma_vivlos",
    "j_uma_tact",
    "j_uma_doto",
    "j_uma_opera",
    "j_uma_aruvu",
    "j_uma_belno",
    "j_uma_tachyon",
    "j_uma_XYZ",
    "j_uma_festa",
    "j_uma_dober",
    "j_uma_creek",
    "j_uma_air",
    "j_uma_nature",
    "j_uma_rudolf",
    "j_uma_tamamo",
    "j_uma_bourbon",
    "j_uma_mayano",
    "j_uma_g_city",
    "j_uma_rickey",
    "j_uma_almond",
    "j_uma_donna",
    "j_uma_transcend",
}

function getUmaData(horse)
    local name = G.P_CENTERS[horse].key
    local r1 = G.P_CENTERS[horse].config.extra.race.r1
    local r2 = G.P_CENTERS[horse].config.extra.race.r2
    local r3 = G.P_CENTERS[horse].config.extra.race.r3
    local rt = G.P_CENTERS[horse].config.extra.race.rt
    return name, r1, r2, r3, rt
end

function UmaRatio(numerator, denominator)
    return (math.floor(((numerator)/denominator)*10000)/100)
end

local name, r1, r2, r3, rt = getUmaData("j_uma_donna")
local donnaRatio = UmaRatio(r1+r2,rt)

local pass, fail = 0, 0
for i = 1, #uma_list do
    if G.P_CENTERS[uma_list[i]].config.extra.race then
        local name, r1, r2, r3, rt = getUmaData(uma_list[i])
        local testRatio = UmaRatio(r1+r2,rt)
        if testRatio >= donnaRatio then
            pass = pass + 1
        else 
            fail = fail + 1
        end

        print(name..": "..testRatio.."% "..((testRatio > donnaRatio) and "Passed" or ((donnaRatio > testRatio) and "" or "==")))
    end
end

print("Passes: "..pass.. " Fails: "..fail)