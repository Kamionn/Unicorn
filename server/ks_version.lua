local Version = 
([==[{ 
    "enable": true,
    "Language": "English",
    "script": "Unicorn",
    "version": "0.0.0",
    "link": " https://kamdev.tebex.io/",
    "changelog": ""
}]==])

local HTTPrequest = "https://raw.githubusercontent.com/Kamionn/Update_Import/main/english/Unicorn.json"

Citizen.CreateThread(function()
	local _v = json.decode(Version)
	if json.encode(_v.enable) == "true" then
		PerformHttpRequest(HTTPrequest, function(code, res, headers)
			if code == 200 then
				local _gv = json.decode(res)
				if _gv.script == _v.script then
					if _gv.version ~= _v.version then 
					    print((
[[
    

               _ _       \ \    ^4                     Update !^0
    .-"""""-. / \_> /\    |/    ^4Language: ^3English^0
   /         \.'`  `',.--//     ^4INFORMATION: ^7please update the ^3%s ^7!
 -(           I      I  @@\     ^4VERSION: ^3%s^7 is available !
   \         /'.____.'\___|     ^4CHANGELOG:^0 %s
    '-.....-' __/ | \   (`)     ^4DOWNLOAD:^7 ^3%s
             /   /  /
                 \  \
]]):format(_gv.script,_gv.version,_gv.changelog,_gv.link))
				    end
			    else
				    print((
[[

               _ _       \ \    ^4                     Update !^0
    .-"""""-. / \_> /\    |/    ^4Language: ^3English^0
   /         \.'`  `',.--//     4INFORMATION: ^7please update the ^3%s ^7!
 -(           I      I  @@\     ^4VERSION: ^3%s^7 is available !
   \         /'.____.'\___|     ^4CHANGELOG:^0 %s
    '-.....-' __/ | \   (`)     ^4DOWNLOAD:^7 ^3%s
             /   /  /
                 \  \
]]):format(_gv.script,_gv.version,_gv.changelog,_gv.link))
                end
			else
				print(('[^6%s^0] [^1ERROR^0] Impossible de vérifier la version!'):format(tostring(_v.script)))
			end
		end, 'GET')
	end
end)
