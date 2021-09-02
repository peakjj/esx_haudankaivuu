Config = {}
--booleans
Config.tarviitkolapion = true
Config.lapiopois = true --meneekö lapio rikki 3% chanssillä?
Config.aseita = true --onks mahollisuus saada aseita(pieni chance)
Config.teksti = false --rasittaa ihan vitusti en suosittele

--enmuista numeroita jee
Config.boliiseja = 0 --paljo kyttii että voit kaivaa hautaa
Config.cooldown = 12 --minuutteina, jokaselle haudalle oma cooldown
Config.kirkkoherrachance = 30 --prosentteina chance että kirkkoherra spawnaa ja hunttaa sut ARGH
Config.kirkkoherranASE = "WEAPON_BAT" --mikä ase itse paskalle annettaan

--tähän itemit 

Config.itemit = {
    "rolex",
    "pirtelo",
    "koru",
    "donitsi"
}

--aseet 1% chance saada
--disabloi laittamalla config.aseita = false
Config.aseet = {
    [1] = "WEAPON_SNSPISTOL_MK2",
    [2] = "WEAPON_PISTOL_MK2",
    [3] = "WEAPON_VINTAGEPISTOL"
}
