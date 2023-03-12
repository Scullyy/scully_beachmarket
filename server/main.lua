-- https://discord.gg/scully

CreateThread(function()
    for i = 1, #Config.Markets do
        local market = Config.Markets[i]
        local stateBag = ('market%s'):format(i)

        GlobalState[stateBag] = market
    end
end)

local function setMarket(market, set, office)
    local stateBag = ('market%s'):format(market)

    GlobalState[stateBag] = {
        set = set,
        office = office
    }
end
exports('setMarket', setMarket)

RegisterNetEvent('scully_beachmarket:set', function(market, set, office)
    setMarket(market, set, office)
end)

RegisterCommand('setmarket', function(source, args)
    if IsPlayerAceAllowed(source, 'market') then
        local market, set, office = tonumber(args[1]), args[2], args[3]

        if not market or not Config.Markets[market] then return end
        if not set or not Config.Sets[set] then return end
        if not office then office = 'false' end

        office = (office == 'true') or (office == '1')

        setMarket(market, set, office)
    end
end, false)