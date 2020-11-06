CF = nil
fishing = false
processing = false
firstspawn = false
Citizen.CreateThread(function()
	while CF == nil do 
        Citizen.Wait(0)
        TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)
    end
    
end)

local impacts = 0
harvestlocations = {
        { ['x'] = -1850.57,  ['y'] = -1250.03,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1849.1,  ['y'] = -1251.2,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1843.93,  ['y'] = -1255.76,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1840.62,  ['y'] = -1258.51,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1836.69,  ['y'] = -1261.81,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1833.79,  ['y'] = -1264.25,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1828.26,  ['y'] = -1268.89,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1856.57,  ['y'] = -1245.1,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1860.9,  ['y'] = -1241.5,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1864.88,  ['y'] = -1238.21,  ['z'] = 8.62, ['h'] = 139.04},
        { ['x'] = -1823.8,  ['y'] = -1267.43,  ['z'] = 8.62, ['h'] = 240.6},
        { ['x'] = -1862.63,  ['y'] = -1234.03,  ['z'] = 8.62, ['h'] = 54.12},
        { ['x'] = -3428.06,  ['y'] = 967.39,  ['z'] = 8.62, ['h'] = 89.24},
        { ['x'] = -3428.36,  ['y'] = 963.93,  ['z'] = 8.62, ['h'] = 88.66},
        { ['x'] = -3428.43,  ['y'] = 959.79,  ['z'] = 8.62, ['h'] = 89.24},
        { ['x'] = -3428.35,  ['y'] = 975.02,  ['z'] = 8.62, ['h'] = 79.77},
        { ['x'] = -1613.36,  ['y'] = 5262.24,  ['z'] = 3.97, ['h'] = 34.47},
        { ['x'] = -278.93,  ['y'] = 6637.08,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -280.79,  ['y'] = 6635.07,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -282.95,  ['y'] = 6632.84,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -284.64,  ['y'] = 6631.51,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -286.64,  ['y'] = 6629.51,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -276.91,  ['y'] = 6638.79,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -274.33,  ['y'] = 6641.92,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -271.34,  ['y'] = 6644.46,  ['z'] = 7.54, ['h'] = 46.7},
        { ['x'] = -285.26,  ['y'] = 6627.13,  ['z'] = 7.54, ['h'] = 136.05},
        { ['x'] = 1573.11,  ['y'] = 3912.51,  ['z'] = 31.1, ['h'] = 343.31},
        { ['x'] = 1577.47,  ['y'] = 3911.11,  ['z'] = 31.1, ['h'] = 351.65},
        { ['x'] = 1581.46,  ['y'] = 3910.04,  ['z'] = 31.1, ['h'] = 351.65},
}
refineloc = {
    { ['x'] = 860.86,  ['y'] = -2364.69,  ['z'] = 30.35, ['h'] = 182.88},
    { ['x'] = 859.05,  ['y'] = -2364.33,  ['z'] = 30.35, ['h'] = 182.88},
    { ['x'] = 846.39,  ['y'] = -2363.52,  ['z'] = 30.35, ['h'] = 182.88},
    { ['x'] = 843.51,  ['y'] = -2363.48,  ['z'] = 30.35, ['h'] = 182.88},
    { ['x'] = 871.82,  ['y'] = -2365.45,  ['z'] = 30.35, ['h'] = 182.88},
    { ['x'] = 869.23,  ['y'] = -2365.62,  ['z'] = 30.35, ['h'] = 182.88},
}


sellloc = {
    { ['x'] = 32.07,  ['y'] = -902.62,  ['z'] = 28.99, ['h'] = 0, ['t'] = "I"},
    { ['x'] = -1320.95,  ['y'] = -1263.89,  ['z'] = 3.59, ['h'] = 282.22, ['t'] = "F"},
    { ['x'] = -213.11,  ['y'] = 6358.7,  ['z'] = 30.49, ['h'] = 43.13, ['t'] = "F"},
    { ['x'] = -13.74,  ['y'] = 6480.74,  ['z'] = 30.42, ['h'] = 230.93, ['t'] = "I"},
}
bliploc = {
    {title="Fishing", x = -1842.99,  y = -1248.1,  z = 8.62, TY = 404, CL = 3},
    {title="Fishing", x = -3425.38,  y = 968.21,  z = 8.62, TY = 404, CL = 3},
    {title="Fishing", x = -256.58,  y = 6616.88,  z = 7.48, TY = 404, CL = 3},
    {title="Ink Processing", x = 856.97,  y = -2352.35,  z = 30.33, TY = 365, CL = 3},
    {title="Ink Sell", x = 32.76,  y = -901.15,  z = 29.97, TY = 272, CL = 3},
    {title="Fish Sell", x = -1320.95,  y = -1263.89,  z = 3.59, TY = 272, CL = 3},
    {title="Fish Sell", x = -213.11,  y = 6358.7,  z = 30.49, TY = 272, CL = 3},
    {title="Ink Sell", x = -13.74,  y = 6480.74,  z = 30.42, TY = 272, CL = 3},
}

--272

Citizen.CreateThread(function()

    for _, info in pairs(bliploc) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.TY)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.CL)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100 
    SetTextScale(0.35, 0.35)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()   
end

function process()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    remeltingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("esx_lumberjack:timer")
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    processing = false
    
end

Citizen.CreateThread(function()
    while true do
    local ped = PlayerPedId()
        Citizen.Wait(1)
            for i=1, #harvestlocations, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), harvestlocations[i].x, harvestlocations[i].y, harvestlocations[i].z, true) < 25 and fishing == false then
                DrawMarker(20, harvestlocations[i].x, harvestlocations[i].y, harvestlocations[i].z, 0, 0, 0, 0, 0, harvestlocations[i].h, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), harvestlocations[i].x, harvestlocations[i].y, harvestlocations[i].z, true) < 1 then
                        Draw3DText( harvestlocations[i].x, harvestlocations[i].y, harvestlocations[i].z+0.5 -1.400, ('Press ~r~E ~w~to start fishing'), 4, 0.1, 0.1)
                            if IsControlJustReleased(1, 51) then
                                Animation(harvestlocations[i].h)
                            end
                        end
                        
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    local ped = PlayerPedId()
        Citizen.Wait(1)
            for i=1, #refineloc, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), refineloc[i].x, refineloc[i].y, refineloc[i].z, true) < 25 and processing == false then
                DrawMarker(20, refineloc[i].x, refineloc[i].y, refineloc[i].z, 0, 0, 0, 0, 0, refineloc[i].h, 1.0, 1.0, 1.0, 255, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), refineloc[i].x, refineloc[i].y, refineloc[i].z, true) < 1 then
                        Draw3DText( refineloc[i].x, refineloc[i].y, refineloc[i].z+0.5 -1.400, ('Press ~r~E ~w~to start processing'), 4, 0.1, 0.1)
                            if IsControlJustReleased(1, 51) then
                                local item = CF.GetInventory()['squid']
                                local item2 = CF.GetInventory()['ink']
                                if item.count >= 2 and item2.count ~= 10 then
                                    process()
                                    TriggerServerEvent('process', item,item2)
                                    
                                else
                                    if item.count <= 1 then
                                        CF.ShowNotification('You do not have enough ~b~Squid.')
                                    else
                                        CF.ShowNotification('You do not have enough room for ~b~Ink.') 
                                    end
                                    processing = false
                                end
                            end
                        end
                        
            end
        end
    end
end)

function Animation(heading)
    Citizen.CreateThread(function()
        local h = heading
        local item = CF.GetInventory()['cod']
        local item1 = CF.GetInventory()['bass']
        local item2 = CF.GetInventory()['squid']
        local item3 = CF.GetInventory()['carp']
        local item4 = CF.GetInventory()['salmon']
        local item5 = CF.GetInventory()['talapia']
        local item6 = CF.GetInventory()['tuna']
        local item7 = CF.GetInventory()['catfish']
        local item8 = CF.GetInventory()['mackerel']
        local item9 = CF.GetInventory()['swordfish']
            if item.count ~=20 or item2.count ~=20 or item3.count ~=20 or item4.count ~=20 or item5.count ~=20  or item6.count ~=20 or item7.count ~=20  or item8.count ~=20 or item9.count ~=20 then
                while impacts < 5 do
                    Citizen.Wait(1)
                    fishing = true
                local ped = PlayerPedId()	
                        RequestAnimDict("amb@lo_res_idles@")
                        Citizen.Wait(100)
                        TaskPlayAnim((ped), 'amb@lo_res_idles@', 'world_human_stand_fishing_lo_res_base', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        SetEntityHeading(ped, h)
                        if impacts == 0 then
                            pickaxe = CreateObject(GetHashKey("prop_fishing_rod_01"), 0, 0, 0, true, true, true) 
                            AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.0, -0.0, -40.0, -70.0, 0.0, true, true, false, true, 1, true)
                        end  
                        Citizen.Wait(2500)
                        impacts = impacts+1
                        if impacts == 5 then
                            DetachEntity(pickaxe, 1, true)
                            DeleteEntity(pickaxe)
                            DeleteObject(pickaxe)
                            fishing = false
                            impacts = 0
                            
                            TriggerEvent("Fishing:ChoosItem")
                            break
                        end           
                end
            else
            TriggerServerEvent("CF_Fishing:TMFish")
            fishing = false
            end
    end)
end

RegisterNetEvent('Fishing:ChoosItem')
AddEventHandler('Fishing:ChoosItem', function()
    local item = CF.GetInventory()['cod']
    local item1 = CF.GetInventory()['bass']
    local item2 = CF.GetInventory()['squid']
    local item3 = CF.GetInventory()['carp']
    local item4 = CF.GetInventory()['salmon']
    local item5 = CF.GetInventory()['talapia']
    local item6 = CF.GetInventory()['tuna']
    local item7 = CF.GetInventory()['catfish']
    local item8 = CF.GetInventory()['mackerel']
    local item9 = CF.GetInventory()['swordfish']
    local randomChance = math.random(1, 100)
    print(randomChance)
    if randomChance <= 71 then 
        CF.ShowNotification('You caught ~r~Nothing')
    else
        if randomChance >=75 and randomChance <= 77 then
            if item.count ==20 then
            -- trigger add cod
                CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~cod')
                TriggerServerEvent("CF_Fishing:Catch",'cod')
            end
        elseif randomChance >=78 and randomChance <= 80 then
            if item1.count ==20 then 
            -- trigger add bass
                CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~bass')
                TriggerServerEvent("CF_Fishing:Catch",'bass')
            end
        elseif randomChance >=81 and randomChance <= 83 then
            if item2.count ==20 then 
                -- trigger add squi
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~squid')
                TriggerServerEvent("CF_Fishing:Catch",'squid')
            end
        elseif randomChance >=84 and randomChance <= 86 then
            if item3.count ==20 then 
                -- trigger add carp
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~carp')
                TriggerServerEvent("CF_Fishing:Catch",'carp')
            end
        elseif randomChance >=87 and randomChance <= 89 then
            if item4.count ==20 then 
                -- trigger add salm
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~salmon')
                TriggerServerEvent("CF_Fishing:Catch",'salmon')
            end
        elseif randomChance >=90 and randomChance <= 92 then
            if item5.count ==20 then 
                -- trigger add tala
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~talapia')
                TriggerServerEvent("CF_Fishing:Catch",'talapia')
            end
        elseif randomChance >=93 and randomChance <= 95 then
            if item6.count ==20 then 
                -- trigger add tuna
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~tuna')
                TriggerServerEvent("CF_Fishing:Catch",'tuna')
            end
        elseif randomChance >=96 and randomChance <= 98 then
            if item7.count ==20 then 
                -- trigger add catf
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~catfish')
                TriggerServerEvent("CF_Fishing:Catch",'catfish')
            end
        elseif randomChance >=72 and randomChance <= 74 then
            if item8.count ==20 then 
                -- trigger add mack
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~mackerel')
                TriggerServerEvent("CF_Fishing:Catch",'mackerel')
            end
        else
            if item9.count ==20 then 
                -- trigger add swor
                    CF.ShowNotification('You caught ~r~Nothing')
            else
                CF.ShowNotification('You caught a ~g~swordfish')
                TriggerServerEvent("CF_Fishing:Catch",'swordfish')
            end
        end
    end
end
)



Citizen.CreateThread(function()
    

    if firstspawn == false then
        for i=1, #sellloc, 1 do
            if sellloc[i].t =="I" then
                local hash = GetHashKey("cs_fbisuit_01")

                if not HasModelLoaded(hash) then
                    RequestModel(hash)
                    Citizen.Wait(100)
                end
            
                while not HasModelLoaded(hash) do
                    Citizen.Wait(0)
                end
                local npc = CreatePed(6, hash, sellloc[i].x, sellloc[i].y, sellloc[i].z, sellloc[i].h, false, false)
                SetEntityInvincible(npc, true)
                FreezeEntityPosition(npc, true)
                SetPedDiesWhenInjured(npc, false)
                SetPedCanRagdollFromPlayerImpact(npc, false)
                SetPedCanRagdoll(npc, false)
                SetEntityAsMissionEntity(npc, true, true)
                SetEntityDynamic(npc, true)
            else
                local hash = GetHashKey("s_m_m_linecook")

                if not HasModelLoaded(hash) then
                    RequestModel(hash)
                    Citizen.Wait(100)
                end
            
                while not HasModelLoaded(hash) do
                    Citizen.Wait(0)
                end
                local npc = CreatePed(6, hash, sellloc[i].x, sellloc[i].y, sellloc[i].z, sellloc[i].h, false, false)
                SetEntityInvincible(npc, true)
                FreezeEntityPosition(npc, true)
                SetPedDiesWhenInjured(npc, false)
                SetPedCanRagdollFromPlayerImpact(npc, false)
                SetPedCanRagdoll(npc, false)
                SetEntityAsMissionEntity(npc, true, true)
                SetEntityDynamic(npc, true)
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
        for i=1, #sellloc, 1 do
            
                if GetDistanceBetweenCoords(GetEntityCoords(ped), sellloc[i].x, sellloc[i].y, sellloc[i].z, true) < 2 then
                    Draw3DText( sellloc[i].x, sellloc[i].y, sellloc[i].z+1 -1.400, ('Press ~r~E ~w~to sell your items'), 4, 0.1, 0.1)
                        if IsControlJustReleased(1, 51) then
                            if sellloc[i].t == "I" then
                                InkSell()       
                            else              
                                FishSell()
                            end
                end
            end
        end
    end
 end)



    --[[local item = CF.GetInventory()['cod']
        local item2 = CF.GetInventory()['bass']
        local item3 = CF.GetInventory()['squid']
        local item4 = CF.GetInventory()['carp']
        local item5 = CF.GetInventory()['salmon']
        local item6 = CF.GetInventory()['talapia']
        local item7 = CF.GetInventory()['tuna']
        local item8 = CF.GetInventory()['catfish']
        local item9 = CF.GetInventory()['mackerel']
        local item10 = CF.GetInventory()['swordfish']]
 function FishSell()
    local elements = {
        {label = '<span style="color: #ffffff "><b>Sell 1 cod </b></span>',   value = 'cod'},
        {label = '<span style="color: #ffffff "><b>Sell all cod </b></span>',   value = 'acod'},
        {label = '<span style="color: #ffffff "><b>Sell 1 bass </b></span>',   value = 'bass'},
        {label = '<span style="color: #ffffff "><b>Sell all bass </b></span>',   value = 'abass'},
        {label = '<span style="color: #ffffff "><b>Sell 1 carp </b></span>',   value = 'carp'},
        {label = '<span style="color: #ffffff "><b>Sell all carp </b></span>',   value = 'acarp'},
        {label = '<span style="color: #ffffff "><b>Sell 1 squid </b></span>',   value = 'squid'},
        {label = '<span style="color: #ffffff "><b>Sell all squid </b></span>',   value = 'asquid'},
        {label = '<span style="color: #ffffff "><b>Sell 1 salmon </b></span>',   value = 'salmon'},
        {label = '<span style="color: #ffffff "><b>Sell all salmon </b></span>',   value = 'asalmon'},
        {label = '<span style="color: #ffffff "><b>Sell 1 talapia </b></span>',   value = 'talapia'},
        {label = '<span style="color: #ffffff "><b>Sell all talapia </b></span>',   value = 'atalapia'},
        {label = '<span style="color: #ffffff "><b>Sell 1 tuna </b></span>',   value = 'tuna'},
        {label = '<span style="color: #ffffff "><b>Sell all tuna </b></span>',   value = 'atuna'},
        {label = '<span style="color: #ffffff "><b>Sell 1 catfish </b></span>',   value = 'catfish'},
        {label = '<span style="color: #ffffff "><b>Sell all catfish </b></span>',   value = 'acatfish'},
        {label = '<span style="color: #ffffff "><b>Sell 1 mackerel </b></span>',   value = 'mackerel'},
        {label = '<span style="color: #ffffff "><b>Sell all mackerel </b></span>',   value = 'amackerel'},
        {label = '<span style="color: #ffffff "><b>Sell 1 swordfish </b></span>',   value = 'swordfish'},
        {label = '<span style="color: #ffffff "><b>Sell all swordfish </b></span>',   value = 'aswordfish'},
        {label = '<span style="color: red"><b>Exit</b></span>',       value = 'exit'}
    }

    CF.UI.Menu.CloseAll()

    CF.UI.Menu.Open('default1', GetCurrentResourceName(), 'FishSale', {
        title    = 'Fish Buyer',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        local item1 = CF.GetInventory()['cod']
        local item2 = CF.GetInventory()['bass']
        local item3 = CF.GetInventory()['squid']
        local item4 = CF.GetInventory()['carp']
        local item5 = CF.GetInventory()['salmon']
        local item6 = CF.GetInventory()['talapia']
        local item7 = CF.GetInventory()['tuna']
        local item8 = CF.GetInventory()['catfish']
        local item9 = CF.GetInventory()['mackerel']
        local item10 = CF.GetInventory()['swordfish']
        if data.current.value == 'cod' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['cod']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item1,1)
            else
                TriggerServerEvent("Fish:noitem",item1)
            end
        elseif data.current.value == 'acod' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['cod']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item1,0)
            else
                TriggerServerEvent("Fish:noitem",item1)
            end
        elseif data.current.value == 'bass' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['bass']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item2,1)
            else
                TriggerServerEvent("Fish:noitem",item2)
            end
        elseif data.current.value == 'abass' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['bass']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item2,0)
            else
                TriggerServerEvent("Fish:noitem",item2)
            end
        elseif data.current.value == 'squid' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['squid']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item3,1)
            else
                TriggerServerEvent("Fish:noitem",item3)
            end
        elseif data.current.value == 'asquid' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['squid']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item3,0)
            else
                TriggerServerEvent("Fish:noitem",item3)
            end
        elseif data.current.value == 'carp' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['carp']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item4,1)
            else
                TriggerServerEvent("Fish:noitem",item4)
            end
        elseif data.current.value == 'acarp' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['carp']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item4,0)
            else
                TriggerServerEvent("Fish:noitem",item4)
            end
        elseif data.current.value == 'salmon' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['salmon']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item5,1)
            else
                TriggerServerEvent("Fish:noitem",item5)
            end
        elseif data.current.value == 'asalmon' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['salmon']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item5,0)
            else
                TriggerServerEvent("Fish:noitem",item5)
            end
        elseif data.current.value == 'talapia' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['talapia']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item6,1)
            else
                TriggerServerEvent("Fish:noitem",item6)
            end
        elseif data.current.value == 'atalapia' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['talapia']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item6,0)
            else
                TriggerServerEvent("Fish:noitem",item6)
            end
        elseif data.current.value == 'tuna' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['tuna']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item7,1)
            else
                TriggerServerEvent("Fish:noitem",item7)
            end
        elseif data.current.value == 'atuna' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['tuna']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item7,0)
            else
                TriggerServerEvent("Fish:noitem",item7)
            end
        elseif data.current.value == 'catfish' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['catfish']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item8,1)
            else
                TriggerServerEvent("Fish:noitem",item8)
            end
        elseif data.current.value == 'acatfish' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['catfish']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item8,0)
            else
                TriggerServerEvent("Fish:noitem",item8)
            end
        elseif data.current.value == 'mackerel' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['mackerel']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item9,1)
            else
                TriggerServerEvent("Fish:noitem",item9)
            end
        elseif data.current.value == 'amackerel' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['mackerel']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item9,0)
            else
                TriggerServerEvent("Fish:noitem",item9)
            end
        elseif data.current.value == 'swordfish' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['swordfish']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item10,1)
            else
                TriggerServerEvent("Fish:noitem",item10)
            end
        elseif data.current.value == 'aswordfish' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['swordfish']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item10,0)
            else
                TriggerServerEvent("Fish:noitem",item10)
            end
        elseif data.current.value == 'exit' then
            menu.close()
        end
    end)
    
end

function InkSell()
    local elements = {
        {label = '<span style="color: #ffffff "><b>Sell 1 ink </b></span>',   value = 'ink'},
        {label = '<span style="color: #ffffff "><b>Sell all ink </b></span>',   value = 'aink'},
        {label = '<span style="color: red"><b>Exit</b></span>',       value = 'exit'}
    }

    CF.UI.Menu.CloseAll()

    CF.UI.Menu.Open('default1', GetCurrentResourceName(), 'InkSale', {
        title    = 'Ink Buyer',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        local item1 = CF.GetInventory()['ink']
        if data.current.value == 'ink' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['ink']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item1,1)
            else
                TriggerServerEvent("Fish:noitem",item1)
            end
        elseif data.current.value == 'aink' then
            menu.close()
            print('test')
            local item = CF.GetInventory()['ink']
            if item.count > 0 then
                TriggerServerEvent("Fish:SellI",item1,0)
            else
                TriggerServerEvent("Fish:noitem",item1)
            end
        elseif data.current.value == 'exit' then
            menu.close()
        end
    end)
end