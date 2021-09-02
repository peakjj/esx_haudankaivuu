ESX = nil
local table = {}

local haudat = {
    [1] = {coords=vector3(-1711.96, -233.75, 54.45), heading=355.89},
    [2] = {coords=vector3(-1727.99, -251.08, 51.9), heading=13.41},
    [3] = {coords=vector3(-1724.47, -234.48, 54.10), heading=353.18},
    [4] = {coords=vector3(-1750.74, -254.06, 50.52), heading=325.49},
    [5] = {coords=vector3(-1737.27, -269.09, 50.12), heading=280.39},
    [6] = {coords=vector3(-1736.53, -271.69, 49.97), heading=280.39},
    [7] = {coords=vector3(-1736.05, -273.64, 49.85), heading=280.39},
    [8] = {coords=vector3(-1733.1, -275.4, 49.85), heading=280.39},
    [9] = {coords=vector3(-1732.71, -276.93, 49.75), heading=280.39},
    [10] = {coords=vector3(-1731.97, -280.55, 49.39), heading=280.39},
    [11] = {coords=vector3(-1730.95, -286.81, 48.89), heading=280.39},
    [12] = {coords=vector3(-1740.35, -277.44, 48.80), heading=280.39},
    [13] = {coords=vector3(-1742.03, -271.09, 49.13), heading=280.39},
    [14] = {coords=vector3(-1741.57, -273.22, 48.95), heading=280.39},
    [15] = {coords=vector3(-1755.45, -261.52, 49.43), heading=325.39},
    [16] = {coords=vector3(-1758.6, -258.89, 49.63), heading=323.18},
    [17] = {coords=vector3(-1760.3, -257.85, 49.69), heading=323.18},
    [18] = {coords=vector3(-1769.74, -269.96, 46.22), heading=327.39},
    [19] = {coords=vector3(-1773.43, -267.09, 46.52), heading=325.39},
    [20] = {coords=vector3(-1775.12, -266.05, 46.60), heading=326.93},
    [21] = {coords=vector3(-1757.07, -284.25, 46.48), heading=279.7},
    [22] = {coords=vector3(-1749.43, -286.72, 47.63), heading=279.0},
    [23] = {coords=vector3(-1747.48, -299.0, 46.95), heading=281.62},
    [24] = {coords=vector3(-1781.95, -258.43, 46.56), heading=321.04},
    [25] = {coords=vector3(-1784.14, -256.86, 46.44), heading=315.21},
    [26] = {coords=vector3(-1798.0, -252.16, 43.92), heading=307.88},
    [27] = {coords=vector3(-1798.69, -246.91, 45.72), heading=304.93},
    [28] = {coords=vector3(-1800.02, -245.43, 45.72), heading=306.31},
    [29] = {coords=vector3(-1793.99, -236.59, 48.2), heading=294.44},
    [30] = {coords=vector3(-1795.17, -231.98, 48.25), heading=284.17},
    [31] = {coords=vector3(-1785.98, -239.06, 49.47), heading=316.27},
    [32] = {coords=vector3(-1787.51, -237.78, 49.47), heading=316.99},
    [33] = {coords=vector3(-1758.55, -248.36, 50.93), heading=323.75},
    [34] = {coords=vector3(-1769.53, -240.94, 51.02), heading=321.68},
    [35] = {coords=vector3(-1759.81, -220.29, 54.1), heading=315.98},
    [36] = {coords=vector3(-1749.29, -222.98, 54.1), heading=337.36},
    [37] = {coords=vector3(-1745.89, -224.38, 54.2), heading=343.92},
    [38] = {coords=vector3(-1742.24, -225.08, 54.6), heading=347.16},
    [39] = {coords=vector3(-1731.41, -224.9, 55.23), heading=354.45},
    [40] = {coords=vector3(-1705.98, -229.31, 55.23), heading=354.52},
    [41] = {coords=vector3(-1704.03, -229.52, 55.23), heading=354.16},
    [42] = {coords=vector3(-1700.76, -230.02, 55.23), heading=356.26},
    [43] = {coords=vector3(-1704.18, -234.21, 54.25), heading=357.26},
    [44] = {coords=vector3(-1714.84, -233.79, 54.48), heading=354.48}
}


    
CreateThread(function()
    while ESX == nil do
        Wait(10)
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
    while true do
        local wait = 2500 --loopataan vaan 2,5SEC koska ei renderöidä mitään
        for i=1, #haudat do
           local coords = GetEntityCoords(PlayerPedId())
           local hauta = #(haudat[i].coords - coords) --MATIKKANERO OMFG SOO GOOD ONKS TÄÄ  SE UUS TAPA
           if hauta < 15.0 then --pitää legit olla semi pieni ettei mee liian raskaaks
            wait = 5 --pitää piirtää nuo markkerit...
            DrawMarker(25, haudat[i].coords.x, haudat[i].coords.y, haudat[i].coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 77, 0, 0, 150, false, true, 5, nil, nil, false)
                if hauta < 1.2 then
                    if Config.teksti then
                        ESX.ShowHelpNotification("Paina ~INPUT_CONTEXT~ kaivaaksesi!")
                    end
                    if IsControlJustReleased(0, 38) then
                        ESX.TriggerServerCallback('karpo_haudankaivuu:server', function(inv,cdtable)
                            table = cdtable
                            if Config.tarviitkolapion then
                                if inv.lapio > 0 then
                                    aloitakaivausvitunpaska(i)
                                else
                                    ESX.ShowNotification("Tarvitset lapion!")
                                end
                            else
                                aloitakaivausvitunpaska(i)
                            end
                        end)
                    end
                end
            end  
        end
        Wait(wait)
    end
end)


function aloitakaivausvitunpaska(hauta)
    ESX.TriggerServerCallback('karpo_haudankaivuu:boliseja', function(bolis) --
        if bolis >= Config.boliiseja then
            anim(hauta)
        else
            ESX.ShowNotification('Ei tarpeeksi poliiseja!')
        end
    end)
end

function anim(hauta)
    SetEntityHeading(PlayerPedId(), haudat[hauta].heading)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "hauta",
        duration = 20000,
        label = "Avataan hautaa...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@world_human_janitor@male@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_ld_shovel",
            bone = 28422,
        }
    }, function(canceled)
        if not canceled then
            ClearPedTasks(PlayerPedId())
            if table[hauta].cd <= 0 then
                TriggerServerEvent('karpo_haudankaivuu:poliisi', haudat[hauta].coords)
                TriggerServerEvent('karpo_haudankaivuu:kaivettupaskaks', hauta)
                if Config.lapiopois then
                    local olenmatikkanero = math.random(1, 100)
                    if olenmatikkanero <= 3 then
                        TriggerServerEvent('karpo_haudankaivuu:poistaitemi', 'lapio')
                    end
                end       
            else
                ESX.ShowNotification("Tyhjää täynnä...")
            end
            npcagro()
        else
            ClearPedTasks(PlayerPedId())
        end
    end)
end

function npcagro()
    local matikkapaanerohomoperse = math.random(1, 100)
    if matikkapaanerohomoperse <= Config.kirkkoherrachance then
        RequestModel(GetHashKey("cs_priest"))
        while not HasModelLoaded(GetHashKey("cs_priest")) do
           Wait(1)
        end
        pedi = CreatePed(4, GetHashKey("cs_priest"), -1698.01, -277.69, 51.88, 0.0, true, true)
	    GiveWeaponToPed(pedi, GetHashKey(Config.kirkkoherranASE), 0, false, true) --pesäpallomaila AHAHAH
        TaskCombatPed(pedi,PlayerPedId(), 0, 16)
	    SetAiWeaponDamageModifier(1.0)
        Wait(120000) --kahen minuutin pääst poistetaan pedi
        DeleteEntity(pedi)
    end
end


RegisterNetEvent('karpo_haudankaivuu:blipclient')
AddEventHandler('karpo_haudankaivuu:blipclient', function(pos)
    ESX.ShowAdvancedNotification('Hautausmaa', 'Hämärää toimintaa!', "", "CHAR_CALL911", 1)
end)
