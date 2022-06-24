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
		Job  = "unicorn", -- Job
		JobGrade = {boss = true, viceboss = true}, -- true / false pour les jobs
		JobGradeName = {boss = 'boss', viceboss = 'securite'} 
	  },
}