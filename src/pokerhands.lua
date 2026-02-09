SMODS.PokerHand {
    key = "PPair",
    mult = 10,
    chips = 100,
    l_mult = 3,
    l_chips = 35,
    example = {
        { 'S_K', true },
        { 'S_K', true },
        { 'C_6', false },
        { 'D_9', true },
        { 'D_9', true }
    },
    evaluate = function(parts, hand)
        return parts._2
    end
}




--[[
S = spades
D = Diamonds
H = Hearts
C = Clubs





]]--