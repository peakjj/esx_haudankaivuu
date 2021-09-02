ESX = nil
local cdtable = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('karpo_haudankaivuu:kaivettupaskaks')
AddEventHandler('karpo_haudankaivuu:kaivettupaskaks', function(hauta)
	cdtable[hauta].cd = Config.cooldown * 1000 * 60
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemi = math.random(1,#Config.itemit)
	local ase = math.random(1,#Config.aseet)
	local kuinmont = math.random(1,3)
	local matikkapaakahdeksankeskiarvo = math.random(1,100)
	xPlayer.addInventoryItem(Config.itemit[itemi], kuinmont)


	if matikkapaakahdeksankeskiarvo < 50 then --50/50 että saako lisää itemeitä
		local itemi = math.random(1,#Config.itemit)
		xPlayer.addInventoryItem(Config.itemit[itemi], kuinmont)
	end

	if Config.aseita then
		if matikkapaakahdeksankeskiarvo <= 1 then --1% chance saada ase
			xPlayer.addWeapon(Config.aseet[ase], 0)
		end
	end

end)


ESX.RegisterServerCallback('karpo_haudankaivuu:server', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

	if Config.tarviitkolapion then
    	local lapio = xPlayer.getInventoryItem('lapio').count
    	cb({['lapio'] = lapio}, cdtable)
	else
		cb(cdtable)
	end
end)



ESX.RegisterServerCallback('karpo_haudankaivuu:boliseja',function(source, cb)
    local bolis = 0
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
      local _source = xPlayers[i]
      local xPlayer = ESX.GetPlayerFromId(_source)
      if xPlayer.job.name == 'police' then
        bolis = bolis + 1
      end
    end
    cb(bolis)
end)




RegisterServerEvent('karpo_haudankaivuu:poliisi')
AddEventHandler('karpo_haudankaivuu:poliisi', function(pos)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('karpo_haudankaivuu:blipclient', xPlayers[i], pos)
		end
	end
end)



RegisterServerEvent('karpo_haudankaivuu:poistaitemi')
AddEventHandler('karpo_haudankaivuu:poistaitemi', function(itemi)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(itemi, 1)
end)


CreateThread(function()
	while true do 
		Wait(5000) --joka 5 sec ettei mee liian raskaaks
		for i=1, #cdtable do --loopataan meidän cooldown tablen läpi
			if cdtable[i].cd > 0 then --jos haudan cd on yli 0 (joku kaivanut)
				cdtable[i].cd = cdtable[i].cd - 5000 --lyhennetään cooldownia
			end
		end
	end
end)

cdtable = {
	[1] = {cd = 0},
  [2] = {cd = 0},
	[3] = {cd = 0},
	[4] = {cd = 0},
  [5] = {cd = 0},
	[6] = {cd = 0},
  [7] = {cd = 0},
	[8] = {cd = 0},
	[9] = {cd = 0},
  [10] = {cd = 0},
	[11] = {cd = 0},
	[12] = {cd = 0},
  [13] = {cd = 0},
	[14] = {cd = 0},
  [15] = {cd = 0},
	[16] = {cd = 0},
	[17] = {cd = 0},
  [18] = {cd = 0},
	[19] = {cd = 0},
	[20] = {cd = 0},
  [21] = {cd = 0},
	[22] = {cd = 0},
  [23] = {cd = 0},
	[24] = {cd = 0},
	[25] = {cd = 0},
  [26] = {cd = 0},
	[27] = {cd = 0},
	[28] = {cd = 0},
  [29] = {cd = 0},
	[30] = {cd = 0},
  [31] = {cd = 0},
	[32] = {cd = 0},
	[33] = {cd = 0},
	[34] = {cd = 0},
	[35] = {cd = 0},
  [36] = {cd = 0},
	[37] = {cd = 0},
  [38] = {cd = 0},
	[39] = {cd = 0},
	[40] = {cd = 0},
  [41] = {cd = 0},
	[42] = {cd = 0},
	[43] = {cd = 0},
  [44] = {cd = 0}
}
