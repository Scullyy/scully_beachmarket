-- https://discord.gg/scully
local function setMarket(market, set, office)
    TriggerServerEvent('scully_beachmarket:set', market, set, office)
end
exports('setMarket', setMarket)

local function setMarketLocal(coords, set, office)
    local interior = GetInteriorAtCoords(coords.x, coords.y, coords.z)

    if interior == 0 then return end

    for _, name in pairs(Config.Sets) do
        DeactivateInteriorEntitySet(interior, name)
    end

    Wait(100)

    ActivateInteriorEntitySet(interior, Config.Sets[set])

    if office then
        ActivateInteriorEntitySet(interior, 'store_office')
    else
        DeactivateInteriorEntitySet(interior, 'store_office')
    end

    RefreshInterior(interior)
end

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/setmarket', 'Set a market interior.', {
        { name = 'market', help = 'The ID of the market' },
        { name = 'set', help = 'The name of the entity set' },
        { name = 'office', help = 'Office? true or false' }
    })

    for i = 1, #Config.Markets do
        local market = Config.Markets[i]
        local stateBag = ('market%s'):format(i)
        local marketInfo = GlobalState[stateBag]

        setMarketLocal(market.location, marketInfo.set, marketInfo.office)

        AddStateBagChangeHandler(stateBag, nil, function(bagName, key, value, _unused, replicated)
            setMarketLocal(market.location, value.set, value.office)
        end)
    end
end)