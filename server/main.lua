local QBCore = exports['qb-core']:GetCoreObject()

-- Register items in ox_inventory
exports.ox_inventory:RegisterItem(Config.Items.leaf.name, {
    label = Config.Items.leaf.label,
    weight = Config.Items.leaf.weight,
    stack = Config.Items.leaf.stack,
    description = Config.Items.leaf.description,
    image = Config.Items.leaf.image
})
exports.ox_inventory:RegisterItem(Config.Items.cocaine.name, {
    label = Config.Items.cocaine.label,
    weight = Config.Items.cocaine.weight,
    stack = Config.Items.cocaine.stack,
    description = Config.Items.cocaine.description,
    image = Config.Items.cocaine.image
})

-- Gather coca leaves
RegisterNetEvent('bobbie-cocaine:server:GatherLeaves', function()
    local src = source
    exports.ox_inventory:AddItem(src, Config.Items.leaf.name, 1)
    TriggerClientEvent('QBCore:Notify', src, 'You gathered 1x ' .. Config.Items.leaf.label, 'success')
end)

-- Process leaves -> cocaine
RegisterNetEvent('bobbie-cocaine:server:ProcessCocaine', function()
    local src = source
    local inv = exports.ox_inventory:GetItem(src, Config.Items.leaf.name)
    if inv and inv.amount >= Config.ProcessAmount then
        exports.ox_inventory:RemoveItem(src, Config.Items.leaf.name, Config.ProcessAmount)
        exports.ox_inventory:AddItem(src, Config.Items.cocaine.name, 1)
        TriggerClientEvent('QBCore:Notify', src, 'Processed 5x leaves into 1x ' .. Config.Items.cocaine.label, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough leaves to process', 'error')
    end
end)

-- Sell cocaine
RegisterNetEvent('bobbie-cocaine:server:SellCocaine', function()
    local src = source
    local inv = exports.ox_inventory:GetItem(src, Config.Items.cocaine.name)
    if inv and inv.amount > 0 then
        exports.ox_inventory:RemoveItem(src, Config.Items.cocaine.name, 1)
        local price = math.random(Config.SellPrice.min, Config.SellPrice.max)
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', price, 'sold-cocaine')
        TriggerClientEvent('QBCore:Notify', src, 'Sold 1x ' .. Config.Items.cocaine.label .. ' for $' .. price, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have no ' .. Config.Items.cocaine.label .. ' to sell', 'error')
    end
end)