CF = nil
prices = {{'cod',500},{'swordfish',550},{'mackerel',450},{'salmon',600},{'carp',300},{'cat fish',400},{'tuna',575},{'ink',750},{'bass',525},{'squid',600},{'talapia',500}}
Citizen.CreateThread(function()
	while CF == nil do 
        Citizen.Wait(0)
        TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)
    end
    
end)

RegisterNetEvent("CF_Fishing:Catch")
AddEventHandler("CF_Fishing:Catch", function(type)
    local _source = source
    local _type = type
    print(_type)
    CF.AddItem(_source,_type,1)
end)


RegisterNetEvent("CF_Fishing:TMFish")
AddEventHandler("CF_Fishing:TMFish", function(item,count)
    local _source = source
    CF.ShowNotification(_source, 'You do not have enough room for ~b~Fishing.')
end)

--[[RegisterCommand('fishy', function(source)
    _source=source
    CF.AddItem(_source,'ink', 1)
    CF.AddItem(_source,'cod', 1)
    CF.AddItem(_source,'swordfish', 1)
    CF.AddItem(_source,'mackerel', 1)
    CF.AddItem(_source,'salmon', 1)
    CF.AddItem(_source,'carp', 1)
    CF.AddItem(_source,'catfish', 1)
    CF.AddItem(_source,'tuna', 1)
    CF.AddItem(_source,'squid', 1)
    CF.AddItem(_source,'talapia', 1)
        
    end
)]]


RegisterNetEvent("process")
AddEventHandler("process", function(item, item2)
    local _source = source
    local xPlayer  = exports.essentialmode:getPlayerFromId(_source)
        if xPlayer ~= nil then
            if item.count >= 2 and item2.count ~= 10 then 
                CF.RemoveItem(_source,'squid',2)
                CF.AddItem(_source,item.lable, 1)
                CF.ShowNotification(_source, 'You Processed ~b~Ink.')    
            else
                if item.count <= 1 then
                    CF.ShowNotification(_source, 'You do not have enough ~b~' .. item.lable )
                else
                    CF.ShowNotification(_source, 'You do not have enough room for ~b~'..  item.lable) 
                end
            end
        end
    end)

RegisterNetEvent("Fish:SellI")
AddEventHandler("Fish:SellI", function(item,all)
    local price = 0
    local _source = source
    local user = exports.essentialmode:getPlayerFromId(_source)
    local lable = item.label
    for k,v in ipairs(prices) do
        --print(string.lower(lable))
        --print(prices[k][1])
        if prices[k][1] == string.lower(lable) then
            price = prices[k][2]
            --print(lable)
            if lable ~= "Cat Fish" then
                itype = string.lower(lable)
            else
                itype = "catfish"
            end
        end
    end
    amounts = 1
    if all ~= 1 then
        amounts = item.count
    else
        amounts = 1
    end
    --print(itype)
    CF.RemoveItem(_source,itype,amounts)
    user.addMoney(price*amounts)
    CF.ShowNotification(_source, 'You have sold '.. amounts ..' ~b~'.. lable ..' ~w~for ~g~$' ..  price*amounts) 
end)


RegisterNetEvent("Fish:noitem")
AddEventHandler("Fish:noitem", function(item)
    local _source = source
    local lable = item.label
    CF.ShowNotification(_source, 'You do not have enough ~b~'.. lable)
end)