local QBCore = exports['qb-core']:GetCoreObject()
local playerJob = nil
local garbageVehicle = nil
local hasBag = false
local currentStop = 0
local deliveryBlip = nil
local amountOfBags = 0
local garbageObject = nil
local endBlip = nil
local garbageBlip = nil
local canTakeBag = true
local currentStopNum = 0
local PZone = nil
local listen = false

-- Handlers

local function setupClient()
    garbageVehicle = nil
    hasBag = false
    currentStop = 0
    deliveryBlip = nil
    amountOfBags = 0
    garbageObject = nil
    endBlip = nil
    currentStopNum = 0
    if playerJob.name == "garbage" then
        garbageBlip = AddBlipForCoord(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)
        SetBlipSprite(garbageBlip, 318)
        SetBlipDisplay(garbageBlip, 4)
        SetBlipScale(garbageBlip, 1.0)
        SetBlipAsShortRange(garbageBlip, true)
        SetBlipColour(garbageBlip, 39)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
        EndTextCommandSetBlipName(garbageBlip)
    end
end

-- Functions

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function DrawText3D2(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x,coords.y,coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function LoadAnimation(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do Wait(10) end
end

local function BringBackCar()
    DeleteVehicle(garbageVehicle)
    if endBlip ~= nil then
        RemoveBlip(endBlip)
    end
    if deliveryBlip ~= nil then
        RemoveBlip(deliveryBlip)
    end
    garbageVehicle = nil
    hasBag = false
    currentStop = 0
    deliveryBlip = nil
    amountOfBags = 0
    garbageObject = nil
    endBlip = nil
    currentStopNum = 0
end

local function SetRouteBack()
    local inleverpunt = Config.Locations["vehicle"]
    endBlip = AddBlipForCoord(inleverpunt.coords.x, inleverpunt.coords.y, inleverpunt.coords.z)
    SetBlipSprite(endBlip, 1)
    SetBlipDisplay(endBlip, 2)
    SetBlipScale(endBlip, 1.0)
    SetBlipAsShortRange(endBlip, false)
    SetBlipColour(endBlip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["vehicle"].name)
    EndTextCommandSetBlipName(endBlip)
    SetBlipRoute(endBlip, true)
end

local function AnimCheck()
    CreateThread(function()
        while hasBag do
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 3) then
                ClearPedTasksImmediately(ped)
                LoadAnimation('missfbi4prepp1')
                TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
            end
            Wait(200)
        end
    end)
end

local function TakeAnim()
    local ped = PlayerPedId()
    LoadAnimation('missfbi4prepp1')
    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
    garbageObject = CreateObject(`prop_cs_rub_binbag_01`, 0, 0, 0, true, true, true)
    AttachEntityToEntity(garbageObject, ped, GetPedBoneIndex(ped, 57005), 0.12, 0.0, -0.05, 220.0, 120.0, 0.0, true, true, false, true, 1, true)
    AnimCheck()
end

local function DeliverAnim()
    local ped = PlayerPedId()
    LoadAnimation('missfbi4prepp1')
    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_throw_garbage_man', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, GetEntityHeading(garbageVehicle))
    canTakeBag = false
    SetTimeout(1250, function()
        DetachEntity(garbageObject, 1, false)
        DeleteObject(garbageObject)
        TaskPlayAnim(ped, 'missfbi4prepp1', 'exit', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
        FreezeEntityPosition(ped, false)
        garbageObject = nil
        canTakeBag = true
    end)
end

local function RunWorkLoop()
    CreateThread(function()
        local GarbText = false
        while listen do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local DeliveryData = Config.Locations["trashcan"][currentStop]
            local Distance = #(pos - vector3(DeliveryData.coords.x, DeliveryData.coords.y, DeliveryData.coords.z))
            if Distance < 15 or hasBag then
                LoadAnimation('missfbi4prepp1')
                DrawMarker(2, DeliveryData.coords.x, DeliveryData.coords.y, DeliveryData.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 55, 22, 255, false, false, false, false, false, false, false)

                if not hasBag and canTakeBag then
                    if Distance < 1.5 then
                        if not GarbText then
                            GarbText = true
                            exports['qb-core']:DrawText(Lang:t("info.grab_garbage"), 'left')
                        end
                        if IsControlJustPressed(0, 51) then
                            hasBag = true
                            exports['qb-core']:HideText()
                            TakeAnim()
                        end
                    elseif Distance < 10 then
                        if GarbText then
                            GarbText = false
                            exports['qb-core']:HideText()
                        end
                        DrawText3D2(DeliveryData.coords, Lang:t("info.stand_grab_garbage"))
                    end
                else
                    if DoesEntityExist(garbageVehicle) then
                        local Coords = GetOffsetFromEntityInWorldCoords(garbageVehicle, 0.0, -4.5, 0.0)
                        local TruckDist = #(pos - Coords)
                        local TrucText = false

                        if Distance < 10 then
                            DrawText3D2(DeliveryData.coords, Lang:t("info.garbage_in_truck"))
                        end

                        if TruckDist < 2 then
                            if not TrucText then
                                TrucText = true
                                exports['qb-core']:DrawText(Lang:t("info.dispose_garbage"), 'left')
                            end
                            if IsControlJustPressed(0, 51) and hasBag then
                                QBCore.Functions.Progressbar("deliverbag", Lang:t("info.progressbar"), 2000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {}, {}, {}, function() -- Done
                                    hasBag = false
                                    -- Looks if you have delivered all bags
                                    if (amountOfBags - 1) <= 0 then
                                        QBCore.Functions.TriggerCallback('garbagejob:server:NextStop', function(hasMoreStops, nextStop, newBagAmount)
                                            if hasMoreStops and nextStop ~= 0 then
                                                -- Here he puts your next location and you are not finished working yet.
                                                currentStop = nextStop
                                                currentStopNum = currentStopNum + 1
                                                amountOfBags = newBagAmount
                                                SetGarbageRoute()
                                                QBCore.Functions.Notify(Lang:t("info.all_bags"))
                                                listen = false
                                            else
                                                if hasMoreStops and nextStop == currentStop then
                                                    QBCore.Functions.Notify(Lang:t("info.depot_issue"))
                                                    amountOfBags = 0
                                                else
                                                    -- You are done with work here.
                                                    QBCore.Functions.Notify(Lang:t("info.done_working"))
                                                    RemoveBlip(deliveryBlip)
                                                    SetRouteBack()
                                                    amountOfBags = 0
                                                    listen = false
                                                end
                                            end
                                        end, currentStop, currentStopNum, pos)
                                        hasBag = false
                                    else
                                        -- You haven't delivered all bags here
                                        amountOfBags = amountOfBags - 1
                                        if amountOfBags > 1 then
                                            QBCore.Functions.Notify(Lang:t("info.bags_left", {value = amountOfBags}))
                                        else
                                            QBCore.Functions.Notify(Lang:t("info.bags_still", {value = amountOfBags}))
                                        end
                                        hasBag = false
                                    end

                                    DeliverAnim()
                                    Wait(1500)
                                    if TrucText then
                                        exports['qb-core']:HideText()
                                        TrucText = false
                                    end
                                end, function() -- Cancel
                                    QBCore.Functions.Notify(Lang:t("error.cancled"), "error")
                                end)

                            end
                        elseif TruckDist < 10 then
                            DrawText3D(Coords.x, Coords.y, Coords.z, Lang:t("info.stand_here"))
                        end
                    else
                        QBCore.Functions.Notify(Lang:t("error.no_truck"), "error")
                        DeliverAnim()
                        hasBag = false
                    end
                end
            end
            Wait(1)
        end
    end)
end

local function CreateZone(x, y, z)
    CreateThread(function()
        PZone = CircleZone:Create(vector3(x, y, z), 15.0, {
            name = "NewRouteWhoDis",
            debugPoly = false,
        })
        
        PZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                listen = true
                RunWorkLoop()
            else
                exports['qb-core']:HideText()
                listen = false
            end
        end)
    end)
end

local function DeleteZone()
    listen = false
    PZone:destroy()
end

function SetGarbageRoute()
    local CurrentLocation = Config.Locations["trashcan"][currentStop]
    if deliveryBlip ~= nil then
        RemoveBlip(deliveryBlip)
    end
    deliveryBlip = AddBlipForCoord(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipDisplay(deliveryBlip, 2)
    SetBlipScale(deliveryBlip, 1.0)
    SetBlipAsShortRange(deliveryBlip, false)
    SetBlipColour(deliveryBlip, 27)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["trashcan"][currentStop].name)
    EndTextCommandSetBlipName(deliveryBlip)
    SetBlipRoute(deliveryBlip, true)

    if PZone then
        DeleteZone()
        Wait(500)
        CreateZone(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    else
        CreateZone(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    end
end

local ControlListen = false
local function Listen4Control()
    ControlListen = true
    CreateThread(function()
        while ControlListen do
            if IsControlJustReleased(0, 38) then
                TriggerEvent("qb-garbagejob:client:MainMenu")
            end
            Wait(1)
        end
    end)
end

local pedsSpawned = false
local function spawnPeds()
    if not Config.Peds or not next(Config.Peds) or pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        current.model = type(current.model) == 'string' and GetHashKey(current.model) or current.model
        RequestModel(current.model)
        while not HasModelLoaded(current.model) do
            Wait(0)
        end
        local ped = CreatePed(0, current.model, current.coords, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        current.pedHandle = ped

        if Config.UseTarget then
            exports['qb-target']:AddTargetEntity(ped, {
                options = {
                    {
                        type = "client",
                        event = "qb-garbagejob:client:MainMenu",
                        label = 'Talk to Garbageman',
                        icon = 'fa-solid fa-recycle',
                        job = "garbage",
                    }
                },
                distance = 2.0
            })
        else
            local options = current.zoneOptions
            if options then
                local zone = BoxZone:Create(current.coords.xyz, options.length, options.width, {
                    name = "zone_cityhall_"..ped,
                    heading = current.coords.w,
                    debugPoly = false
                })
                zone:onPlayerInOut(function(inside)
                    if LocalPlayer.state.isLoggedIn then
                        if inside then
                            exports['qb-core']:DrawText("[E] Talk to Garbage Man", 'left')
                            Listen4Control()
                        else
                            ControlListen = false
                            exports['qb-core']:HideText()
                        end
                    end
                end)
            end
        end
    end
    pedsSpawned = true
end

local function deletePeds()
    if not Config.Peds or not next(Config.Peds) or not pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        if current.pedHandle then
            DeletePed(current.pedHandle)
        end
    end
end

-- Events

RegisterNetEvent('garbagejob:client:SetWaypointHome', function()
    SetNewWaypoint(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y)
end)

RegisterNetEvent('qb-garbagejob:client:RequestRoute', function()
    QBCore.Functions.TriggerCallback('garbagejob:server:NewShift', function(shouldContinue, firstStop, totalBags)
        if shouldContinue then

            local coords = Config.Locations["vehicle"].coords
            QBCore.Functions.SpawnVehicle("trash2", function(veh)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- hopefully this fixes an issue if something is delayed they'll get crushed
                SetVehicleEngineOn(veh, true, true)

                garbageVehicle = veh
                SetVehicleNumberPlateText(veh, "GARB"..tostring(math.random(1000, 9999)))
                SetEntityHeading(veh, coords.w)
                exports['LegacyFuel']:SetFuel(veh, 100.0)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                currentStop = firstStop
                currentStopNum = 1
                amountOfBags = totalBags
                SetGarbageRoute()
                QBCore.Functions.Notify(Lang:t("info.deposit_paid", {value = Config.TruckPrice}))
                QBCore.Functions.Notify(Lang:t("info.started"))
            end, coords, true)
        else
            QBCore.Functions.Notify(Lang:t("info.not_enough", {value = Config.TruckPrice}))
        end
    end)
end)

RegisterNetEvent('qb-garbagejob:client:RequestPaycheck', function()
    if garbageVehicle then
        BringBackCar()
        QBCore.Functions.Notify(Lang:t("info.truck_returned"))
    end

    TriggerServerEvent('garbagejob:server:PayShift')
end)

RegisterNetEvent('qb-garbagejob:client:MainMenu', function()
    local MainMenu = {
        {
            isMenuHeader = true,
            header = "Garbage Main Menu"
        },
        {
            header = "Collect Paycheck",
            txt = "Return truck and collect paycheck here!",
            params = {
                event = 'qb-garbagejob:client:RequestPaycheck',
            }
        },
        {
            header = "Request Route",
            txt = "Request a garbage Route",
            params = {
                event = 'qb-garbagejob:client:RequestRoute',
            }
        }
    }

    exports['qb-menu']:openMenu(MainMenu)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    playerJob = QBCore.Functions.GetPlayerData().job
    setupClient()
    deletePeds()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    playerJob = JobInfo
    if playerJob.name == "garbage" then
        if garbageBlip ~= nil then
            RemoveBlip(garbageBlip)
        end
    end
    setupClient()
    spawnPeds()
end)

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        if garbageObject ~= nil then
            DeleteEntity(garbageObject)
            garbageObject = nil
        end
        deletePeds()
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        playerJob = QBCore.Functions.GetPlayerData().job
        setupClient()
        spawnPeds()
    end
end)
