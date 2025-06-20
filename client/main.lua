local QBCore = exports['qb-core']:GetCoreObject()

-- Draw 3D text
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Main loop
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        -- Gather Leaves
        if #(pos - Config.Field) < 10.0 then
            DrawMarker(1, Config.Field.x, Config.Field.y, Config.Field.z - 1.0, 0,0,0, 0,0,0, 1.0,1.0,1.0, 0,255,0,100)
            if #(pos - Config.Field) < 1.5 then
                DrawText3D(Config.Field.x, Config.Field.y, Config.Field.z + 0.2, '~g~E~w~ Gather Coca Leaves')
                if IsControlJustReleased(0, 38) then
                    lib.progressBar({duration = 8000, label = 'Gathering coca leaves'})
                    TriggerServerEvent('bobbie-cocaine:server:GatherLeaves')
                end
            end
        end

        -- Process Cocaine
        if #(pos - Config.Lab) < 10.0 then
            DrawMarker(1, Config.Lab.x, Config.Lab.y, Config.Lab.z - 1.0, 0,0,0, 0,0,0, 1.0,1.0,1.0, 255,165,0,100)
            if #(pos - Config.Lab) < 1.5 then
                DrawText3D(Config.Lab.x, Config.Lab.y, Config.Lab.z + 0.2, '~y~E~w~ Process Coca Leaves')
                if IsControlJustReleased(0, 38) then
                    lib.progressBar({duration = Config.ProcessTime, label = 'Processing cocaine'})
                    TriggerServerEvent('bobbie-cocaine:server:ProcessCocaine')
                end
            end
        end

        -- Sell Cocaine
        if #(pos - Config.Sell) < 10.0 then
            DrawMarker(1, Config.Sell.x, Config.Sell.y, Config.Sell.z - 1.0, 0,0,0, 0,0,0, 1.0,1.0,1.0, 255,0,0,100)
            if #(pos - Config.Sell) < 1.5 then
                DrawText3D(Config.Sell.x, Config.Sell.y, Config.Sell.z + 0.2, '~r~E~w~ Sell Cocaine')
                if IsControlJustReleased(0, 38) then
                    lib.progressBar({duration = 5000, label = 'Selling cocaine'})
                    TriggerServerEvent('bobbie-cocaine:server:SellCocaine')
                end
            end
        end

        Wait(3)
    end
end)