function uma_random_card2(area)
    if not area then area = G.playing_cards end
    print(#area)

    if #area ~= 0 then

        local rng = pseudorandom("uma_random_card", 1, #area)
        local card = area[rng]

        print(card.ability)

        if area == G.uma_slot_backlog then
            table.remove(area, rng)
        end

        local returning_card = {
            rank = card.config.card.value,
            suit = card.config.card.suit,
            key = card.config.center_key
        }

        if card.edition then
            returning_card.edition = card.edition.key
        end

        if card.seal then
            returning_card.seal = card.seal
        end

        return returning_card

    else
        return {uma_empty_area = true}
    end
end

uma_reload_slots()

uma_AddSlot(   uma_random_card2(G.uma_slot_backlog)   , 1, 0)
uma_AddSlot(   uma_random_card2(G.uma_slot_backlog)   , 2, 1)
uma_AddSlot(   uma_random_card2(G.uma_slot_backlog)   , 3, 1)