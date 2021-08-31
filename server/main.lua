local Bail = {}
local Routes = {}


QBCore.Functions.CreateCallback("garbagejob:server:NewShift", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid
    local shouldContinue = false
    local nextStop = 0
    local totalNumberOfStops = 0
    local bagNum = 0

    if Player.Functions.RemoveMoney("bank", Config.TruckPrice, "garbo-truck-dep") then
        math.randomseed(os.time())
        local MaxStops = math.random(Config.MinStops, #Config.Locations["trashcan"])
        local allStops = {}

        for i=1, MaxStops do
            local stop = math.random(1,#Config.Locations["trashcan"])
            local newBagAmount = math.random(Config.MinBagsPerStop, Config.MaxBagsPerStop)
            allStops[#allStops+1] = {stop = stop, bags = newBagAmount}
        end

        Routes[CitizenId] = {
            stops = allStops,
            currentStop = 1,
            started = true,
            currentDistance = 0,
            depositPay = Config.TruckPrice,
            actualPay = 0,
            stopsCompleted = 0,
        }

        nextStop = allStops[1].stop
        shouldContinue = true
        totalNumberOfStops = #allStops
        bagNum = allStops[1].bags
    else
        TriggerClientEvent('QBCore:Notify', source, 'Not Enough Money ('..Config.TruckPrice..' required)', "error")
    end
    cb(shouldContinue, nextStop, bagNum, totalNumberOfStops)
end)


QBCore.Functions.CreateCallback("garbagejob:server:NextStop", function(source, cb, currentStop, currentStopNum, currLocation)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    local currStopCoords = Config.Locations["trashcan"][currentStop].coords
    currStopCoords = vector3(currStopCoords.x, currStopCoords.y, currStopCoords.z)

    local distance = #(currLocation - currStopCoords)
    local newStop = 0
    local shouldContinue = false
    local newBagAmount = 0

    if(math.random(100) >= Config.CryptoStickChance) and Config.GiveCryptoStick then
        Player.Functions.AddItem("cryptostick", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["cryptostick"], 'add')
        TriggerClientEvent('QBCore:Notify', source, "You found a cryptostick on the floor")
    end

    if distance <= 10 then
        if currentStopNum >= #Routes[CitizenId].stops then
            Routes[CitizenId].stopsCompleted = Routes[CitizenId].stopsCompleted + 1
            newStop = currentStop
        else
            newStop = Routes[CitizenId].stops[currentStopNum+1].stop
            newBagAmount = Routes[CitizenId].stops[currentStopNum+1].bags
            shouldContinue = true
            local bagAmount = Routes[CitizenId].stops[currentStopNum].bags
            local totalNewPay = 0

            for i = 1, bagAmount do
                totalNewPay = totalNewPay + math.random(Config.BagLowerWorth, Config.BagUpperWorth)
            end

            Routes[CitizenId].actualPay = math.ceil(Routes[CitizenId].actualPay + totalNewPay)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'You are too far away from the dropoff point', "error")
    end

    cb(shouldContinue,newStop,newBagAmount)
end)

QBCore.Functions.CreateCallback('garbagejob:server:EndShift', function(source, cb, location)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid
    local distance = #(location - vector3(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z))

    if(distance < 10) then
        if Routes[CitizenId] ~= nil then
            Player.Functions.AddMoney("bank",Routes[CitizenId].depositPay, "garbage-deposit-back")
            cb(true)
        else
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'You are too far away from the dropoff point', "error")
        cb(false)
    end
end)

RegisterServerEvent('garbagejob:server:PayShift')
AddEventHandler('garbagejob:server:PayShift', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid

    if Routes[CitizenId] ~= nil then
        Player.Functions.AddMoney("bank", Routes[CitizenId].actualPay , 'garbage-payslip')
        TriggerClientEvent('QBCore:Notify', src, "You have $"..Routes[CitizenId].actualPay..", your payslip got paid to your bank account!", "success")
        Routes[CitizenId] = nil
    else
        TriggerClientEvent('QBCore:Notify', source, 'You never clocked on!', "error")
    end
end)