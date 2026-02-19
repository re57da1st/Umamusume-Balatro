--Check into weird triggers
SMODS.PokerHand {
    key = "perfect_pair",
    visible = true,
    mult = 10,
    chips = 100,
    l_mult = 3,
    l_chips = 35,
    example = {
        { 'C_K', true },
        { 'C_K', true },
        { 'D_6', false },
        { 'C_9', true },
        { 'C_9', true }
    },
    evaluate = function(parts, hand)
        if #parts._2 < 2 then return nil end

        local ret = {}
        local suits = SMODS.Suit.obj_buffer
        if #hand < 4 then return ret else
            for j = 1, #suits do
                local t = {}
---@diagnostic disable-next-line: need-check-nil
                local suit = suits[j]
                local flush_count = 0
                for i=1, #hand do
                    if hand[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = hand[i] end 
                end
                if flush_count >= 4 then
                    table.insert(ret, t)
                    return parts._all_pairs
                end
            end
            return {}
        end
    end
}