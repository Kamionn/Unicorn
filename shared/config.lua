Config = {} 
Config.framework = "esx:getSharedObject" -- Choisir votre Framework 
Config.AdvancedNotification = 'esx:showAdvancedNotification'
Config.Notification = 'esx:showNotification'
Config.debugServer = true
Config.trigger = '::{Kamion#1323}:'
Config.Locale = 'fr' -- Language
Config.keyfirstjob = 'F6'
Config.keydoublejob = 'F7'


Config.Unicorn = { 
	  Unicorn = {
		MenuColor = {a = 255, b = 255, c = 80, o = 100}, -- Couleur bannière du menu
		MarkerColor = { r = 117, g = 52, b = 151 }, -- Couleur du Drawmarker 
		MarkerType  = 6, -- Type du Drawmarker
        Pos = vector3(819.45,  -2156.3, 29.70), -- Coord point
		PosGarage = vector3(136.525635, -1278.597412, 29.359638),
		Job  = "unicorn", -- Job
		JobGrade = {boss = true, viceboss = true}, -- true / false pour les jobs
		JobGradeName = {boss = 'boss', viceboss = 'securite'} 
	  },
}

Config.Garage = {
	Unicorn = {
		{buttoname = "Sentinel", rightlabel = "→→", spawnname = "sentinel", spawnzone = vector3(143.301590, -1277.050293, 28.579863), headingspawn = 210.100479},
        {buttoname = "Granger ", rightlabel = "→→", spawnname = "granger",  spawnzone = vector3(143.301590, -1277.050293, 28.579863), headingspawn = 210.100479},
        {buttoname = "Baller ", rightlabel = "→→", spawnname = "baller3",  spawnzone = vector3(143.301590, -1277.050293, 28.579863), headingspawn = 210.100479},
	}
}

