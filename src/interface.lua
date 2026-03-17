---@diagnostic disable: undefined-global, undefined-field, param-type-mismatch

function Uma_create_select_card_ui(card, area, extra_data, select_func)
    select_func = select_func or "uma_select"
    extra_data = extra_data or {}
    extra_data.copies = extra_data.copies or 1 
    local t2 =  {n=G.UIT.ROOT, config = {ref_table = card, minw = 0.6, maxw = 1, padding = 0.1, align = 'bm', colour = G.C.GREEN, shadow = true, r = 0.08, minh = 0.3, one_press = true, button = select_func, data = {area, extra_data}, hover = true}, nodes={
        {n=G.UIT.T, config={text = "Select",colour = G.C.WHITE, scale = 0.5}}
    }}

    card.children.select_button = UIBox{
        definition = t2,
        config = {
            align="bm",
            offset = {x=-0,y=-0.15},
            major = card,
            bond = 'Weak',
            parent = card
        }
    }
end

SMODS.uma_card_collection_UIBox = function(_pool, rows, args)
    args = args or {}
    args.w_mod = args.w_mod or 1
    args.h_mod = args.h_mod or 1
    args.card_scale = args.card_scale or 1
    local deck_tables = {}
    local pool = SMODS.collection_pool(_pool)
    if args.sort then args.sort(pool) end

    G.your_collection = {}
    local cards_per_page = 0
    local row_totals = {}
    for j = 1, #rows do
        if cards_per_page >= #pool and args.collapse_single_page then
            rows[j] = nil
        else
            row_totals[j] = cards_per_page
            cards_per_page = cards_per_page + rows[j]
            G.your_collection[j] = CardArea(
                G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
                (args.w_mod*rows[j]+0.25)*G.CARD_W,
                args.h_mod*G.CARD_H, 
                {card_limit = rows[j], type = args.area_type or 'title', highlight_limit = 0, collection = true}
            )
            table.insert(deck_tables,
            {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
                {n=G.UIT.O, config={object = G.your_collection[j]}}
            }})
        end
    end

    local options = {}
    for i = 1, math.ceil(#pool/cards_per_page) do
        table.insert(options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#pool/cards_per_page)))
    end

    G.FUNCS.SMODS_card_collection_page = function(e)
        if not e or not e.cycle_config then return end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
            local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
            c:remove()
            c = nil
            end
        end
        for j = 1, #rows do
            for i = 1, rows[j] do
            local index = i+row_totals[j] + (cards_per_page*(e.cycle_config.current_option - 1))
            local center = pool[index]
            if not center then break end
            local card = args.from_area and copy_card(center) or Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W*args.card_scale, G.CARD_H*args.card_scale, G.P_CARDS.empty, (args.center and G.P_CENTERS[args.center]) or center)

            -- Re-adds negative to preview if it was stripped by the mod
            if center.edition and center.edition.negative and not All_in_Jest.config.no_copy_neg then
                card:set_edition({negative = true}, nil, true)
            end

            if args.modify_card then args.modify_card(card, center, i, j, pool, index) end
            if not args.no_materialize then card:start_materialize(nil, i>1 or j>1) end
            G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end

    G.FUNCS.SMODS_card_collection_page{ cycle_config = { current_option = 1 }}

    local t =  create_UIBox_generic_options({ back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or 'your_collection', snap_back = args.snap_back, infotip = args.infotip, no_back = true, contents = {
        {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
        (not args.hide_single_page or cards_per_page < #pool) and {n=G.UIT.R, config={align = "cm"}, nodes={
            create_option_cycle({options = options, w = 4.5, cycle_shoulders = true, opt_callback = 'SMODS_card_collection_page', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
        }} or nil,
        }})
    return t
end

G.FUNCS.uma_select = function(e)
    local c1 = e.config.ref_table
    if c1 and c1:is(Card) then
        local card_was_banned = false
        if G.GAME.banned_keys[c1.config.center_key] then
            card_was_banned = true
            -- If card was banned by an All in Jest joker, unban it temporarially
            if type(G.GAME.banned_keys[c1.config.center_key]) == "string" and G.GAME.banned_keys[c1.config.center_key]:sub(1, 5) == "j_aij" then
                card_was_banned = G.GAME.banned_keys[c1.config.center_key]
                G.GAME.banned_keys[c1.config.center_key] = nil
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                local c_to_remove = nil
                if G.GAME.banned_keys[c1.config.center_key] then
                    return true
                end
                if e.config.data[2].remove_orginal and e.config.data[2].index then
                  c_to_remove = e.config.data[2].remove_orginal[e.config.data[2].index]
                end
                G.SETTINGS.paused = false
                if e.config.data[2].copies and e.config.data[2].copies > 1 then
                    for i = 1, e.config.data[2].copies do
                        local card = SMODS.add_card {
                            key = c1.config.center_key,
                            area = e.config.data[1]
                        }
                        card = copy_card(c1, card)
                        card:add_to_deck()
                        if c1.edition and c1.edition.negative then
                            card:set_edition({negative = true}, true)
                        end
                        if (not card.edition or (card.edition and not card.edition.negative)) and e.config.data[1] == G.consumeables then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                        end
                        if e.config.data[2].playing_card == true then
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            card.playing_card = G.playing_card
                            table.insert(G.playing_cards, card)
                        end
                        if e.config.data[2].insert_index and e.config.data[2].insert_index > 0 then
                            local item = table.remove(e.config.data[1], 1)
                            table.insert(e.config.data[1], e.config.data[2].insert_index, item)
                        end
                    end
                else
                    local card = SMODS.add_card {
                        key = c1.config.center_key,
                        area = e.config.data[1]
                    }
                    card = copy_card(c1, card)
                    card:add_to_deck()
                    if c1.edition and c1.edition.negative then
                        card:set_edition({negative = true}, true)
                    end
                    if (not card.edition or (card.edition and not card.edition.negative)) and e.config.data[1] == G.consumeables then
                        G.GAME.consumeable_buffer = 0
                    end
                    if e.config.data[2].playing_card == true then
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        card.playing_card = G.playing_card
                        table.insert(G.playing_cards, card)
                    end
                    if e.config.data[2].insert_index and e.config.data[2].insert_index > 0 then
                        local item = table.remove(e.config.data[1].cards, 1)
                        table.insert(e.config.data[1].cards, e.config.data[2].insert_index, item)
                    end
                end
                if c_to_remove then
                    c_to_remove:remove()
                    c_to_remove = nil
                end
                if G.OVERLAY_MENU ~= nil then
                    G.OVERLAY_MENU:remove()
                    G.OVERLAY_MENU = nil
                end

                G.E_MANAGER:add_event(Event({
                    func = function()
                        if card_was_banned then
                            G.GAME.banned_keys[c1.config.center_key] = card_was_banned
                        end
                      return true
                    end
                }))
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, #G.GAME.tags do
                    if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then
                        break
                    end
                end
                return true
            end
        }))
    end
end