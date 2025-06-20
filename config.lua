Config = {}

-- Locations for activities
Config.Field = vector3(2228.12, 5574.91, 53.74)      -- Coca field
Config.Lab = vector3(1088.15, -3186.73, -38.99)      -- Processing lab
Config.Sell = vector3(-63.31, -1280.85, 28.27)       -- NPC sell point

-- Processing settings
Config.ProcessAmount = 5       -- Leaves required
Config.ProcessTime = 15000     -- In milliseconds

-- Sell price range per bag
Config.SellPrice = { min = 150, max = 200 }

-- Ox-Inventory item definitions
Config.Items = {
    leaf = {
        name = 'coca_leaf',
        label = 'Coca Leaf',
        weight = 100,
        stack = true,
        description = 'Fresh coca leaves',
        image = 'https://i.imgur.com/8JzG47L.png'
    },
    cocaine = {
        name = 'cocaine',
        label = 'Cocaine Bag',
        weight = 200,
        stack = false,
        description = 'Processed cocaine',
        image = 'https://i.imgur.com/AhVYF6Y.png'
    }
}