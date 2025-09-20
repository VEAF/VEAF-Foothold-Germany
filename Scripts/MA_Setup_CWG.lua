env.info("Mission Setup : is loading.")

local function random(min,max) return min + math.random()*(max - min) end

function merge(tbls)
	local res = {}
	for i,v in ipairs(tbls) do
		for i2,v2 in ipairs(v) do
			table.insert(res,v2)
		end
	end	
	return res
end
function allExcept(tbls, except)
	local tomerge = {}
	for i,v in pairs(tbls) do
		if i~=except then
			table.insert(tomerge, v)
		end
	end
	return merge(tomerge)
end

WaypointList = {
    Bitburg = ' (1)',
    Spangdahlem = ' (2)',
    Hahn = ' (3)',
    Mendig = ' (4)',
    ['Mendig North FARP'] = ' (5)',
    ['Mendig East FARP'] = ' (6)',
    ['Baumholder FARP'] = ' (7)',
    Ramstein = ' (8)',
    ['Bad Durkheim'] = ' (9)',
    ['Walldorf FARP'] = ' (10)',
    ['Walldurn FARP'] = ' (11)',
    ['Giebelstadt'] = ' (12)',
    ['Airracing Frankfurt'] = ' (13)',
    Frankfurt = ' (14)',
    Fritzlar = ' (15)',
    Gelnhausen = ' (16)',
    ['Laubach FARP'] = ' (17)',
    Fulda = ' (18)',
    ['Salzungen FARP'] = ' (19)',
    Bindersleben = ' (20)',
    ['Naumburg FARP'] = ' (21)',
    Leipzig = ' (22)',
    Zerbst = ' (23)',
    Mahlwinkel = ' (24)',
    Braunschweig = ' (25)',
    Hannover = ' (26)',
    Fassberg = ' (27)',
    Scheessel = ' (28)',
    Bremen = ' (29)',
    Hamburg = ' (30)',
    Lubeck = ' (31)',
    Briest = ' (32)',
    ['Altes Lager'] = ' (33)',
    ['Wundsdorf FARP'] = ' (34)',
    Tegel = ' (35)',
    Werneuchen = ' (36)',
    Neuruppin = ' (37)',
    Templin = ' (38)',
    Larz = ' (39)',
    Parchim = ' (40)',
    Neubrandenburg = ' (41)',
    Tutow = ' (42)',
    Laage = ' (43)',
    Garz = ' (44)',
    Peenemunde = ' (45)',
}

flavor = {

    bitburg = 'WPT 1\n',
    spangdahlem = 'WPT 2\n',
    hahn = 'WPT 3\n',
    mendig = 'WPT 4\n',
    mendignorth = 'WPT 5\n',
    mendigeast = 'WPT 6\n',
    baumholderfarp = 'WPT 7\n',
    ramstein = 'WPT 8\n',
    baddurkheim = 'WPT 9\n',
    walldorffarp = 'WPT 10\n',
    walldurnfarp = 'WPT 11\n',
    giebelstadt = 'WPT 12\n',
    airrcing = 'WPT 13\n',
    frankfurt = 'WPT 14\n',
    fritzlar = 'WPT 15\n',
    gelnhausen = 'WPT 16\n',
    laubachfarp = 'WPT 17\n',
    fulda = 'WPT 18\n',
    salzungenfarp = 'WPT 19\n',
    bindersleben = 'WPT 20\n',
    naumburgfarp = 'WPT 21\n',
    leipzig = 'WPT 22\n',
    zerbst = 'WPT 23\n',
    mahlwinkel = 'WPT 24\n',
    braunschweig = 'WPT 25\n',
    hannover = 'WPT 26\n',
    fassberg = 'WPT 27\n',
    scheessel = 'WPT 28\n',
    bremen = 'WPT 29\n',
    hamburg = 'WPT 30\n',
    lubeck = 'WPT 31\n',
    briest = 'WPT 32\n',
    alteslager = 'WPT 33\n',
    wundsdorffarp = 'WPT 34\n',
    tegel = 'WPT 35\n',
    werneuchen = 'WPT 36\n',
    neuruppin = 'WPT 37\n',
    templin = 'WPT 38\n',
    larz = 'WPT 39\n',
    parchim = 'WPT 40\n',
    neubrandenburg = 'WPT 41\n',
    tutow = 'WPT 42\n',
    laage = 'WPT 43\n',
    garz = 'WPT 44\n',
    peenemunde = 'WPT 45\n',
    sheizefactory = 'If shit could be made, it would be one of the best shit in the world.',
    chemicalfactory = 'Chemicals are made here, not a good one.',

}

local filepath = (Era == 'Coldwar') and 'FootHold_Germany_ColdWar_V0.1.lua' or 'FootHold_Germany_Modern_V0.1.lua'
env.info('[DEBUG] Era='..tostring(Era)..'  ->  '..filepath)
if lfs then 
	local dir = lfs.writedir()..'Missions/Saves/'
	lfs.mkdir(dir)
	filepath = dir..filepath
	env.info('Foothold - Save file path: '..filepath)
end

upgrades = {
	airfieldStart = {
		blue = {'blueArmor', 'bluePD1'},
		red = {}
	},

	airfield1 = {
		blue = {'bluePD2', 'blueArmor', 'bluePD1'},
		red = {'Enemy ground forces 2', 'Red Armour Group', 'Red Armour Group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-8 2','Red SAM SHORAD SA-8', 'Red SAM SA-3'}
	},
	airfield2 = {
		blue = {'blueInfantry', 'blueArmor','bluePD1','blueArmor'},
		red = {'Enemy ground forces','Red SAM AAA 2', 'Red Armour Group', 'Red Armour Group 2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-15', 'Red Arty', 'Red SAM SHORAD SA-19 2'}
	},
	airfield3 = {
		blue = {'bluePD2', 'blueArmor', 'bluePD1'},
		red = {'Enemy ground forces 2', 'Red Armour Group 2','Red Armour Group 3', 'Red SAM AAA 2', 'Red SAM SA-3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2','Red Arty'}
	},
	airfield4 = {
		blue = {'blueInfantry','bluePD1','blueArmor'},
		red = {'Enemy ground forces 2', 'Red Armour Group', 'Red Armour Group 2', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2', 'Red SAM AAA 2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2'}
	},
    Scheize = {
		blue = {'blueInfantry','blueArmor','blueHAWK'},
		red = {'Enemy ground forces 2', 'Red Armour Group', 'Red Armour Group 2', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2', 'Red SAM AAA 2', 'Red SAM SHORAD SA-8', 'Red SAM AAA 3','Red SAM AAA 4','Scheize Factory building 1','Scheize Factory building 2'}
	},
	airfield6 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1',},
		red = {'Enemy ground forces 2', 'Red SAM AAA 2', 'Red Armour Group 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2', 'Red SAM SA-10'}
	},
	airfield6Cold = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'Enemy ground forces 2', 'Red SAM AAA 2', 'Red Armour Group 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2', 'Red SAM SA-2'}
	},
	farp = {
		blue = {'bluePD2', 'blueArmor', 'bluePD1'},
		red = {'Enemy ground forces', 'Red Armour Group', 'Red Armour Group 2','Red SAM SHORAD SA-8', 'Red SAM AAA 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8','Red Arty'}
	},
	farp1 = {
		blue = {'blueInfantry', 'blueArmor', 'blueHAWK'},
		red = {'Red SAM AAA 2', 'Red Armour Group','Red Arty','Red SAM SHORAD SA-15','Red SAM SHORAD SA-15 2', 'Red SAM SHORAD SA-8 2', 'Red SAM AAA 4','Red SAM AAA 3'}
	},
	farp2 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'Enemy ground forces', 'Red Armour Group', 'Red Armour Group 2', 'Red SAM AAA 2', 'Red SAM SHORAD SA-19', 'Red Arty','Red SAM AAA 4','Red SAM AAA 3'}
	},
	SamAlpha = {
		blue = {},
		red = {'Red SAM SA-3 Fixed SamAlpha'}
	},
	SamBravo = {
		blue = {},
		red = {'Red SAM SA-3 Fixed-SamBravo'}
	},
	samCharlie = {
		blue = {},
		red = {'Red SAM SA-2 Fixed SamCharlie','Red SAM SHORAD SA-13 Fixed SAMCharlie', 'Red SAM SHORAD SA-13 Fixed SAMCharlie 2'}
	},
	samDelta = {
		blue = {},
		red = {'Red SAM SA-11 Fixed SamDelta','Red SAM SHORAD SA-15 Fixed SamDelta', 'Red SAM SHORAD SA-15 Fixed SamDelta 2'}
	},
	samEcho = {
		blue = {},
		red = {'Red SAM SA-2 Fixed SamEcho','Red SAM SHORAD SA-19 Fixed SamEcho', 'Red SAM SHORAD SA-15 Fixed SamEcho'}
	},
	samFoxtrot = {
		blue = {},
		red = {'Red SAM SA-2 Fixed SamFoxtrot','Red SAM SHORAD SA-15 Fixed SamFoxtrot 2', 'Red SAM SHORAD SA-15 Fixed SamFoxtrot'}
	},
	samGolf = {
		blue = {},
		red = {'Red SAM SA-2 Fixed SamGolf','Red SAM SHORAD SA-15 Fixed SamGolf 2', 'Red SAM SHORAD SA-15 Fixed SamGolf'}
	},
	samHotel = {
		blue = {},
		red = {'Red SAM SA-11 Fixed SamHotel','Red SAM SHORAD SA-15 Fixed SamHotel 2', 'Red SAM SHORAD SA-15 Fixed SamHotel'}
	},
	samIndia = {
		blue = {},
		red = {'Red SAM SA-2 Fixed SamIndia','SamIndia AAA Group 1 Fixed','Red SAM SHORAD SA-8 Fixed SamIndia','Red SAM SHORAD SA-15 Fixed SamIndia'}
	},
	samJuliett = {
		blue = {},
		red = {'Red SAM SA-2 Fixed SamJuliett','Red SAM SHORAD SA-15 Fixed SamJuliett','Red SAM SHORAD SA-8 Fixed SamJuliett','SamJuliett AAA Group 1 Fixed'}
	},
	samKilo = {
		blue = {},
		red = {'Red SAM SA-11 Fixed SamKilo','Red SAM SHORAD SA-15 Fixed SamKilo','Red SAM SHORAD SA-15 Fixed SamKilo 2'}
	},
	samLima = {
		blue = {},
		red = {'Red SAM SA-10 Fixed SamLima','Red SAM SHORAD SA-15 Fixed SamLima','Red SAM SHORAD SA-15 Fixed SamLima 2', 'Red SAM AAA Fixed SamLima 2', 'Red SAM AAA Fixed SamLima'}
	},
	EWRMantisNet = {
		blue = {},
		red = {'Red EWR Fixed 1', 'Red EWR Fixed 2', 'Red EWR Fixed 3', 'Red EWR Fixed 4', 'Red EWR Fixed 5'}
	},
	hidden2 = {
		blue = {},
		red = {'Grisha Fixed','Moskova fleet Fixed'}
	},
    Chemical = {
		blue = {},
		red = {'Chemical building', 'Chemical building 2', 'Chemical building 3','Red SAM SHORAD SA-15 2', 'Chemical Factory building','Chemical Guairds infantry Fixed','Red SAM SHORAD SA-15', 'Chemical Factory building 2','Red SAM AAA Chemical Fixed',
    'Chemical Factoy tank', 'Chemical Factoy tank 2', 'Chemical Factoy tank 3', 'Chemical Factoy tank 4','Red SAM AAA CHemical Fixed Mixed','Red Armour Group 2','Red SAM SA-6','Red SAM SA-3'}
	},
	hiddenground1 = {
		blue = {},
		red = {'hiddenground1-Fixed-1', 'hiddenground1-Fixed-2', 'hiddenground1-Fixed-3','hiddenground1-Fixed-4','hiddenground1-Fixed-5','hiddenground1-Fixed-6',
                'hiddenground1-Fixed-7','hiddenground1-Fixed-8','hiddenground1-Fixed-9', 'hiddenground1-Fixed-10','hiddenground1-Fixed-11','hiddenground1-Fixed-12',
                'hiddenground1-Fixed-13','hiddenground1-Fixed-14','hiddenground1-Fixed-15','hiddenground1-Fixed-16','hiddenground1-Fixed-17'}
	},
	hiddenground2 = {
		blue = {},
		red = {'hiddenground2-Fixed-1', 'hiddenground2-Fixed-2', 'hiddenground2-Fixed-3','hiddenground2-Fixed-4','hiddenground2-Fixed-5','hiddenground2-Fixed-6',
                'hiddenground2-Fixed-7','hiddenground2-Fixed-8','hiddenground2-Fixed-9','hiddenground2-Fixed-10','hiddenground2-Fixed-11'}
	},
	hiddenground3 = {
		blue = {},
		red = {'hiddenground3-Fixed-1', 'hiddenground3-Fixed-2', 'hiddenground3-Fixed-3','hiddenground3-Fixed-4','hiddenground3-Fixed-5','hiddenground3-Fixed-6',
                'hiddenground3-Fixed-7','hiddenground3-Fixed-8','hiddenground3-Fixed-9','hiddenground3-Fixed-10','hiddenground3-Fixed-11'}
	},
	hiddenground4 = {
		blue = {},
		red = {'hiddenground4-Fixed-1', 'hiddenground4-Fixed-2', 'hiddenground4-Fixed-3','hiddenground4-Fixed-4','hiddenground4-Fixed-5','hiddenground4-Fixed-6',
                'hiddenground4-Fixed-7','hiddenground4-Fixed-8','hiddenground4-Fixed-9','hiddenground4-Fixed-10','hiddenground4-Fixed-11','hiddenground4-Fixed-12',
                'hiddenground4-Fixed-13','hiddenground4-Fixed-14','hiddenground4-Fixed-15','hiddenground4-Fixed-16','hiddenground4-Fixed-17'}
	},
	hiddenground5 = {
		blue = {},
		red = {'hiddenground5-Fixed-1', 'hiddenground5-Fixed-2', 'hiddenground5-Fixed-3','hiddenground5-Fixed-4','hiddenground5-Fixed-5','hiddenground5-Fixed-6',
                'hiddenground5-Fixed-7','hiddenground5-Fixed-8','hiddenground5-Fixed-9','hiddenground5-Fixed-10','hiddenground5-Fixed-11','hiddenground5-Fixed-12',
                'hiddenground5-Fixed-13','hiddenground5-Fixed-14','hiddenground5-Fixed-15','hiddenground5-Fixed-16','hiddenground5-Fixed-17','hiddenground5-Fixed-18',
                'hiddenground5-Fixed-19','hiddenground5-Fixed-20','hiddenground5-Fixed-21','hiddenground5-Fixed-22','hiddenground5-Fixed-23','hiddenground5-Fixed-24',
                'hiddenground5-Fixed-25','hiddenground5-Fixed-26','hiddenground5-Fixed-27','hiddenground5-Fixed-28','hiddenground5-Fixed-29','hiddenground5-Fixed-30',
                'hiddenground5-Fixed-31','hiddenground5-Fixed-32'}
	},
}

local cwSwap = {
	['Red Armour Group 3']   = 'Red Armor Group6',
	['Red Armour Group 2']   = 'Red Armor Group7',
	['Red Armour Group']  = 'Red Armor Group8',
	['bluePD1']  = 'blueHAWK Coldwar',
	['blueHAWK']  = 'blueHAWK Coldwar',
	['blueArmor']  = 'blueArmor_cw',
    
}

local function deepSwap(t,s)
	for k,v in pairs(t) do
		if type(v)=='table' then
			deepSwap(v,s)
		elseif s[v] then
			t[k]=s[v]
		end
	end
end

if Era == 'Coldwar' then
	upgrades.airfield6 = upgrades.airfield6Cold
	deepSwap(upgrades,cwSwap)
end

local SamSwap = {
	['Red SAM SA-11 Fixed SamKilo']   = 'Red SAM SA-2 Fixed SamKilo',
	['Red SAM SA-11 Fixed SamHotel']   = 'Red SAM SA-2 Fixed SamHotel',
	['Red SAM SA-11 Fixed SamDelta']  = 'Red SAM SA-2 Fixed SamDelta',
	['Red SAM SA-10 Fixed SamLima']  = 'Red SAM SA-2 Fixed SamLima',
    ['Red SAM SHORAD SA-8']  = {'Red SAM AAA 4','Red SAM AAA 3'},
	['Red SAM SHORAD SA-15']  = 'Red SAM SHORAD SA-8',
	['Red SAM SHORAD SA-15 2']  = 'Red SAM SHORAD SA-8 2',
	['Red SAM SHORAD SA-15 Fixed SamDelta']  = 'Red SAM SHORAD SA-19 Fixed SamDelta',
	['Red SAM SHORAD SA-15 Fixed SamDelta 2']  = 'Red SAM SHORAD SA-8 Fixed SamDelta 2',
	['Red SAM SHORAD SA-15 Fixed SamEcho']  = 'Red SAM SHORAD SA-8 Fixed SamEcho',
	['Red SAM SHORAD SA-15 Fixed SamIndia']  = 'Red SAM SHORAD SA-13 Fixed SamIndia',
	['Red SAM SHORAD SA-15 Fixed SamJuliett']  = 'Red SAM SHORAD SA-8 Fixed SamJuliett 2',
	['Red SAM SHORAD SA-15 Fixed SamGolf']  = 'Red SAM SHORAD SA-8 Fixed SamGolf',
	['Red SAM SHORAD SA-15 Fixed SamGolf 2']  = 'Red SAM SHORAD SA-19 Fixed SamGolf 2',
	['Red SAM SHORAD SA-15 Fixed SamFoxtrot 2']  = 'Red SAM SHORAD SA-8 Fixed SamFoxtrot 2',
	['Red SAM SHORAD SA-15 Fixed SamFoxtrot']  = 'Red SAM SHORAD SA-8 Fixed SamFoxtrot',
	['Red SAM SHORAD SA-15 Fixed SamHotel']  = 'Red SAM SHORAD SA-8 Fixed SamHotel',
	['Red SAM SHORAD SA-15 Fixed SamHotel 2']  = 'Red SAM SHORAD SA-9 Fixed SamHotel 2',
	['Red SAM SHORAD SA-15 Fixed SamLima']  = 'Red SAM SHORAD SA-8 Fixed SamLima',
	['Red SAM SHORAD SA-15 Fixed SamLima 2']  = 'Red SAM SHORAD SA-8 Fixed SamLima 2',
	['Red SAM SHORAD SA-15 Fixed SamKilo']  = 'Red SAM SHORAD SA-8 Fixed SamKilo',
	['Red SAM SHORAD SA-15 Fixed SamKilo 2']  = 'Red SAM SHORAD SA-8 Fixed SamKilo 2',
}

local function deepSwapAgain(t,s)
	for k,v in pairs(t) do
		if type(v)=='table' then
			deepSwapAgain(v,s)
		elseif s[v] then
			if type(s[v])=='table' then
				t[k]=s[v][1]
				for i=2,#s[v] do
					table.insert(t,s[v][i])
				end
			else
				t[k]=s[v]
			end
		end
	end
end

if NoSA10AndSA11 == true then
	deepSwapAgain(upgrades,SamSwap)
end

bc = BattleCommander:new(filepath, 10, 60)
Hunt = true

zones = {
	
    bitburg         = ZoneCommander:new({zone='Bitburg',            side=2, level=25, upgrades=upgrades.airfieldStart,   crates={},flavorText=flavor.bitburg}),
    spangdahlem     = ZoneCommander:new({zone='Spangdahlem',        side=2, level=25, upgrades=upgrades.airfieldStart,   crates={},flavorText=flavor.spangdahlem}),
    hahn            = ZoneCommander:new({zone='Hahn',               side=1, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.hahn}),
    airrcing        = ZoneCommander:new({zone='Airracing Frankfurt',side=1, level=25, upgrades=upgrades.farp,            crates={},flavorText=flavor.airrcing}),
    mendig          = ZoneCommander:new({zone='Mendig',             side=1, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.mendig}),
    mendignorth     = ZoneCommander:new({zone='Mendig North FARP',  side=1, level=25, upgrades=upgrades.farp,            crates={},flavorText=flavor.mendignorth}),
    mendigeast      = ZoneCommander:new({zone='Mendig East FARP',   side=1, level=25, upgrades=upgrades.farp,            crates={},flavorText=flavor.mendigeast}),
    baumholderfarp  = ZoneCommander:new({zone='Baumholder FARP',    side=1, level=25, upgrades=upgrades.farp,            crates={},flavorText=flavor.baumholderfarp}),
    ramstein        = ZoneCommander:new({zone='Ramstein',           side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.ramstein}),
    baddurkheim     = ZoneCommander:new({zone='Bad Durkheim',       side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.baddurkheim}),
    walldorffarp    = ZoneCommander:new({zone='Walldorf FARP',      side=1, level=25, upgrades=upgrades.farp,            crates={},flavorText=flavor.walldorffarp}),
    walldurnfarp    = ZoneCommander:new({zone='Walldurn FARP',      side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.walldurnfarp}),
	giebelstadt     = ZoneCommander:new({zone='Giebelstadt',        side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.giebelstadt}),
    frankfurt       = ZoneCommander:new({zone='Frankfurt',          side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.frankfurt}),                                          
    gelnhausen      = ZoneCommander:new({zone='Gelnhausen',         side=1, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.gelnhausen}),
    laubachfarp     = ZoneCommander:new({zone='Laubach FARP',       side=1, level=25, upgrades=upgrades.airfield4,       crates={},flavorText=flavor.laubachfarp}), --Gütersloh
    fulda           = ZoneCommander:new({zone='Fulda',              side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.fulda}),
    fritzlar        = ZoneCommander:new({zone='Fritzlar',           side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.fritzlar}),
    salzungenfarp   = ZoneCommander:new({zone='Salzungen FARP',     side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.salzungenfarp}),
    bindersleben    = ZoneCommander:new({zone='Bindersleben',       side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.bindersleben}), 
    naumburgfarp    = ZoneCommander:new({zone='Naumburg FARP',      side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.naumburgfarp}), 
    leipzig         = ZoneCommander:new({zone='Leipzig',            side=1, level=25, upgrades=upgrades.airfield3,       crates={},flavorText=flavor.leipzig}), 
    zerbst          = ZoneCommander:new({zone='Zerbst',             side=1, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.zerbst}), -- kommit hit
    mahlwinkel      = ZoneCommander:new({zone='Mahlwinkel',         side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.mahlwinkel}), 
    briest          = ZoneCommander:new({zone='Briest',             side=1, level=25, upgrades=upgrades.farp1,           crates={},flavorText=flavor.briest}), 
    alteslager      = ZoneCommander:new({zone='Altes Lager',        side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.alteslager}), 
    wundsdorffarp   = ZoneCommander:new({zone='Wundsdorf FARP',     side=1, level=25, upgrades=upgrades.farp2,           crates={},flavorText=flavor.wundsdorffarp}), 
    tegel           = ZoneCommander:new({zone='Tegel',              side=1, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.tegel, NeutralAtStart=true}),
    werneuchen      = ZoneCommander:new({zone='Werneuchen',         side=0, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.werneuchen, NeutralAtStart=true}),
    templin         = ZoneCommander:new({zone='Templin',            side=0, level=25, upgrades=upgrades.airfield4,       crates={},flavorText=flavor.templin, NeutralAtStart=true}),
    neuruppin       = ZoneCommander:new({zone='Neuruppin',          side=0, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.neuruppin, NeutralAtStart=true}),
    hannover        = ZoneCommander:new({zone='Hannover',           side=1, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.hannover}),
    scheessel       = ZoneCommander:new({zone='Scheessel',          side=0, level=25, upgrades=upgrades.airfield3,       crates={},flavorText=flavor.scheessel, NeutralAtStart=true}),
    bremen          = ZoneCommander:new({zone='Bremen',             side=0, level=25, upgrades=upgrades.airfield1,       crates={},flavorText=flavor.bremen, NeutralAtStart=true}),
    hamburg         = ZoneCommander:new({zone='Hamburg',            side=0, level=25, upgrades=upgrades.airfield4,       crates={},flavorText=flavor.hamburg, NeutralAtStart=true}),
    braunschweig    = ZoneCommander:new({zone='Braunschweig',       side=1, level=25, upgrades=upgrades.airfield3,       crates={},flavorText=flavor.braunschweig}),
    fassberg        = ZoneCommander:new({zone='Fassberg',           side=0, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.fassberg, NeutralAtStart=true}),
    lubeck          = ZoneCommander:new({zone='Lubeck',             side=0, level=25, upgrades=upgrades.airfield6,       crates={},flavorText=flavor.lubeck, NeutralAtStart=true}),
    laage           = ZoneCommander:new({zone='Laage',              side=0, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.laage, NeutralAtStart=true}),
    tutow           = ZoneCommander:new({zone='Tutow',              side=0, level=25, upgrades=upgrades.airfield3,       crates={},flavorText=flavor.tutow, NeutralAtStart=true}),
    peenemunde      = ZoneCommander:new({zone='Peenemunde',         side=0, level=25, upgrades=upgrades.airfield3,       crates={},flavorText=flavor.peenemunde, NeutralAtStart=true}),
    garz            = ZoneCommander:new({zone='Garz',               side=0, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.garz, NeutralAtStart=true}),
    neubrandenburg  = ZoneCommander:new({zone='Neubrandenburg',     side=0, level=25, upgrades=upgrades.airfield3,       crates={},flavorText=flavor.neubrandenburg, NeutralAtStart=true}),
    parchim         = ZoneCommander:new({zone='Parchim',            side=0, level=25, upgrades=upgrades.airfield4,       crates={},flavorText=flavor.parchim, NeutralAtStart=true}),
    larz            = ZoneCommander:new({zone='Larz',               side=0, level=25, upgrades=upgrades.airfield2,       crates={},flavorText=flavor.larz, NeutralAtStart=true}),

    samalpha        = ZoneCommander:new({zone='SAM-Alpha',          side=1, level=20, upgrades=upgrades.SamAlpha,        crates={}, flavorText=flavor.samalpha}),
    sambravo        = ZoneCommander:new({zone='SAM-Bravo',          side=1, level=20, upgrades=upgrades.SamBravo,        crates={}, flavorText=flavor.SamBravo}),
    samcharlie      = ZoneCommander:new({zone='SAM-Charlie',        side=1, level=20, upgrades=upgrades.samCharlie,      crates={}, flavorText=flavor.samcharlie}),
	samdelta        = ZoneCommander:new({zone='SAM-Delta',          side=1, level=20, upgrades=upgrades.samDelta,        crates={}, flavorText=flavor.samdelta}),
	samecho         = ZoneCommander:new({zone='SAM-Echo',           side=1, level=20, upgrades=upgrades.samEcho,         crates={}, flavorText=flavor.samecho}),
	samfoxtrot      = ZoneCommander:new({zone='SAM-Foxtrot',        side=1, level=20, upgrades=upgrades.samFoxtrot,      crates={}, flavorText=flavor.samfoxtrot}),
	samgolf         = ZoneCommander:new({zone='SAM-Golf',           side=1, level=20, upgrades=upgrades.samGolf,         crates={}, flavorText=flavor.samgolf}),
	samhotel        = ZoneCommander:new({zone='SAM-Hotel',          side=1, level=20, upgrades=upgrades.samHotel,        crates={}, flavorText=flavor.samhotel}),
    samindia        = ZoneCommander:new({zone='SAM-India',          side=1, level=20, upgrades=upgrades.samIndia,        crates={}, flavorText=flavor.samindia}),
	samjuliett      = ZoneCommander:new({zone='SAM-Juliett',        side=0, level=20, upgrades=upgrades.samJuliett,      crates={}, flavorText=flavor.samjuliett, NeutralAtStart=true}),
	samkilo         = ZoneCommander:new({zone='SAM-Kilo',           side=0, level=20, upgrades=upgrades.samKilo,         crates={}, flavorText=flavor.samkilo, NeutralAtStart=true}),
	samlima         = ZoneCommander:new({zone='SAM-Lima',           side=0, level=20, upgrades=upgrades.samLima,         crates={}, flavorText=flavor.samlima, NeutralAtStart=true}),
    
    hidden1         = ZoneCommander:new({zone='Hidden1',            side=1, level=20, upgrades=upgrades.EWRMantisNet,    crates={}, flavorText=flavor.hidden1}),
    hidden2         = ZoneCommander:new({zone='Hidden2',            side=1, level=20, upgrades=upgrades.hidden2,         crates={}, flavorText=flavor.hidden2}),
    hiddenground1   = ZoneCommander:new({zone='HiddenGround1',      side=1, level=20, upgrades=upgrades.hiddenground1,  crates={}, flavorText=flavor.hiddenground1}),
    hiddenground2   = ZoneCommander:new({zone='HiddenGround2',      side=0, level=20, upgrades=upgrades.hiddenground2,  crates={}, flavorText=flavor.hiddenground2, NeutralAtStart=true}),
    hiddenground3   = ZoneCommander:new({zone='HiddenGround3',      side=0, level=20, upgrades=upgrades.hiddenground3,  crates={}, flavorText=flavor.hiddenground3, NeutralAtStart=true}),
    hiddenground4   = ZoneCommander:new({zone='HiddenGround4',      side=0, level=20, upgrades=upgrades.hiddenground4,  crates={}, flavorText=flavor.hiddenground4, NeutralAtStart=true}),
    hiddenground5   = ZoneCommander:new({zone='HiddenGround5',      side=0, level=35, upgrades=upgrades.hiddenground5,  crates={}, flavorText=flavor.hiddenground5, NeutralAtStart=true}),

    sheizefactory   = ZoneCommander:new({zone='Scheiße Factory',     side=1, level=20, upgrades=upgrades.Scheize,        crates={}, flavorText=flavor.sheizefactory}),
    chemicalfactory = ZoneCommander:new({zone='Chemical Factory',    side=1, level=20, upgrades=upgrades.Chemical,       crates={}, flavorText=flavor.chemicalfactory}),
}

zones.bitburg:addGroups({
	GroupCommander:new({name='Bitburg-supply-Hahn-blue', mission='supply', targetzone='Hahn'})
})
zones.hahn:addGroups({
	GroupCommander:new({name='Hahn-supply-Mendig-blue', mission='supply', targetzone='Mendig'}),
    GroupCommander:new({name='Hahn-supply-Baumholder FARP-blue', mission='supply', targetzone='Baumholder FARP'}),
    GroupCommander:new({name='Hahn-supply-Airracing Frankfurt-blue', mission='supply', targetzone='Airracing Frankfurt'}),
    GroupCommander:new({name='Hahn-attack-Frankfurt-Modern-Blue', mission='attack',Era='Modern', targetzone='Frankfurt'}),
    GroupCommander:new({name='Hahn-attack-Frankfurt-Coldwar-blue', mission='attack',Era='Coldwar', targetzone='Frankfurt'})
})
zones.mendig:addGroups({
    GroupCommander:new({name='Mendig-supply-Mendig North FARP-blue-Convoy', mission='supply', targetzone='Mendig North FARP', type='surface'}),
    GroupCommander:new({name='Mendig-supply-Mendig East FARP FARP-blue-Convoy', mission='supply', targetzone='Mendig East FARP', type='surface'})
    
})
zones.spangdahlem:addGroups({

})
zones.mendig:addGroups({

})
zones.mendignorth:addGroups({

})
zones.mendigeast:addGroups({
    GroupCommander:new({name='Mendig East FARP-supply-Mendig-Convoy', mission='supply', targetzone='Mendig', type='surface'}),
    GroupCommander:new({name='Mendig East FARP-supply-Mendig North FARP-Convoy', mission='supply', targetzone='Mendig North FARP', type='surface'})

})
zones.baumholderfarp:addGroups({
    GroupCommander:new({name='Baumholder-supply-Ramstein-blue', mission='supply', targetzone='Ramstein'}),
    GroupCommander:new({name='Baumholder-supply-Ramstein-SAM-Alpha', mission='supply', targetzone='Ramstein',type='surface'})

})
zones.ramstein:addGroups({
    GroupCommander:new({name='Ramstein-supply-Baumholder', mission='supply', targetzone='Baumholder FARP'}),
    GroupCommander:new({name='Ramstein-supply-Bad Durkheim', mission='supply', targetzone='Bad Durkheim'}),
    GroupCommander:new({name='Ramstein-attack-Hahn', mission='attack',MissionType='CAP', targetzone='Hahn'}),
    GroupCommander:new({name='Ramstein-CAS-attack-Hahn-Modern', mission='attack',Era='Modern', targetzone='Hahn'}),
    GroupCommander:new({name='Ramstein-CAS-attack-Hahn-Coldwar', mission='attack',Era='Coldwar', targetzone='Hahn'})
})
zones.baddurkheim:addGroups({
    GroupCommander:new({name='Bad-Durkheim-supply-ramstien', mission='supply', targetzone='Ramstein'})

})
zones.walldorffarp:addGroups({
    GroupCommander:new({name='Walldorf FARP-supply-Bad Durkheim', mission='supply', targetzone='Bad Durkheim'}),
    GroupCommander:new({name='Bad Durkheim-supply-Walldorf FARP', mission='supply', targetzone='Walldorf FARP'})
})
zones.walldurnfarp:addGroups({
    GroupCommander:new({name='Walldurn FARP-supply-Walldorf', mission='supply', targetzone='Walldorf FARP'}),
    GroupCommander:new({name='Walldurn FARP-supply-Giebelstadt-blue', mission='supply', targetzone='Giebelstadt'}),
})
zones.giebelstadt:addGroups({
    GroupCommander:new({name='Giebelstadt-supply-Walldurn FARP', mission='supply', targetzone='Walldurn FARP'}),
    GroupCommander:new({name='Giebelstadt-attack-Frankfurt', mission='attack', targetzone='Frankfurt', diceChance= 50}),
    GroupCommander:new({name='Giebelstadt-attack-Walldorf FARP-Modern', mission='attack',Era='Modern', targetzone='Walldorf FARP', spawnDelayFactor = 2}),
    GroupCommander:new({name='Giebelstadt-attack-Walldorf FARP-Coldwar', mission='attack',Era='Coldwar', targetzone='Walldorf FARP', spawnDelayFactor = 2}),

})
zones.airrcing:addGroups({
    GroupCommander:new({name='Airracing Frankfurt-supply-Frankfurt-blue', mission='supply', targetzone='Frankfurt'}),
    GroupCommander:new({name='Airracing Frankfurt-attackMendig-Modern',Era='Modern', mission='attack', targetzone='Mendig', spawnDelayFactor = 3}),
    GroupCommander:new({name='Airracing Frankfurt-attackMendig-Coldwar',Era='Coldwar', mission='attack', targetzone='Mendig', spawnDelayFactor = 3})
})
zones.frankfurt:addGroups({
    GroupCommander:new({name='Frankfurt-supply-Hahn', mission='supply', targetzone='Hahn'}),
    GroupCommander:new({name='Frankfurt-supply-Airracing-frankfurt-Convoy', mission='supply', targetzone='Airracing Frankfurt', type='surface'}),
    GroupCommander:new({name='Frankfurt-supply-Gelnhausen-blue', mission='supply', targetzone='Gelnhausen'}),
    GroupCommander:new({name='Frankfurt-patrol-Hahn', mission='patrol',MissionType='CAP', targetzone='Fritzlar'}),
    GroupCommander:new({name='Frankfurt-attack-Hahn', mission='attack',MissionType='CAP', targetzone='Hahn'}),
    GroupCommander:new({name='Frankfurt-Attack-Hahn-Modern-CAS', mission='attack',Era='Modern', targetzone='Hahn', spawnDelayFactor = 3}),
    GroupCommander:new({name='Frankfurt-Attack-Hahn-Coldwar-CAS', mission='attack',Era='Coldwar', targetzone='Hahn', spawnDelayFactor = 3}),

})
zones.fritzlar:addGroups({
    GroupCommander:new({name='Fritzlar-supply-Frankfurt', mission='supply', targetzone='Frankfurt'})

})
zones.gelnhausen:addGroups({
    GroupCommander:new({name='Gelnhausen-supply-Frankfurt', mission='supply', targetzone='Frankfurt', type='surface'}),
    GroupCommander:new({name='Gelnhausen-supply-Laubach FARP-blue', mission='supply', targetzone='Laubach FARP'}),
    GroupCommander:new({name='Gelnhausen-supply-SAM-Bravo', mission='supply', targetzone='SAM-Bravo', type='surface', spawnDelayFactor = 3})

})
zones.laubachfarp:addGroups({
    GroupCommander:new({name='Laubach FARP-supply-Gelnhausen', mission='supply', targetzone='Gelnhausen'}),
    GroupCommander:new({name='Laubach FARP-supply-Fulda-blue', mission='supply', targetzone='Fulda'}),
    GroupCommander:new({name='Laubach FARP-attack-frankfurt', mission='attack', targetzone='Frankfurt',type='surface', diceChance = 30})
})
zones.fulda:addGroups({
    GroupCommander:new({name='Fulda-supply-Laubach FARP', mission='supply', targetzone='Laubach FARP'}),
    GroupCommander:new({name='Fulda-supply-Salzungen FARP-blue', mission='supply', targetzone='Salzungen FARP'})
})
zones.salzungenfarp:addGroups({
    GroupCommander:new({name='Salzungen FARP-supply-Fulda', mission='supply', targetzone='Fulda'}),
    GroupCommander:new({name='Salzungen FARP-supply-Bindersleben-blue', mission='supply', targetzone='Bindersleben'}),
    GroupCommander:new({name='Salzungen FARP-supply-SAM-Charlie', mission='supply', targetzone='SAM-Charlie',type='surface', spawnDelayFactor = 3})
})
zones.bindersleben:addGroups({
    GroupCommander:new({name='Bindersleben-supply-Salzungen FARP', mission='supply', targetzone='Salzungen FARP'}),
    GroupCommander:new({name='Bindersleben-supply-Naumburg FARP-blue', mission='supply', targetzone='Naumburg FARP'}),
    GroupCommander:new({name='Bindersleben-patrol-Frankfurt', mission='patrol',MissionType='CAP', targetzone='Salzungen FARP'}),
    GroupCommander:new({name='Bindersleben-attack-Frankfurt', mission='attack',MissionType='CAP', targetzone='Frankfurt', condition = function() return not zones.salzungenfarp.wasBlue end}),
    GroupCommander:new({name='Bindersleben-attack-Fritzlar', mission='attack', targetzone='Fritzlar'}),
    GroupCommander:new({name='Bindersleben-patrol-Bindersleben-Coldwar-Blue', mission='patrol',Era='Coldwar', targetzone='Bindersleben'}),
    GroupCommander:new({name='Bindersleben-patrol-Bindersleben-Modern-Blue', mission='patrol',Era='Modern', targetzone='Bindersleben'}),
    GroupCommander:new({name='Bindersleben-attack-Fulda', mission='attack',targetzone='Fulda', spawnDelayFactor = 3})
})
zones.naumburgfarp:addGroups({
    GroupCommander:new({name='Naumburg FARP-supply-Bindersleben', mission='supply', targetzone='Bindersleben'}),
    GroupCommander:new({name='Naumburg FARP-supply-Leipzig-blue', mission='supply', targetzone='Leipzig'})
})
zones.leipzig:addGroups({
    GroupCommander:new({name='Leipzig-supply-Naumburg FARP', mission='supply', targetzone='Naumburg FARP'}),
    GroupCommander:new({name='Leipzig-supply-Zerbst-blue', mission='supply', targetzone='Zerbst'}),
    GroupCommander:new({name='Leipzig-attack-Bindersleben', mission='attack', targetzone='Bindersleben'}),
    GroupCommander:new({name='Leipzig-supply-SAM-Detla', mission='supply', targetzone='SAM-Delta',type='surface', spawnDelayFactor = 3}),
    GroupCommander:new({name='Leipzig-patrol-Leipzig-Coldwar-Blue', mission='patrol',Era='Coldwar', targetzone='Leipzig'}),
    GroupCommander:new({name='Leipzig-patrol-Leipzig-Modern-Blue', mission='patrol',Era='Modern', targetzone='Leipzig'}),
    GroupCommander:new({name='Leipzig-patrol-Naumburg FARP', mission='patrol',MissionType='CAP', targetzone='Naumburg FARP'}),

})
zones.zerbst:addGroups({
    GroupCommander:new({name='Zerbst-supply-Leipzig', mission='supply', targetzone='Leipzig'}),
    GroupCommander:new({name='Zerbst-supply-Mahlwinkel-blue', mission='supply', targetzone='Mahlwinkel'}),
    GroupCommander:new({name='Zerbst-attack-Bindersleben-Modern', mission='attack',MissionType='CAP',Era='Modern', targetzone='Bindersleben',condition =function() return zones.leipzig.side == 1 end})
    
})
zones.mahlwinkel:addGroups({
    GroupCommander:new({name='Mahlwinkel-supply-Zerbst', mission='supply', targetzone='Zerbst'}),
    GroupCommander:new({name='Mahlwinkel-supply-Briest', mission='supply', targetzone='Briest'}),
    GroupCommander:new({name='Mahlwinkel-supply-Braunschweig-blue', mission='supply', targetzone='Braunschweig'}),
    GroupCommander:new({name='Mahlwinkel-supply-Briest-blue', mission='supply', targetzone='Briest'}),
    GroupCommander:new({name='Mahlwinkel-attack-Bindersleben-Coldwar', mission='attack',MissionType='CAP',Era='Coldwar', targetzone='Bindersleben',condition =function() return zones.zerbst.side == 1 end}),
    GroupCommander:new({name='Mahlwinkel-attack-Zerbst-Coldwar', mission='attack',Era='Coldwar', targetzone='Zerbst'}),
    GroupCommander:new({name='Mahlwinkel-attack-Zerbst-modern', mission='attack',Era='Modern', targetzone='Zerbst'}),
    GroupCommander:new({name='Mahlwinkel-attack-Fritzlar-Modern', mission='attack',Era='Modern', targetzone='Fritzlar'}),
    GroupCommander:new({name='Mahlwinkel-supply-SAM-Echo', mission='supply', targetzone='SAM-Echo',type='surface', spawnDelayFactor = 3}),
    GroupCommander:new({name='Mahlwinkel-attack-Zerbst', mission='attack', targetzone='Zerbst',type='surface', spawnDelayFactor = 3, diceChance = 50}),
    GroupCommander:new({name='Mahlwinkel-patrol-Bindersleben-Modern', mission='patrol',MissionType='CAP', Era='Modern', targetzone='Bindersleben', condition=function() return zones.fulda.wasBlue end}),
    GroupCommander:new({name='Mahlwinkel-patrol-Bindersleben-Coldwar', mission='patrol',MissionType='CAP', Era='Coldwar', targetzone='Bindersleben', condition=function() return zones.fulda.wasBlue end}),
    GroupCommander:new({name='Mahlwinkel-patrol-Leipzig', mission='patrol', targetzone='Leipzig', condition=function() return zones.bindersleben.wasBlue end}),
    GroupCommander:new({name='Mahlwinkel-patrol-Zerbst', mission='patrol', targetzone='Zerbst', condition=function() return zones.leipzig.wasBlue end})
})
zones.braunschweig:addGroups({
    GroupCommander:new({name='Braunschweig-supply-Mahlwinkel', mission='supply', targetzone='Mahlwinkel'}),
    GroupCommander:new({name='Braunschweig-supply-Hannover-blue', mission='supply', targetzone='Hannover'})

})
zones.hannover:addGroups({
    GroupCommander:new({name='Hannover-supply-Braunschweig', mission='supply', targetzone='Braunschweig'}),
    GroupCommander:new({name='Hannover-supply-Fassberg-blue', mission='supply', targetzone='Fassberg'}),
    GroupCommander:new({name='Hannover-supply-Fassberg', mission='supply', targetzone='Fassberg', condition=function() return zones.leipzig.wasBlue end, urgent = zones.fassberg.side == 0}),
    GroupCommander:new({name='Hannover-supply-SAM-Golf', mission='supply', targetzone='SAM-Golf',type='surface', spawnDelayFactor = 2, condition=function() return CustomFlags["HannoverSupply"] ~= true end}),
    GroupCommander:new({name='Hannover-supply-SAM-Foxtrot', mission='supply', targetzone='SAM-Foxtrot',type='surface', spawnDelayFactor = 4, condition=function() return CustomFlags["HannoverSupply"] ~= true end}),
    GroupCommander:new({name='Hannover-patrol-Braunschweig-Modern', mission='patrol',MissionType='CAP',Era='Modern', targetzone='Braunschweig'}),
    GroupCommander:new({name='Hannover-patrol-Braunschweig-Coldwar', mission='patrol',MissionType='CAP',Era='Coldwar', targetzone='Braunschweig'}),
})
zones.fassberg:addGroups({
    GroupCommander:new({name='Fassberg-supply-Hannover', mission='supply', targetzone='Hannover'}),
    GroupCommander:new({name='Fassberg-supply-Scheessel', mission='supply', targetzone='Scheessel',urgent=zones.scheessel.side == 0}),
    GroupCommander:new({name='Fassberg-attack-Mahlwinkel', mission='attack',MissionType='CAP', targetzone='Mahlwinkel'}),
    GroupCommander:new({name='Fassberg-patrol-Mahlwinkel', mission='patrol',MissionType='CAP', targetzone='Mahlwinkel'}),
})
zones.scheessel:addGroups({
    GroupCommander:new({name='Scheessel-supply-Fassberg', mission='supply', targetzone='Fassberg'}),
    GroupCommander:new({name='Scheessel-supply-Hamburg-blue', mission='supply', targetzone='Hamburg'}),
    GroupCommander:new({name='Scheessel-supply-Bremen', mission='supply', targetzone='Bremen', urgent=zones.bremen.side == 0}),
    GroupCommander:new({name='Scheessel-supply-Hamburg', mission='supply', targetzone='Hamburg', urgent=zones.hamburg.side == 0})
})
zones.bremen:addGroups({
    GroupCommander:new({name='Bremen-supply-Scheessel', mission='supply', targetzone='Scheessel'}),
    GroupCommander:new({name='Bremen-supply-SAM-Hotel', mission='supply', targetzone='SAM-Hotel',type='surface', spawnDelayFactor = random(2,4)}),
})
zones.hamburg:addGroups({
    GroupCommander:new({name='Hamburg-supply-Scheessel', mission='supply', targetzone='Scheessel'}),
    GroupCommander:new({name='Hamburg-supply-Lubeck', mission='supply', targetzone='Lubeck'}),
    GroupCommander:new({name='Hamburg-supply-Lubeck-blue', mission='supply', targetzone='Lubeck'}),
    GroupCommander:new({name='Hamburg-attack-Bremen-Coldwar', mission='attack',Era='Coldwar', targetzone='Bremen'}),
    GroupCommander:new({name='Hamburg-attack-Bremen-modern', mission='attack',Era='Modern', targetzone='Bremen'}),
    GroupCommander:new({name='Hamburg-attack-Fassberg-Coldwar', mission='attack',Era='Coldwar', targetzone='Fassberg'}),
    GroupCommander:new({name='Hamburg-attack-Fassberg-modern', mission='attack',Era='Modern', targetzone='Fassberg'}),
    GroupCommander:new({name='Hamburg-attack-Hannover-Coldwar', mission='attack',Era='Coldwar', targetzone='Hannover'}),
    GroupCommander:new({name='Hamburg-attack-Hannover-modern', mission='attack',Era='Modern', targetzone='Hannover'}),
    GroupCommander:new({name='Hamburg-attack-Parchim', mission='attack', targetzone='Parchim', diceChance=50}),
    GroupCommander:new({name='Hamburg-attack-Braunschweig-Coldwar', mission='attack',Era='Coldwar', targetzone='Braunschweig'}),
    GroupCommander:new({name='Hamburg-attack-Braunschweig-modern', mission='attack',Era='Modern', targetzone='Braunschweig'}),
    GroupCommander:new({name='Hamburg-patrol-Hannover', mission='patrol',MissionType='CAP', targetzone='Hannover'}),
    GroupCommander:new({name='Hamburg-patrol-Fassberg', mission='patrol',MissionType='CAP', targetzone='Fassberg'})
})
zones.lubeck:addGroups({
    GroupCommander:new({name='Lubeck-supply-Hamburg', mission='supply', targetzone='Hamburg'}),
    GroupCommander:new({name='Lubeck-supply-Laage-blue', mission='supply', targetzone='Laage'}),
    GroupCommander:new({name='Lubeck-attack-Neuruppin-Modern', mission='attack',Era='Modern', targetzone='Neuruppin', condition=function() return not zones.laage.wasBlue end}),
    GroupCommander:new({name='Lubeck-attack-Neuruppin-Coldwar', mission='attack',Era='Coldwar', targetzone='Neuruppin', condition=function() return not zones.laage.wasBlue end}),
})
zones.briest:addGroups({
    GroupCommander:new({name='Briest-supply-Mahlwinkel', mission='supply', targetzone='Mahlwinkel'}),
    GroupCommander:new({name='Briest-supply-Altes Lager-blue', mission='supply', targetzone='Altes Lager'}),

})
zones.alteslager:addGroups({
    GroupCommander:new({name='Altes Lager-supply-Briest', mission='supply', targetzone='Briest'}),
    GroupCommander:new({name='Altes Lager-supply-Wundsdorf FARP-blue', mission='supply', targetzone='Wundsdorf FARP'}),
    GroupCommander:new({name='Altes Lager-supply-Briest-blue', mission='supply', targetzone='Briest'}),
    GroupCommander:new({name='Altes Lager-patrol-Leipzig-ColdWar', mission='patrol', MissionType='CAP', Era='Coldwar', targetzone='Leipzig'}),
    GroupCommander:new({name='Altes Lager-patrol-Leipzig-Modern', mission='patrol', MissionType='CAP', Era='Modern', targetzone='Leipzig'}),
    GroupCommander:new({name='Altes-Lager-attack-Leipzig-modern', mission='attack', Era='Modern', targetzone='Leipzig'}),
    GroupCommander:new({name='Altes-Lager-attack-Leipzig-Coldwar', mission='attack', Era='Coldwar', targetzone='Leipzig'}),
    GroupCommander:new({name='Altes Lager-attack-Leipzig-ColdWar', mission='attack', MissionType='CAP', Era='Coldwar', targetzone='Leipzig',condition=function() return zones.mahlwinkel.wasBlue end}),
    GroupCommander:new({name='Altes Lager-attack-Leipzig-Modern', mission='attack', MissionType='CAP', Era='Modern', targetzone='Leipzig',condition=function() return zones.mahlwinkel.wasBlue end}),


})
zones.wundsdorffarp:addGroups({
    GroupCommander:new({name='Wundsdorf FARP-supply-Altes Lager', mission='supply', targetzone='Altes Lager', type='surface'}),
    GroupCommander:new({name='Wundsdorf FARP-supply-Tegel', mission='supply', targetzone='Tegel', condition=function() return zones.leipzig.wasBlue end,urgent=zones.tegel.side == 0}),
    GroupCommander:new({name='Wundsdorf FARP-supply-Tegel-blue', mission='supply', targetzone='Tegel'})
})
zones.tegel:addGroups({
    GroupCommander:new({name='Tegel-supply-Neuruppin', mission='supply', targetzone='Neuruppin', condition=function() return zones.leipzig.wasBlue end, urgent=zones.neuruppin.side == 0}),
    GroupCommander:new({name='Tegel-supply-Neuruppin-blue', mission='supply', targetzone='Neuruppin'}),
    GroupCommander:new({name='Tegel-supply-Werneuchen', mission='supply', targetzone='Werneuchen',condition=function() return zones.leipzig.wasBlue end, urgent=zones.werneuchen.side == 0}),
    GroupCommander:new({name='Tegel-supply-Werneuchen-blue', mission='supply', targetzone='Werneuchen'}),
    GroupCommander:new({name='Tegel-supply-SAM-India', mission='supply', targetzone='SAM-India',type='surface', spawnDelayFactor = 3})

})
zones.werneuchen:addGroups({
    GroupCommander:new({name='Werneuchen-supply-Tegel', mission='supply', targetzone='Tegel'})
})
zones.neuruppin:addGroups({
    GroupCommander:new({name='Neuruppin-supply-Templin', mission='supply', targetzone='Templin', urgent=zones.templin.side == 0}),
    GroupCommander:new({name='Neuruppin-supply-Larz', mission='supply', targetzone='Larz', urgent=zones.larz.side == 0}),
    GroupCommander:new({name='Neuruppin-supply-Templin-blue', mission='supply', targetzone='Templin'}),
    GroupCommander:new({name='Neuruppin-supply-Larz-blue', mission='supply', targetzone='Larz'}),
    GroupCommander:new({name='Neuruppin-attack-Mahlwinkel-Coldwar', mission='attack', Era='Coldwar', targetzone='Mahlwinkel', spawnDelayFactor = random(1.5,3)}),
    GroupCommander:new({name='Neuruppin-attack-Mahlwinkel', mission='attack', Era='Modern', targetzone='Mahlwinkel', spawnDelayFactor = random(1.5,3)}),
    GroupCommander:new({name='Neuruppin-attack-Tegel-Coldwar', mission='attack', Era='Coldwar', targetzone='Tegel', spawnDelayFactor = random(1.5,3)}),
    GroupCommander:new({name='Neuruppin-attack-Tegel-Modern', mission='attack', Era='Modern', targetzone='Tegel',spawnDelayFactor = random(1.5,3)}),
    GroupCommander:new({name='Neuruppin-supply-SAM-Juliett', mission='supply', targetzone='SAM-Juliett',type='surface', spawnDelayFactor = 3})

})
zones.templin:addGroups({
    GroupCommander:new({name='Templin-supply-Neuruppin', mission='supply', targetzone='Neuruppin'})
})
zones.larz:addGroups({
    GroupCommander:new({name='Larz-supply-Parchim', mission='supply', targetzone='Parchim', urgent=zones.parchim.side == 0}),
    GroupCommander:new({name='Larz-supply-Neuruppin', mission='supply', targetzone='Neuruppin'}),
    GroupCommander:new({name='Larz-supply-Neubrandenburg-blue', mission='supply', targetzone='Neubrandenburg'}),
    GroupCommander:new({name='Larz-supply-Parchim-blue', mission='supply', targetzone='Parchim'}),
    GroupCommander:new({name='Larz-supply-Neubrandenburg', mission='supply', targetzone='Neubrandenburg', urgent=zones.neubrandenburg.side == 0}),
    GroupCommander:new({name='Larz-patrol-Mahlwinkel-Coldwar', mission='patrol',MissionType='CAP',Era='Coldwar', targetzone='Mahlwinkel', condition=function() return zones.leipzig.wasBlue end}),
    GroupCommander:new({name='Larz-patrol-Mahlwinkel-Modern', mission='patrol',MissionType='CAP',Era='Modern', targetzone='Mahlwinkel', condition=function() return zones.leipzig.wasBlue end})

})
zones.parchim:addGroups({
    GroupCommander:new({name='Parchim-supply-Larz', mission='supply', targetzone='Larz'}),
    GroupCommander:new({name='Parchim-attack-Larz', mission='attack', targetzone='Larz', diceChance = 50}),
    GroupCommander:new({name='Parchim-supply-SAM-Kilo', mission='supply', targetzone='SAM-Kilo',type='surface', spawnDelayFactor = 3})
})
zones.neubrandenburg:addGroups({
    GroupCommander:new({name='Neubrandenburg-supply-Larz', mission='supply', targetzone='Larz'}),
    GroupCommander:new({name='Neubrandenburg-supply-Tutow-blue', mission='supply', targetzone='Tutow'}),
    GroupCommander:new({name='Neubrandenburg-supply-Tutow', mission='supply', targetzone='Tutow', urgent=zones.tutow.side == 0})
})
zones.tutow:addGroups({
    GroupCommander:new({name='Tutow-supply-Garz', mission='supply', targetzone='Garz', urgent=zones.garz.side == 0}),
    GroupCommander:new({name='Tutow-supply-Laage-blue', mission='supply', targetzone='Laage'}),
    GroupCommander:new({name='Tutow-supply-Garz-blue', mission='supply', targetzone='Garz'}),
    GroupCommander:new({name='Tutow-supply-Peenemunde-blue', mission='supply', targetzone='Peenemunde'}),
    GroupCommander:new({name='Tutow-supply-Laage', mission='supply', targetzone='Laage', urgent=zones.laage.side == 0}),
    GroupCommander:new({name='Tutow-supply-Peenemunde', mission='supply', targetzone='Peenemunde', urgent=zones.peenemunde.side == 0}),
    GroupCommander:new({name='Tutow-supply-Neubrandenburg', mission='supply', targetzone='Neubrandenburg', urgent=zones.neubrandenburg.side == 0}),
    GroupCommander:new({name='Tutow-patrol-Larz', mission='patrol', targetzone='Larz'}),
    GroupCommander:new({name='Tutow-attack-Larz-Modern', mission='attack',Era='Modern', targetzone='Larz'}),
    GroupCommander:new({name='Tutow-attack-Larz-Coldwar', mission='attack',Era='Coldwar', targetzone='Larz'}),

})
zones.laage:addGroups({
    GroupCommander:new({name='Laage-supply-Tutow', mission='supply', targetzone='Tutow'}),
    GroupCommander:new({name='Laage-attack-Parchim-Coldwar', mission='attack',Era='Coldwar', targetzone='Parchim'}),
    GroupCommander:new({name='Laage-attack-Parchim-modern', mission='attack',Era='Modern', targetzone='Parchim'}),
    GroupCommander:new({name='Laage-attack-Lubeck-Coldwar', mission='attack',Era='Coldwar', targetzone='Lubeck'}),
    GroupCommander:new({name='Laage-attack-Lubeck-modern', mission='attack',Era='Modern', targetzone='Lubeck'}),
    GroupCommander:new({name='Laage-attack-Larz-Coldwar', mission='attack',Era='Coldwar', targetzone='Larz'}),
    GroupCommander:new({name='Laage-attack-Larz-modern', mission='attack',Era='Modern', targetzone='Larz'}),
    GroupCommander:new({name='Laage-supply-SAM-Lima', mission='supply', targetzone='SAM-Lima',type='surface', spawnDelayFactor = 3}),
    GroupCommander:new({name='Laage-patrol-Lubeck', mission='patrol',MissionType='CAP', targetzone='Lubeck'}),
    GroupCommander:new({name='Laage-patrol-Larz', mission='patrol',MissionType='CAP', targetzone='Larz'}),
    GroupCommander:new({name='Laage-patrol-Parchim-Coldwar',mission='patrol',MissionType='CAP',Era='Coldwar', targetzone='Parchim'}),
    GroupCommander:new({name='Laage-patrol-Parchim-Modern', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Parchim', condition=function() return zones.leipzig.wasBlue or zones.alteslager.wasBlue end})

})
zones.garz:addGroups({
    GroupCommander:new({name='Garz-attack-Neubrandenburg-Coldwar', mission='attack',Era='Coldwar', targetzone='Neubrandenburg'}),
    GroupCommander:new({name='Garz-attack-Neubrandenburg-modern', mission='attack',Era='Modern', targetzone='Neubrandenburg'}),
    GroupCommander:new({name='Garz-attack-Templin-Coldwar', mission='attack',Era='Coldwar', targetzone='Templin'}), 
    GroupCommander:new({name='Garz-attack-Templin-modern', mission='attack',Era='Modern', targetzone='Templin'}),
    GroupCommander:new({name='Garz-patrol-Neuruppin-Coldwar', mission='patrol',MissionType='CAP',Era='Coldwar', targetzone='Neuruppin', condition=function() return zones.mahlwinkel.wasBlue or zones.wundsdorffarp.wasBlue end}),
    GroupCommander:new({name='Garz-patrol-Neuruppin-Modern', mission='patrol',MissionType='CAP',Era='Modern', targetzone='Neuruppin', condition=function() return zones.mahlwinkel.wasBlue or zones.wundsdorffarp.wasBlue end})
})
zones.peenemunde:addGroups({
    GroupCommander:new({name='Peenemunde-supply-Tutow', mission='supply', targetzone='Tutow'})
})

for i,v in pairs(zones) do
	bc:addZone(v)
end

zones.bitburg.isHeloSpawn = true
zones.mendignorth.isHeloSpawn = true
zones.mendig.isHeloSpawn = true
zones.mendigeast.isHeloSpawn = true
zones.hahn.isHeloSpawn = true
zones.baddurkheim.isHeloSpawn = true
zones.walldorffarp.isHeloSpawn = true
zones.walldurnfarp.isHeloSpawn = true
zones.giebelstadt.isHeloSpawn = true
zones.laubachfarp.isHeloSpawn = true
zones.salzungenfarp.isHeloSpawn = true
zones.naumburgfarp.isHeloSpawn = true
zones.leipzig.isHeloSpawn = true
zones.wundsdorffarp.isHeloSpawn = true
zones.tegel.isHeloSpawn = true
zones.alteslager.isHeloSpawn = true
zones.scheessel.isHeloSpawn = true
zones.gelnhausen.isHeloSpawn = true
zones.airrcing.isHeloSpawn = true
zones.ramstein.isHeloSpawn = true
zones.spangdahlem.isHeloSpawn = true
zones.frankfurt.isHeloSpawn = true
zones.fulda.isHeloSpawn = true
zones.fritzlar.isHeloSpawn = true
zones.baumholderfarp.isHeloSpawn = true
zones.hannover.isHeloSpawn = true
zones.braunschweig.isHeloSpawn = true
zones.fassberg.isHeloSpawn = true
zones.bremen.isHeloSpawn = true
zones.hamburg.isHeloSpawn = true
zones.lubeck.isHeloSpawn = true
zones.laage.isHeloSpawn = true
zones.tutow.isHeloSpawn = true
zones.peenemunde.isHeloSpawn = true
zones.garz.isHeloSpawn = true
zones.neubrandenburg.isHeloSpawn = true
zones.parchim.isHeloSpawn = true
zones.mahlwinkel.isHeloSpawn = true
zones.bindersleben.isHeloSpawn = true
zones.zerbst.isHeloSpawn = true
zones.briest.isHeloSpawn = true
zones.neuruppin.isHeloSpawn = true
zones.larz.isHeloSpawn = true
zones.templin.isHeloSpawn = true
zones.werneuchen.isHeloSpawn = true



zones.bitburg.airbaseName = 'Bitburg'
zones.spangdahlem.airbaseName = 'Spangdahlem'
zones.hahn.airbaseName = 'Hahn'
zones.mendig.airbaseName = 'Mendig'
zones.mendignorth.airbaseName = 'H FRG 34'
zones.mendigeast.airbaseName = 'H FRG 40'
zones.frankfurt.airbaseName = 'Frankfurt'	
zones.fritzlar.airbaseName = 'Fritzlar'	
zones.baumholderfarp.airbaseName = 'H FRG 51'
zones.airrcing.airbaseName = 'Airracing Frankfurt'
zones.ramstein.airbaseName = 'Ramstein'
zones.baddurkheim.airbaseName = 'Bad Durkheim'
zones.walldorffarp.airbaseName = 'Walldorf'
zones.walldurnfarp.airbaseName = 'H FRG 47'
zones.giebelstadt.airbaseName = 'Giebelstadt'
zones.gelnhausen.airbaseName = 'Gelnhausen'
zones.laubachfarp.airbaseName = 'H FRG 38'
zones.fulda.airbaseName = 'Fulda'
zones.salzungenfarp.airbaseName = 'H Med GDR 14'
zones.bindersleben.airbaseName = 'Bindersleben'
zones.naumburgfarp.airbaseName = 'H GDR 25'
zones.leipzig.airbaseName = 'Leipzig Halle'
zones.zerbst.airbaseName = 'Zerbst'
zones.mahlwinkel.airbaseName = 'Mahlwinkel'	
zones.alteslager.airbaseName = 'Altes Lager'
zones.wundsdorffarp.airbaseName = 'H GDR 24'
zones.tegel.airbaseName = 'Tegel'
zones.werneuchen.airbaseName = 'Werneuchen'
zones.neuruppin.airbaseName = 'Neuruppin'
zones.templin.airbaseName = 'Templin'
zones.larz.airbaseName = 'Larz'
zones.parchim.airbaseName = 'Parchim'
zones.neubrandenburg.airbaseName = 'Neubrandenburg'
zones.tutow.airbaseName = 'Tutow'
zones.laage.airbaseName = 'Laage'
zones.peenemunde.airbaseName = 'Peenemunde'
zones.garz.airbaseName = 'Garz'
zones.braunschweig.airbaseName = 'Braunschweig'	
zones.hannover.airbaseName = 'Hannover'	
zones.fassberg.airbaseName = 'Fassberg'	
zones.scheessel.airbaseName = 'H FRG 17'
zones.bremen.airbaseName = 'Bremen'	
zones.hamburg.airbaseName = 'Hamburg'	
zones.lubeck.airbaseName = 'Lubeck'	
zones.briest.airbaseName = 'Briest'


bc:addConnection("Bitburg","Spangdahlem")
bc:addConnection("Spangdahlem","Hahn")
bc:addConnection("Hahn","Airracing Frankfurt")
bc:addConnection("Hahn","Mendig")
bc:addConnection("Mendig","Mendig North FARP")
bc:addConnection("Mendig North FARP","Mendig East FARP")
bc:addConnection("Hahn","Baumholder FARP")
bc:addConnection("Baumholder FARP","SAM-Alpha")
bc:addConnection("Hahn","Airracing Frankfurt")
bc:addConnection("Airracing Frankfurt","Frankfurt")
bc:addConnection("Frankfurt","Fritzlar")
bc:addConnection("Fritzlar","Scheiße Factory")
bc:addConnection("Frankfurt","Gelnhausen")
bc:addConnection("Gelnhausen","SAM-Bravo")
bc:addConnection("Gelnhausen","Laubach FARP")
bc:addConnection("Laubach FARP","Fulda")
bc:addConnection("Fulda","Salzungen FARP")
bc:addConnection("Salzungen FARP","SAM-Charlie")
bc:addConnection("Salzungen FARP","Bindersleben")
bc:addConnection("Bindersleben","Naumburg FARP")
bc:addConnection("Naumburg FARP","Leipzig")
bc:addConnection("Leipzig","Zerbst")
bc:addConnection("Leipzig","SAM-Delta")
bc:addConnection("Leipzig","Chemical Factory")
bc:addConnection("Zerbst","Mahlwinkel")
bc:addConnection("Mahlwinkel","Braunschweig")
bc:addConnection("Mahlwinkel","SAM-Echo")
bc:addConnection("Braunschweig","Hannover")
bc:addConnection("Hannover","Fassberg")
bc:addConnection("Hannover","SAM-Golf")
bc:addConnection("Hannover","SAM-Foxtrot")
bc:addConnection("Fassberg","Scheessel")
bc:addConnection("Scheessel","Bremen")
bc:addConnection("Scheessel","Hamburg")
bc:addConnection("Scheessel","SAM-Hotel")
bc:addConnection("Bremen","SAM-Hotel")
bc:addConnection("Hamburg","Lubeck")
bc:addConnection("Mahlwinkel","Briest")
bc:addConnection("Briest","Altes Lager")
bc:addConnection("Briest","SAM-India")
bc:addConnection("Altes Lager","Wundsdorf FARP")
bc:addConnection("Wundsdorf FARP","Tegel")
bc:addConnection("Tegel","Werneuchen")
bc:addConnection("Tegel","Neuruppin")
bc:addConnection("Neuruppin","Templin")
bc:addConnection("Neuruppin","Larz")
bc:addConnection("Larz","Parchim")
bc:addConnection("Parchim","SAM-Kilo")
bc:addConnection("Larz","Neubrandenburg")
bc:addConnection("Neubrandenburg","Tutow")
bc:addConnection("Tutow","Laage")
bc:addConnection("Laage","SAM-Lima")
bc:addConnection("Tutow","Peenemunde")
bc:addConnection("Tutow","Garz")

bc:addConnection("Baumholder FARP","Ramstein")
bc:addConnection("Ramstein","Bad Durkheim")
bc:addConnection("Bad Durkheim","Walldorf FARP")
bc:addConnection("Walldorf FARP","Walldurn FARP")
bc:addConnection("Walldurn FARP","Giebelstadt")



zones.samalpha:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamalpha')


zones.sambravo:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesambravo')

zones.samcharlie:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamcharlie')

zones.samdelta:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamdelta')

zones.samecho:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamecho')

zones.samfoxtrot:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamfoxtrot')

zones.samgolf:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamgolf')

zones.samhotel:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamhotel')

zones.samindia:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamindia')

zones.samjuliett:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamjuliett')

zones.samkilo:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamkilo')

zones.samlima:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemy SAM destroyed\n+200 credits',20)
end, 'disablesamlima')

zones.sheizefactory:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Scheiße Factory is now only Scheiße\n+500 credits',20)
end, 'disablesheizefactory')

zones.chemicalfactory:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'chemicalfactory Factory destroyed.\n+500 credits',20)
end, 'disableschemicalfactory')

------------------------------ capture attack events ------------------------------


Group.getByName('Hahn-arty-Attack-Group'):destroy()
zones.hahn:registerTrigger('captured', function(_, zone)
    if zone ~= zones.hahn then return end
	local kr = bc:getZoneByName('Hahn')
	if kr.side == 2 and not CustomFlags['hahncaptured'] then
		if not IsGroupActive('Hahn-arty-Attack-Group') then
			Respawn.Group('Hahn-arty-Attack-Group')
            CustomFlags['hahncaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "Hahn is under attack by enemy Artillery!\n\nBrace!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 180)
		end
	
    timer.scheduleFunction(function()
    trigger.action.outTextForCoalition(2, [[We found the enemy Artillery!

Take it out before they fire again!   

Coordinates:
MGRS: 32 U MA 15621 72886
Lat long: N 50°18'07" E 07°48'54"
Lat long Decimal Minutes: N 50°18.123' E 07°48.910'

Elevation: 234 feet]], 30)
    end, {}, timer.getTime() + math.random(360, 480))
end
end, 'hahncaptured')


Group.getByName('Salzungen FARP-attack-Fulda'):destroy()
zones.fulda:registerTrigger('captured', function(_, zone)
    if zone ~= zones.fulda then return end
	local kr = bc:getZoneByName('Fulda')
	if kr.side == 2 and not CustomFlags['fuldacaptured'] then
		if not IsGroupActive('Salzungen FARP-attack-Fulda') then
			Respawn.Group('Salzungen FARP-attack-Fulda')
            CustomFlags['fuldacaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "3 enemy attack helicopters are inbound Fulda from Salzungen FARP!\n\nTake them out before they start firing!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 60)
		end
	end
end, 'fuldacaptured')

Group.getByName('Leipzig-Sead-Attack'):destroy()
Group.getByName('Leipzig-Sead-Attack-Coldwar'):destroy()
Group.getByName('Leipzig-bomb-Attack'):destroy()
zones.leipzig:registerTrigger('captured', function(_, zone)
    if zone ~= zones.leipzig then return end
	local kr = bc:getZoneByName('Leipzig')
	if kr.side == 2 and not CustomFlags['leipzigcaptured'] then
		if not IsGroupActive('Leipzig-Sead-Attack') then
			Respawn.Group('Leipzig-bomb-Attack')
            local seadGrp = (Era=='Coldwar') and 'Leipzig-Sead-Attack-Coldwar' or 'Leipzig-Sead-Attack'
            Respawn.Group(seadGrp)
            CustomFlags['leipzigcaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "The enemy have launched an assault on Leipzig\n\n2 bombers escorted by 2 unknown jets!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 10)
		end
	end
end, 'leipzigcaptured')

Group.getByName('Braunschweig-attack-Mahlwinkel-troops'):destroy()
Group.getByName('Mahlwinkel-arty-Attack-Group'):destroy()
Group.getByName('Mahlwinkel-CAS-Attack-Group'):destroy()
Group.getByName('Mahlwinkel-CAS-Attack-Group 2'):destroy()
zones.mahlwinkel:registerTrigger('captured', function(_, zone)
    if zone ~= zones.mahlwinkel then return end
	local kr = bc:getZoneByName('Mahlwinkel')
	if kr.side == 2 and not CustomFlags['mahlwinkelcaptured'] then
		if not IsGroupActive('Braunschweig-attack-Mahlwinkel-troops') then
			Respawn.Group('Braunschweig-attack-Mahlwinkel-troops')
			Respawn.Group('Mahlwinkel-arty-Attack-Group')
			Respawn.Group('Mahlwinkel-CAS-Attack-Group')
			Respawn.Group('Mahlwinkel-CAS-Attack-Group 2')
            CustomFlags['mahlwinkelcaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "The enemy have launched an assault on Mahlwinkel!!\n\nThey have deployed long range Artillery and unknown bandits inbound!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 60)
		end
	
    timer.scheduleFunction(function()
    trigger.action.outTextForCoalition(2, [[We found the enemy Artillery!

Take it out before they fire again!   

Coordinates:
MGRS: 32 U PD 64017 06031
Lat long: N 52°22'47" E 11°24'35"
Lat long Decimal Minutes: N 52°22.796' E 11°24.587'

Elevation: 234 feet]], 30)
        end, {}, timer.getTime() + math.random(360, 480))
    end
end, 'mahlwinkelcaptured')

Group.getByName('Breman-Forces-attack 2'):destroy()
Group.getByName('Breman-Forces-attack'):destroy()
zones.bremen:registerTrigger('captured', function(_, zone)
    if zone ~= zones.bremen then return end
	local kr = bc:getZoneByName('Bremen')
	if kr.side == 2 and not CustomFlags['bremencaptured'] then
		if not IsGroupActive('Breman-Forces-attack') then
			Respawn.Group('Breman-Forces-attack')
			Respawn.Group('Breman-Forces-attack 2')
            CustomFlags['bremencaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "AMBUSH!!!!!\n\nEnemy insurgents are emerging from Bremen!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 10)
		end
	end
end, 'bremencaptured')

Group.getByName('Tegel-Attack-Group'):destroy()
zones.larz:registerTrigger('captured', function(_, zone)
    if zone ~= zones.tegel then return end
	local kr = bc:getZoneByName('Tegel')
	if kr.side == 2 and not CustomFlags['tegelcaptured'] then
		if not IsGroupActive('Tegel-Forces-attack') and zones.neuruppin.wasBlue then
			Respawn.Group('Tegel-Forces-attack')
            CustomFlags['tegelcaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "Brace!!\n\nWe have detected artillery shells inbound for Neuruppin!!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 60)
		end
	end
end, 'tegelcaptured')

Group.getByName('Neuruppin-Attack-Group'):destroy()
zones.larz:registerTrigger('captured', function(_, zone)
    if zone ~= zones.neuruppin then return end
	local kr = bc:getZoneByName('Neuruppin')
	if kr.side == 2 and not CustomFlags['neuruppincaptured'] then
		if not IsGroupActive('Neuruppin-Forces-attack') then
            if zones.larz.side == 1 then
			Respawn.Group('Neuruppin-Forces-attack')
            end
            if zones.templin.side == 1 then
            Respawn.Group('Neuruppin-Attack-Group-2')
            end
            CustomFlags['neuruppincaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "Brace!!\n\nEnemy have launched ground assault!\nThey are on route toward Neuruppin", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 60)
		end
	end
end, 'neuruppincaptured')

Group.getByName('Larz-Forces-attack'):destroy()
zones.larz:registerTrigger('captured', function(_, zone)
    if zone ~= zones.larz then return end
	local kr = bc:getZoneByName('Larz')
	if kr.side == 2 and not CustomFlags['larzcaptured'] then
		if not IsGroupActive('Larz-Forces-attack') then
			Respawn.Group('Larz-Forces-attack')
            CustomFlags['larzcaptured'] = true
            timer.scheduleFunction(function()
            trigger.action.outTextForCoalition(2, "Brace!!\n\nEnemy have fired scuds toward Larz!!", 30)
            trigger.action.outSoundForCoalition(2, 'WarningSound.ogg')
            end, {}, timer.getTime() + 60)
		end
	end
end, 'larzcaptured')

missions = {
        ["Baumholder FARP"] = {	
        zone = "Baumholder FARP",
        missionGroup = "BaumholderFARPEscortGroup",
        menuTitle = "Baumholder FARP: Ground Escort",
        missionTitle = "Baumholder FARP: Ground Escort",
        TargetZone = "Ramstein",
        radius = 2500,
        MissionType = "Escort",
        flag = 101
    },
    ["Bad Durkheim"] = {	
        zone = "Bad Durkheim",
        missionGroup = "BadDurkheimEscortGroup",
        menuTitle = "Bad Durkheim: Ground Escort",
        missionTitle = "Bad Durkheim: Ground Escort",
        TargetZone = "Walldorf FARP",
		radius = 2500,
        MissionType = "Escort",
		flag = 101
    },
    ["Gelnhausen"] = {	
        zone = "Gelnhausen",
        missionGroup = "GelnhausenEscortGroup",
        menuTitle = "Gelnhausen: Ground Escort",
        missionTitle = "Gelnhausen: Ground Escort",
        TargetZone = "Walldorf FARP",
		radius = 2500,
        MissionType = "Escort",
		flag = 111
    },
    ["Walldurn FARP"] = {	
        zone = "Walldurn FARP",
        missionGroup = "WalldurnFarpEscortGroup",
        menuTitle = "WalldurnFarp: Ground Escort",
        missionTitle = "WalldurnFarp: Ground Escort",
        TargetZone = "Giebelstadt",
        radius = 2500,
        MissionType = "Escort",
		flag = 121
    },
    ["Laubach FARP"] = {	
        zone = "Laubach FARP",
        missionGroup = "LaubachFARPEscortGroup",
        menuTitle = "Laubach FARP: Ground Escort",
        missionTitle = "Laubach FARP: Ground Escort",
        TargetZone = "Fulda",
        radius = 2500,
        MissionType = "Escort",
		flag = 131
    },
    ["Altes Lager"] = {	
        zone = "Altes Lager",
        missionGroup = "AltesLagerEscortGroup",
        menuTitle = "Altes Lager: Ground Escort",
        missionTitle = "Altes Lager: Ground Escort",
        TargetZone = "Fulda",
        radius = 2500,
        MissionType = "Escort",
		flag = 141
    },
    ["Wundsdorf FARP"] = {	
        zone = "Wundsdorf FARP",
        missionGroup = "WundsdorfFARPEscortGroup",
        menuTitle = "Wundsdorf FARP: Ground Escort",
        missionTitle = "Wundsdorf FARP: Ground Escort",
        TargetZone = "Tegel",
        radius = 2500,
        MissionType = "Escort",
		flag = 151
    },
    ["Tegel"] = {	
        zone = "Tegel",
        missionGroup = "TegelEscortGroup",
        menuTitle = "Tegel: Ground Escort",
        missionTitle = "Tegel: Ground Escort",
        TargetZone = "Werneuchen",
        radius = 2500,
        MissionType = "Escort",
        flag = 161
    },
    ["Scheessel"] = {	
        zone = "Scheessel",
        missionGroup = "ScheesselEscortGroup",
        menuTitle = "Scheessel: Ground Escort",
        missionTitle = "Scheessel: Ground Escort",
        TargetZone = "Bremen",
        radius = 2500,
        MissionType = "Escort",
        flag = 171
    },
    ["Naumburg FARP"] = {	
        zone = "Naumburg FARP",
        missionGroup = "NaumburgFARPEscortGroup",
        menuTitle = "Naumburg FARP: Ground Escort",
        missionTitle = "Naumburg FARP: Ground Escort",
        TargetZone = "Leipzig",
        radius = 2500,
        MissionType = "Escort",
        flag = 181
    },
}
for _, data in pairs(missions) do
    if data.missionGroup and Group.getByName(data.missionGroup) then
        Group.getByName(data.missionGroup):destroy()
    else
        env.info("Mission group not found: " .. data.missionGroup)
        trigger.action.outText("Mission group not found: " .. data.missionGroup, 15)
    end
end
function SpawnFriendlyAssets()

    if zones.hannover.wasBlue and IsGroupActive('Grisha Fixed') then
        destroyGroupIfActive('Grisha Fixed')
    end
end
timer.scheduleFunction(SpawnFriendlyAssets, {}, timer.getTime() + 5)


function checkAndDisableFriendlyZones()

    if zones.leipzig.wasBlue then
        if not IsGroupActive('Leipzig-Awacs') and IsGroupActive('awacs') then
            Respawn.Group('Leipzig-Awacs')
            Respawn.Group('Arco12')
            Respawn.Group('Texaco22')
            destroyGroupIfActive('awacs')
            destroyGroupIfActive('Arco1')
            destroyGroupIfActive('Texaco2')

        end
        if zones.hahn.active and zones.hahn.wasBlue then zones.hahn:disableFriendlyZone() end
        if zones.mendig.active and zones.mendig.wasBlue then zones.mendig:disableFriendlyZone() end
        if zones.mendigeast.active and zones.mendigeast.wasBlue then zones.mendigeast:disableFriendlyZone() end
        if zones.mendignorth.active and zones.mendignorth.wasBlue then zones.mendignorth:disableFriendlyZone() end
        if zones.baumholderfarp.active and zones.baumholderfarp.wasBlue then zones.baumholderfarp:disableFriendlyZone() end
        if zones.ramstein.active and zones.ramstein.wasBlue then zones.ramstein:disableFriendlyZone() end
        if zones.baddurkheim.active and zones.baddurkheim.wasBlue then zones.baddurkheim:disableFriendlyZone() end
        if zones.walldorffarp.active and zones.walldorffarp.wasBlue then zones.walldorffarp:disableFriendlyZone() end
        if zones.walldurnfarp.active and zones.walldurnfarp.wasBlue then zones.walldurnfarp:disableFriendlyZone() end
        if zones.giebelstadt.active and zones.giebelstadt.wasBlue then zones.giebelstadt:disableFriendlyZone() end
        if zones.airrcing.active and zones.airrcing.wasBlue then zones.airrcing:disableFriendlyZone() end
        if zones.gelnhausen.active and zones.gelnhausen.wasBlue then zones.gelnhausen:disableFriendlyZone() end
        if zones.laubachfarp.active and zones.laubachfarp.wasBlue then zones.laubachfarp:disableFriendlyZone() end
        if zones.fulda.active and zones.fulda.wasBlue then zones.fulda:disableFriendlyZone() end
        if zones.salzungenfarp.active and zones.salzungenfarp.wasBlue then zones.salzungenfarp:disableFriendlyZone() end
        if zones.fritzlar.active and zones.fritzlar.wasBlue then zones.fritzlar:disableFriendlyZone() end
        if zones.frankfurt.active and zones.frankfurt.wasBlue then zones.frankfurt:disableFriendlyZone() end
        if not zones.samkilo.firstCaptureByRed then zones.samkilo:MakeZoneRedAndUpgrade() end
        if not zones.samjuliett.firstCaptureByRed then zones.samjuliett:MakeZoneRedAndUpgrade() end
        if not zones.samlima.firstCaptureByRed then zones.samlima:MakeZoneRedAndUpgrade() end
    end
    if zones.tegel.wasBlue and zones.hannover.wasBlue then
        if zones.naumburgfarp.active and zones.naumburgfarp.wasBlue then zones.naumburgfarp:disableFriendlyZone() end
        if zones.bindersleben.active and zones.bindersleben.wasBlue then zones.bindersleben:disableFriendlyZone() end
        if zones.leipzig.active and zones.leipzig.wasBlue then zones.leipzig:disableFriendlyZone() end
    end
    if zones.frankfurt.wasBlue then
        if zones.bitburg.active and zones.bitburg.wasBlue then zones.bitburg:disableFriendlyZone() end
        if zones.spangdahlem.active and zones.spangdahlem.wasBlue then zones.spangdahlem:disableFriendlyZone() end
        if zones.ramstein.active and zones.ramstein.wasBlue then zones.ramstein:disableFriendlyZone() end
        if zones.baddurkheim.active and zones.baddurkheim.wasBlue then zones.baddurkheim:disableFriendlyZone() end
        if zones.mendigeast.active and zones.mendigeast.wasBlue then zones.mendigeast:disableFriendlyZone() end
        if zones.mendignorth.active and zones.mendignorth.wasBlue then zones.mendignorth:disableFriendlyZone() end
        if zones.walldorffarp.active and zones.walldorffarp.wasBlue then zones.walldorffarp:disableFriendlyZone() end
        if zones.walldurnfarp.active and zones.walldurnfarp.wasBlue then zones.walldurnfarp:disableFriendlyZone() end
        if zones.giebelstadt.active and zones.giebelstadt.wasBlue then zones.giebelstadt:disableFriendlyZone() end
    end
    if  zones.frankfurt.side == 1 and not zones.spangdahlem.active then
        zones.spangdahlem:RecaptureBlueZone()
        zones.ramstein:RecaptureBlueZone()
        zones.baddurkheim:RecaptureBlueZone()
        zones.mendigeast:RecaptureBlueZone()
        zones.mendignorth:RecaptureBlueZone()
        zones.walldorffarp:RecaptureBlueZone()
        zones.walldurnfarp:RecaptureBlueZone()
        zones.giebelstadt:RecaptureBlueZone()
    end
    if zones.chemicalfactory.active and zones.chemicalfactory.side == 1 and (not CustomFlags["ChemOneTimeThing"]) then
        zones.chemicalfactory:MakeZoneSideAndUpgraded()
        if zones.sheizefactory.active and zones.sheizefactory.side == 1 then
            zones.sheizefactory:MakeZoneSideAndUpgraded()
        end
        CustomFlags["ChemOneTimeThing"] = true
    end

    if zones.frankfurt.wasBlue and not CustomFlags['hiddenground2'] then
            zones.hiddenground2:MakeZoneRedAndUpgrade()
            CustomFlags['hiddenground2'] = true
    end
    if zones.bindersleben.wasBlue and not CustomFlags['hiddenground3'] then
            zones.hiddenground3:MakeZoneRedAndUpgrade()
            CustomFlags['hiddenground3'] = true
    end
    if zones.zerbst.wasBlue and not CustomFlags['hiddenground4'] then
            zones.hiddenground4:MakeZoneRedAndUpgrade()
            CustomFlags['hiddenground4'] = true
    end
    if zones.tegel.wasBlue and not CustomFlags['hiddenground5'] then
            zones.hiddenground5:MakeZoneRedAndUpgrade()
            CustomFlags['hiddenground5'] = true
    end
    if zones.baddurkheim.wasBlue and zones.ramstein.wasBlue and zones.giebelstadt.wasBlue and zones.hiddenground1.side == 1 then
        zones.hiddenground1:DestroyHiddenZone()
    end
    if zones.bindersleben.wasBlue and zones.hiddenground2.side == 1 then
        zones.hiddenground2:DestroyHiddenZone()
    end
    if zones.zerbst.wasBlue and zones.hiddenground3.side == 1 then
        zones.hiddenground3:DestroyHiddenZone()
    end
    if zones.werneuchen.wasBlue and zones.hiddenground4.side == 1 then
        zones.hiddenground4:DestroyHiddenZone()
    end
end
timer.scheduleFunction(checkAndDisableFriendlyZones, {}, timer.getTime() + 10)



local missionCompleted = false
local checkMissionComplete = function(event, sender)
	if missionCompleted then return end
	local done = true
	for i, v in ipairs(bc:getZones()) do
		if not v.zone:lower():find("hidden") and v.side == 1 then
			done = false
			break
		end
	end
	if done then
		missionCompleted = true
		trigger.action.setUserFlag(180, true)
		trigger.action.outText("Enemy has been defeated.\n\nMission Complete.\n\nYou can restart the mission from the radio menu.", 120)


		timer.scheduleFunction(function()
			trigger.action.outSoundForCoalition(2, "BH.ogg")
		end, {}, timer.getTime() + 5)

			local subMenu = missionCommands.addSubMenuForCoalition(2, "Restart and Reset?", nil)
			missionCommands.addCommandForCoalition(2, "Yes", subMenu, function()
					Utils.saveTable(bc.saveFile, 'zonePersistance', {})
					if resetSaveFileAndFarp then
					resetSaveFileAndFarp()
					end
				trigger.action.outText("Restarting now..", 120)
				timer.scheduleFunction(function()
					trigger.action.setUserFlag(181, true)
				end, {}, timer.getTime() + 5)
			end)
			missionCommands.addCommandForCoalition(2, "No", subMenu, function()
		end)
	end
end

for i,v in ipairs(bc:getZones()) do
	v:registerTrigger('lost', checkMissionComplete, 'missioncompleted')
end


SCHEDULER:New(nil,function()
	checkMissionComplete(nil, nil)
    if Era == 'Coldwar' then
    bc:roamGroupsToLocalSubZone({
        "Red Armor Group6 #",
        "Red Armor Group7 #",
        "Red Armor Group8 #",
		"Red SAM AAA #",
		"Red SAM SHORAD SA-15 #",
		"Red SAM SHORAD SA-8 #",
		"Red SAM SHORAD SA-19 #",
	}, 30)
else
	bc:roamGroupsToLocalSubZone({
		"Red Armour Group #",
        "Red Armour Group 2 #",
        "Red Armour Group 3 #",
		"Red SAM AAA #",
		"Red SAM SHORAD SA-15 #",
		"Red SAM SHORAD SA-8 #",
		"Red SAM SHORAD SA-19 #",
	}, 30)
end
end,{},5,0)

-- SHOP --
local upgradeMenu = nil
bc:registerShopItem('supplies2', 'Resupply friendly Zone', 200, function(sender)
    if upgradeMenu then
        return 'Choose zone from F10 menu'
    end

    local upgradeZone = function(target)
        if upgradeMenu then
            local zn = bc:getZoneByName(target)
            if zn and zn.side == 2 then
                zn:upgrade()
            else
                return 'Zone not friendly'
            end
            
            upgradeMenu = nil
        end
    end


    upgradeMenu = bc:showTargetZoneMenu(2, 'Select Zone to resupply', upgradeZone, 2, true)
    
    trigger.action.outTextForCoalition(2, 'Supplies prepared. Choose zone from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 2 then
        params.zone:upgrade()
    else
        return 'Can only target friendly zone'
    end
end)

local fullyUpgradeMenu=nil
bc:registerShopItem('supplies','Fully Upgrade Friendly Zone',1000,
function(sender)
    if fullyUpgradeMenu then
        return'Choose zone from F10 menu to fully upgrade'
    end
    local fullyUpgradeZone
    fullyUpgradeZone=function(target)
        if fullyUpgradeMenu then
            local zn=bc:getZoneByName(target)
            if zn and zn.side==2 then
                local function repairs()
                    local n=0
                    for _,v in pairs(zn.built)do
                        local g=Group.getByName(v)
                        if g then
                            if g:getSize()<g:getInitialSize() then n=n+1
                            else
                                for _,u in ipairs(g:getUnits())do
                                    if u and u:isExist() and u:getLife()<u:getLife0() then n=n+1 break end
                                end
                            end
                        end
                    end
                    return n
                end
                local upgs=zn.upgrades.blue or{}
                local todo=repairs()+(#upgs-Utils.getTableSize(zn.built))
                if todo>0 then
                    local function loop()
                        local before=Utils.getTableSize(zn.built)
                        zn:upgrade()
                        local now=Utils.getTableSize(zn.built)
                        if repairs()>0 or now<#upgs then
                            timer.scheduleFunction(loop,{},timer.getTime()+2)
                        else
                            trigger.action.outTextForCoalition(2,target..' is now fully upgraded!',15)
                        end
                    end
                    loop()
                else
                    trigger.action.outTextForCoalition(2,target..' is already fully upgraded',15)
                end
            else
                return'Zone not friendly'
            end
            fullyUpgradeMenu=nil
        end
    end
    fullyUpgradeMenu=bc:showTargetZoneMenu(2,'Select Zone to Fully Upgrade',fullyUpgradeZone,2,true)
    trigger.action.outTextForCoalition(2,'Preparing to full upgrade and repair. Choose zone from F10 menu',15)
end,
function(sender,params)
    if params.zone and params.zone.side==2 then
        local zn=params.zone
        local upgs=zn.upgrades.blue or{}
        local function repairs()
            local n=0
            for _,v in pairs(zn.built)do
                local g=Group.getByName(v)
                if g then
                    if g:getSize()<g:getInitialSize() then n=n+1
                    else
                        for _,u in ipairs(g:getUnits())do
                            if u and u:isExist() and u:getLife()<u:getLife0() then n=n+1 break end
                        end
                    end
                end
            end
            return n
        end
        local function loop()
            local before=Utils.getTableSize(zn.built)
            zn:upgrade()
            local now=Utils.getTableSize(zn.built)
            if repairs()>0 or now<#upgs then
                timer.scheduleFunction(loop,{},timer.getTime()+2)
			else
				trigger.action.outTextForCoalition(2,params.zone.zone..' is now fully upgraded!',15)
			end
        end
        loop()
    else
        return'Can only target friendly zone'
    end
end)
Group.getByName('ca-tanks-Coldwar'):destroy()
Group.getByName('ca-tanks'):destroy()
tanksMenu = nil
bc:registerShopItem('armor', 'Deploy armor (for combined arms) ', 300, function(sender)
	
	if tanksMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployTanks = function(target)
		if tanksMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup((Era == 'Coldwar') and 'ca-tanks-Coldwar' or 'ca-tanks')
			
			tanksMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..target, 15)
		end
	end
	
	tanksMenu = bc:showTargetZoneMenu(2, 'Deploy armor (Choose friendly zone) ', deployTanks, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup((Era == 'Coldwar') and 'ca-tanks-Coldwar' or 'ca-tanks')
		trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
Group.getByName('ca-arty'):destroy()
artyMenu = nil
bc:registerShopItem('artillery', 'Deploy artillery (for combined arms) ', 200, function(sender)
	
	if artyMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployArty = function(target)
		if artyMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-arty')
			
			artyMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..target, 15)
		end
	end
	
	artyMenu = bc:showTargetZoneMenu(2, 'Deploy artillery (Choose friendly zone) ', deployArty, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu ', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-arty')
		trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
Group.getByName('ca-recon'):destroy()
reconMenu = nil
bc:registerShopItem('recon', 'Deploy recon group (for combined arms)', 50, function(sender)
	
	if reconMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployRecon = function(target)
		if reconMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-recon')
			
			reconMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..target, 15)
		end
	end
	
	reconMenu = bc:showTargetZoneMenu(2, 'Deploy recon group (Choose friendly zone)', deployRecon, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-recon')
		trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
Group.getByName('ca-airdef'):destroy()
airdefMenu = nil
bc:registerShopItem('airdef', 'Deploy air defence (for combined arms)', 150, function(sender)
	
	if airdefMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployAirDef = function(target)
		if airdefMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-airdef')
			
			airdefMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..target, 15)
		end
	end
	
	airdefMenu = bc:showTargetZoneMenu(2, 'Deploy air defence (Choose friendly zone)', deployAirDef, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-airdef')
		trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)


local jtacDrones
local jtacTargetMenu = nil
for _,n in ipairs({'jtacDroneColdwar1','jtacDroneColdwar2','jtacDrone1','jtacDrone2'}) do
    local g = Group.getByName(n)
    if g then g:destroy() end
end
if Era == 'Coldwar' then
jtacDrones = {JTAC:new({name = 'jtacDroneColdwar1'}),JTAC:new({name = 'jtacDroneColdwar2'})}
else
jtacDrones = {JTAC:new({name = 'jtacDrone1'}),JTAC:new({name = 'jtacDrone2'})}
end
bc:registerShopItem('jtac','MQ-9 Reaper JTAC mission',150,function(sender)
	if jtacTargetMenu then return 'Choose target zone from F10 menu' end
	local spawnAndOrbit = function(target)
		if jtacTargetMenu then
			local zn = bc:getZoneByName(target)
			for _,v in ipairs(jtacQueue) do
				if v.tgtzone and v.tgtzone.zone == zn.zone then
					trigger.action.outTextForCoalition(2,'JTAC already active over '..zn.zone..' Select another zone',10)
					return 'duplicate zone'
				end
			end
			if #jtacQueue == 2 then
				local old = table.remove(jtacQueue,1)
				local gr = Group.getByName(old.name)
				if gr then gr:destroy() end
			end
			local dr = jtacDrones[1]
			for i,v in ipairs(jtacDrones) do
				if not Utils.isGroupActive(Group.getByName(v.name)) then dr = v break end
			end
			dr:deployAtZone(zn)
			dr:showMenu()
			table.insert(jtacQueue,dr)
			trigger.action.outTextForCoalition(2,'Reaper drone deployed over '..target..' - JTACs active '..#jtacQueue..' / 2',15)
			jtacTargetMenu = nil
		end
	end
	jtacTargetMenu = bc:showTargetZoneMenu(2,'Deploy JTAC',spawnAndOrbit,1)
	trigger.action.outTextForCoalition(2,'Choose which zone to deploy JTAC at from F10 menu',15)
end,function(sender,params)
	if params.zone and params.zone.side == 1 then
		for _,v in ipairs(jtacQueue) do
			if v.tgtzone and v.tgtzone.zone == params.zone.zone then
				return 'JTAC already active over '..params.zone.zone..' Choose another zone'
			end
		end
		if #jtacQueue == 2 then
			local old = table.remove(jtacQueue,1)
			local gr  = Group.getByName(old.name)
			if gr then gr:destroy() end
		end
		local dr = jtacDrones[1]
		for i,v in ipairs(jtacDrones) do
			if not Utils.isGroupActive(Group.getByName(v.name)) then dr = v break end
		end
		dr:deployAtZone(params.zone)
		dr:showMenu()
		table.insert(jtacQueue,dr)
		trigger.action.outTextForCoalition(2,'Reaper drone deployed over '..params.zone.zone..' - JTACs active '..#jtacQueue..' / 2',15)
	else
		return 'Can only target enemy zone'
	end
end)


local smoketargets = function(tz)
	if not tz or not tz.built then return end
	local units = {}
	for i,v in pairs(tz.built) do
		local g = Group.getByName(v)
		if g and g:isExist() then
			local gUnits = g:getUnits()
			if gUnits then
				for i2,v2 in ipairs(gUnits) do
					table.insert(units,v2)
				end
			end
		end
	end
	local tgts = {}
	for i=1,3,1 do
		if #units > 0 then
			local selected = math.random(1,#units)
			table.insert(tgts,units[selected])
			table.remove(units,selected)
		end
	end
	for i,v in ipairs(tgts) do
		if v and v:isExist() then
			local pos = v:getPosition().p
			trigger.action.smoke(pos,1)
		end
	end
end

local smokeTargetMenu = nil
bc:registerShopItem('smoke', 'Smoke markers ', 20, function(sender)
	if smokeTargetMenu then
		return 'Choose target zone from F10 menu'
	end
	
	local launchAttack = function(target)
		if smokeTargetMenu then
			local tz = bc:getZoneByName(target)
			smoketargets(tz)
			smokeTargetMenu = nil
			trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..target, 15)
		end
	end
	
	smokeTargetMenu = bc:showTargetZoneMenu(2, 'Smoke marker target', launchAttack, 1)
	
	trigger.action.outTextForCoalition(2, 'Choose target zone from F10 menu ', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		smoketargets(params.zone)
		trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

------------------------------------ START own 9 line jtac AM START ----------------------------------
local jtacZones = {}
local jtacTargetMenu2 = nil
local droneAM
Group.getByName('JTAC9lineamColdwar'):destroy()
Group.getByName('JTAC9lineam'):destroy()
if Era == 'Coldwar' then
droneAM = JTAC9line:new({name = 'JTAC9lineamColdwar'})
else
droneAM = JTAC9line:new({name = 'JTAC9lineam'})
end
bc:registerShopItem('9lineam', 'Jtac 9line AM', 0, function(sender)
    if jtacTargetMenu2 then
        return 'Choose target zone from F10 menu'
    end
    
    local spawnAndOrbit2 = function(target)
        if jtacTargetMenu2 then
            local zn = bc:getZoneByName(target)
            droneAM:deployAtZone(zn)
			jtacZones[target] = {drone = Era == 'Coldwar' and 'JTAC9lineamColdwar' or 'JTAC9lineam'}
			
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. target .. '. Contact Springfield on 241.00 AM ', 30)
        jtacTargetMenu2 = nil
		end
    end
    
    jtacTargetMenu2 = bc:showTargetZoneMenu(2, 'Deploy JTAC to Zone', spawnAndOrbit2, 1)
    trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        droneAM:deployAtZone(params.zone)
        jtacZones[params.zone.zone] = {drone = Era == 'Coldwar' and 'JTAC9lineamColdwar' or 'JTAC9lineam'}
        trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. params.zone.zone .. '. Contact Springfield on 241.00 AM ', 30)
    else
        return 'Can only target enemy zone'
    end
end)

  ------------------------------ END 9 line jtac AM END ----------------------------------
  ----------------------------- START 9 line jtac fm START ---------------------------
Group.getByName('JTAC9linefmColdwar'):destroy()
Group.getByName('JTAC9linefm'):destroy()
local jtacTargetMenu3 = nil
local droneFM
if Era == 'Coldwar' then
droneFM = JTAC9line:new({name = 'JTAC9linefmColdwar'})
else
droneFM = JTAC9line:new({name = 'JTAC9linefm'})
end
bc:registerShopItem('9linefm', 'Jtac 9line FM', 0, function(sender)
    if jtacTargetMenu3 then
        return 'Choose target zone from F10 menu'
    end
    
    local spawnAndOrbit3 = function(target)
        if jtacTargetMenu3 then
            local zn = bc:getZoneByName(target)
            droneFM:deployAtZone(zn)
			
			jtacZones[target] = {drone = Era == 'Coldwar' and 'JTAC9linefmColdwar' or 'JTAC9linefm'}
			
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. target .. '. Contact Uzi on 31.00 FM ', 30)            
            jtacTargetMenu3 = nil
        end
    end
    
    jtacTargetMenu3 = bc:showTargetZoneMenu(2, 'Deploy JTAC to Zone', spawnAndOrbit3, 1)
    trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        droneFM:deployAtZone(params.zone)
        jtacZones[params.zone.zone] = {drone = Era == 'Coldwar' and 'JTAC9linefmColdwar' or 'JTAC9linefm'}
        trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. params.zone.zone .. '. Contact Uzi on 31.00 FM ', 30)
    else
        return 'Can only target enemy zone'
    end
end)

  -------------------------- END 9 line jtac FM END ----------------------------------

function CheckJtacStatus()
	 if jtacZones == nil then
			return false
		end

    local jtacFound = false
    
    for zoneName, jtacInfo in pairs(jtacZones) do
        local jtacGroup = Group.getByName(jtacInfo.drone)
        if jtacGroup and Utils.isGroupActive(jtacGroup) then
            local zone = bc:getZoneByName(zoneName)
            if zone and (zone.side == 0 or not zone.active) then
                jtacGroup:destroy()
                jtacZones[zoneName] = nil
                jtacFound = true
            end
        else
            jtacZones[zoneName] = nil
        end
    end

    return jtacFound
end

-- new menu
local supplyMenu=nil
bc:registerShopItem('capture','Emergency capture neutral zone',500,
function(sender)
	if supplyMenu then
		return 'Choose a zone from F10 menu'
	end
    local cost=500
    trigger.action.outTextForCoalition(2,'Select zone from F10 menu',15)
    supplyMenu=bc:showEmergencyNeutralZoneMenu(2,'Select Zone for Emergency capture',
    function(zonename)
        if not zonename then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'No zone name selected, purchase refunded',10)
            return 'No zone name'
        end
        local chosenZone=bc:getZoneByName(zonename)
        if not chosenZone then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'Zone not found, purchase refunded',10)
            return 'Zone not found'
        end
        if chosenZone.side~=0 then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'Zone is not neutral anymore, purchase refunded',10)
            return 'Zone is no longer neutral!'
        end
        local bestCommander,status=findNearestAvailableSupplyCommander(chosenZone)
        if not bestCommander then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            if status=='inprogress' then
                trigger.action.outTextForCoalition(2,'Supply to '..chosenZone.zone..' already in progress, purchase refunded',10)
                return 'Supply mission in progress for this zone'
            else
                trigger.action.outTextForCoalition(2,'No suitable supply group found for '..chosenZone.zone..', purchase refunded',10)
                return 'No available supply convoys'
            end
        end
        bestCommander.targetzone=zonename
        bestCommander.state='preparing'
        bestCommander.urgent=true
        bestCommander.lastStateTime=timer.getAbsTime()-999999
        trigger.action.outTextForCoalition(2,'Emergency Capture from '..bestCommander.name..' heading to '..zonename,10)
        if supplyMenu then
            missionCommands.removeItemForCoalition(2,supplyMenu)
            supplyMenu=nil
        end
        return nil
    end)
    return nil
end,
function(sender,params)
    if not params.zone or params.zone.side~=0 then
        return 'Zone is not neutral'
    end
    local chosenZone=bc:getZoneByName(params.zone.zone)
    local bestCommander,status=findNearestAvailableSupplyCommander(chosenZone)
    if not bestCommander then
        if status=='inprogress' then
            return 'Supply mission in progress for this zone'
        else
            return 'No available supply convoys'
        end
    end
    bestCommander.targetzone=params.zone.zone
    bestCommander.state='preparing'
    bestCommander.urgent=true
    bestCommander.lastStateTime=timer.getAbsTime()-999999
    trigger.action.outTextForCoalition(2,'Emergency Capture from '..bestCommander.name..' heading to '..params.zone.zone,10)
    return nil
end)
--end of menu

-----------------------------------------------DYNAMIC SHOP ------------------------------------------


bc:registerShopItem('dynamiccap', 'Dynamic CAP', 500, function(sender)
    if capActive then
        return 'CAP mission still in progress'
    end
		if capParentMenu then
		return 'Choose spawn zone from F10 menu'
	end
    buildCapMenu()
	trigger.action.outTextForCoalition(2, 'CAP is requested. Select spawn zone.', 10)
    return
end,
function (sender, params)
    if capActive then
        return 'CAP mission still in progress'
    end
    buildCapMenu()

	trigger.action.outTextForCoalition(2, 'CAP is requested. Select spawn zone.', 10)
    return
end)

bc:registerShopItem('dynamiccas', 'Dynamic CAS', 500,
function(sender)
    if casActive then
        return 'CAS mission still in progress'
    end
	if CASTargetMenu then
		return 'Choose target zone from F10 menu'
	end
    local minNM = 25
    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, minNM) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>'..minNM..' NM) from the front line.', 10)
        return
    end
    CASTargetMenu = bc:showTargetZoneMenu(2, 'Select CAS Target', function(targetZoneName, menu)
        if casActive then return end
        local spawnZone, dist = findClosestBlueZoneOutside(targetZoneName, minNM)
        if not spawnZone then
            return 'No friendly zone available for CAS spawn '..minNM..'+ NM away'
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnCasAt(spawnZone, targetZoneName, offset)
        CASTargetMenu = nil
    end, 1, nil, allow)
    trigger.action.outTextForCoalition(2, 'Select CAS target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if casActive then return 'CAS mission still in progress' end
        local minNM = 25
        local closestBlue, dist = findClosestBlueZoneOutside(params.zone.zone, minNM)
        if not closestBlue then
            return 'No friendly zone available for CAS spawn.'
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnCasAt(closestBlue, params.zone.zone, offset)
        return
    else
        return 'Can only target enemy zone'
    end
end)

bc:registerShopItem('dynamicdecoy', 'Dynamic Decoy', 300,
function(sender)
    if decoyActive then
        return 'Decoy mission still in progress'
    end
	if DECOYTargetMenu then
		return 'Choose target zone from F10 menu'
	end

    local minNM = 40
    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, minNM) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>'..minNM..' NM) from the front line.', 10)
        return
    end

    DECOYTargetMenu = bc:showTargetZoneMenu(2, 'Select Decoy Target', function(targetZoneName, menu)
        if decoyActive then return end
        local spawnZone, dist = findClosestBlueZoneOutside(targetZoneName, minNM)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for Decoy spawn '..minNM..'+ NM away.', 15)
            return
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnDecoyAt(spawnZone, targetZoneName, offset)
        DECOYTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select Decoy target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if decoyActive then
            return 'Decoy mission still in progress'
        end
        local minNM = 40
        local closestBlue, dist = findClosestBlueZoneOutside(params.zone.zone, minNM)
        if not closestBlue then
            return 'No friendly zone available for Decoy spawn.'
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnDecoyAt(closestBlue, params.zone.zone, offset)
        return
    else
        return 'Can only target enemy zone'
    end
end)


bc:registerShopItem('dynamicsead', 'Dynamic SEAD', 500,
function(sender)
    if seadActive then
        return 'SEAD mission still in progress'
    end
	if SEADTargetMenu then
		return 'Choose target zone from F10 menu'
	end

    local minNM = 40
    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, minNM) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>'..minNM..' NM) from the front line.', 10)
        return
    end

    SEADTargetMenu = bc:showTargetZoneMenu(2, 'Select SEAD Target', function(targetZoneName, menu)
        if seadActive then return end
        local spawnZone, dist = findClosestBlueZoneOutside(targetZoneName, minNM)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for SEAD spawn '..minNM..'+ NM away.', 15)
            return
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnSeadAt(spawnZone, targetZoneName, offset)
        SEADTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select SEAD target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if seadActive then
            return 'SEAD mission still in progress'
        end
        local minNM = 40
        local closestBlue, dist = findClosestBlueZoneOutside(params.zone.zone, minNM)
        if not closestBlue then
            return 'No friendly zone available for SEAD spawn.'
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnSeadAt(closestBlue, params.zone.zone, offset)
        return
    else
        return 'Can only target enemy zone'
    end
end)

bc:registerShopItem('dynamicbomb', 'Dynamic Bomb run', 500,
function(sender)
    if bomberActive then
        return 'Bomb mission still in progress'
    end
	if BomberTargetMenu then
        return 'Choose target zone from F10 menu'
    end

    local minNM = 25
    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, minNM) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>'..minNM..' NM) from the front line.', 10)
        return
    end

    BomberTargetMenu = bc:showTargetZoneMenu(2, 'Select bomb run target', function(targetZoneName, menu)
        if bomberActive then return end
        local spawnZone, dist = findClosestBlueZoneOutside(targetZoneName, minNM)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for Bomb spawn '..minNM..'+ NM away.', 15)
            return
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnBomberAt(spawnZone, targetZoneName, offset)
        BomberTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select bomb run target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if bomberActive then
            return 'Bomb run mission still in progress'
        end
        local minNM = 25
        local closestBlue, dist = findClosestBlueZoneOutside(params.zone.zone, minNM)
        if not closestBlue then
            return 'No friendly zone available for bomb run spawn.'
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnBomberAt(closestBlue, params.zone.zone, offset)
        return
    else
        return 'Can only target enemy zone'
    end
end)


if UseStatics == true then
bc:registerShopItem('Dynamicstatic', 'Dynamic building Strike', 500,
function(sender)
    if StructureActive then
        return 'building strike mission still in progress'
    end
	if StructureTargetMenu then
		return 'Choose target zone from F10 menu'
	end
    local minNM = 25
    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and z.newStatics and next(z.newStatics) and findClosestBlueZoneOutside(z.zone, minNM) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone with building targets far enough (>'..minNM..' NM) from the front line.', 10)
        return
    end

    StructureTargetMenu = bc:showTargetZoneMenu(2, 'Select building strike target zone', function(targetZoneName, menu)
        if bomberActive then return end
        local spawnZone, dist = findClosestBlueZoneOutside(targetZoneName, minNM)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for strike spawn '..minNM..'+ NM away.', 15)
            return
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnStructureAt(spawnZone, targetZoneName, offset)
        StructureTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select building strike target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 and params.zone.newStatics and next(params.zone.newStatics) then
        if StructureActive then
            return 'building strike mission still in progress'
        end
        local minNM = 25
        local closestBlue, dist = findClosestBlueZoneOutside(params.zone.zone, minNM)
        if not closestBlue then
            return 'No friendly zone available for strike spawn.'
        end
        local offset = (dist and dist < minNM) and (minNM - dist) or 0
        spawnStructureAt(closestBlue, params.zone.zone, offset)
        return
    else
        return 'Can only target enemy zone with building targets'
    end
end)
end
---------------------------------------------END DYNAMIC SHOP ------------------------------------------

local intelMenu=nil
bc:registerShopItem('intel','Intel on enemy zone',150,function(sender)
	if intelMenu then
		return 'Already choosing a zone'
	end
	local pickZone = function(targetZoneName)
		if intelMenu then
			local zoneObj = bc:getZoneByName(targetZoneName)
			if not zoneObj or zoneObj.side ~= 1 then
				return 'Must pick an enemy zone'
			end
			intelActiveZones[targetZoneName] = true
			startZoneIntel(targetZoneName)
			trigger.action.outTextForCoalition(2, 'Intel available for '..targetZoneName..'. Check Zone status. Valid for 1 hour', 15)
			timer.scheduleFunction(function(args)
				local zName = args[1]
				local zn = bc:getZoneByName(zName)
				if not zn or zn.side ~= 1 then return end
				if intelActiveZones[zName] then
					intelActiveZones[zName] = false
					trigger.action.outTextForCoalition(2, 'Intel on '..zName..' has expired.', 10)
				end
			end, {targetZoneName}, timer.getTime()+60*60)
			intelMenu = nil
		end
	end
	intelMenu = bc:showTargetZoneMenu(2, 'Choose Enemy Zone for Intel', pickZone, 1)
	trigger.action.outTextForCoalition(2, 'Intel purchase started. Select enemy zone from F10 menu.', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		intelActiveZones[params.zone.zone] = true
		startZoneIntel(params.zone.zone)
		trigger.action.outTextForCoalition(2, 'Intel available for '..params.zone.zone..'. Check Zone status. Valid for 1 hour', 15)
		SCHEDULER:New(nil,function(zName)
			if intelActiveZones[zName] then
				intelActiveZones[zName] = false
				trigger.action.outTextForCoalition(2, 'Intel on '..zName..' has expired.', 10)
			end
		end,{params.zone.zone},3600)
	else
		return 'Must pick an enemy zone'
	end
end)

------------------------------------------- Zone upgrades --------------------------------------------
local function buildAllowTable()
	local t = {}
	for _, z in pairs(bc:getZones()) do
		local max = 1 + (bc.globalExtraUnlock and 1 or 0)
        if z.side == 2 and (z.upgradesUsed or 0) < max
           and not z.zone:lower():find("carrier") then
			t[z.zone] = true
		end
	end
	return t
end

local infMenu=nil
bc:registerShopItem('zinf','Add infantry squad to zone',500,function(sender)
	if infMenu then
		return 'Already choosing a zone'
	end
	local pickZone=function(zName)
		if infMenu then
			local z=bc:getZoneByName(zName)
			if not z or z.side~=2 then
				return 'Must pick friendly zone'
			end
			if z.upgradesUsed >= (1 + (bc.globalExtraUnlock and 1 or 0)) then
				return 'Zone already upgraded'
			end
			z:addExtraSlot('blueInfantry')
			z:updateLabel()
			if bc.globalExtraUnlock then
                trigger.action.outTextForCoalition(2,'Infantry added to '..zName..' for 500',10)
            else
                trigger.action.outTextForCoalition(2,'Infantry added to '..zName..' for 500 - buy the Global extra slot to upgrade this zone again',30)
            end
			missionCommands.removeItemForCoalition(2,infMenu)
			infMenu=nil
		end
	end
	local allow = buildAllowTable()
	if not next(allow) then
		if not bc.globalExtraUnlock then
			return 'All zones already upgraded - purchase Global extra slot to add another'
		end
		return 'No eligible zone'
	end
	infMenu = bc:showTargetZoneMenu(2,'Choose Zone for Infantry',pickZone,2,nil,allow)
	trigger.action.outTextForCoalition(2,'Select friendly zone from F10 menu.',15)
end,
function(sender,params)
	if params.zone and params.zone.side==2 then
		local max = 1 + (bc.globalExtraUnlock and 1 or 0)
		if params.zone.upgradesUsed >= max then
			if not bc.globalExtraUnlock then
				return 'Zone already upgraded - purchase Global extra slot to add another'
			end
			return 'Zone already upgraded'
		end
		params.zone:addExtraSlot('blueInfantry')
		params.zone:updateLabel()
		if bc.globalExtraUnlock then
		trigger.action.outTextForCoalition(2,'Infantry added to '..params.zone.zone..' for 500',10)
		else
		trigger.action.outTextForCoalition(2,'Infantry added to '..params.zone.zone..' for 500 - buy the Global extra slot to upgrade this zone again',30)
		end
	else
		return 'Must pick friendly zone'
	end
end)
local samLabel = (Era == 'Coldwar') and 'Add Hawk system to a zone'
                                   or  'Add Nasams system to a zone'
local samMenu=nil
bc:registerShopItem('zsam',samLabel,2000,function(sender)
	if samMenu then
		return 'Already choosing a zone'
	end
	local pickZone=function(zName)
		if samMenu then
			local z=bc:getZoneByName(zName)
			if not z or z.side~=2 then
				return 'Must pick friendly zone'
			end
		if z.upgradesUsed >= (1 + (bc.globalExtraUnlock and 1 or 0)) then
			return 'Zone already upgraded'
		end
            local slot = (Era == 'Coldwar') and 'blueHAWK Coldwar' or 'bluePD1'
            z:addExtraSlot(slot)
			z:updateLabel()
			local sys = (Era == 'Coldwar') and 'Hawk' or 'Nasams'
            if bc.globalExtraUnlock then	
                trigger.action.outTextForCoalition(2,sys..' added to '..zName..' for 2000',10)
            else
                trigger.action.outTextForCoalition(2,sys..' added to '..zName..' for 2000 - buy the Global extra slot to upgrade this zone again',30)
            end
			missionCommands.removeItemForCoalition(2,samMenu)
			samMenu=nil
		end
	end

	local allow = buildAllowTable()
	if not next(allow) then
		if not bc.globalExtraUnlock then
			return 'All zones already upgraded - purchase Global extra slot to add another'
		end
		return 'No eligible zone'
	end
	samMenu = bc:showTargetZoneMenu(2,'Choose Zone for SAM',     pickZone,2,nil,allow)
	trigger.action.outTextForCoalition(2,'Select friendly zone from F10 menu.',15)
end,
function(sender,params)
	if params.zone and params.zone.side==2 then
		local max = 1 + (bc.globalExtraUnlock and 1 or 0)
		if params.zone.upgradesUsed >= max then
			if not bc.globalExtraUnlock then
				return 'Zone already upgraded - purchase Global extra slot to add another'
			end
			return 'Zone already upgraded'
		end
		params.zone:addExtraSlot((Era == 'Coldwar') and 'blueHAWK Coldwar' or 'bluePD1')
		params.zone:updateLabel()
		local sys = (Era == 'Coldwar') and 'Hawk' or 'Nasams'
        if bc.globalExtraUnlock then
            trigger.action.outTextForCoalition(2,sys..' added to '..params.zone.zone..' for 2000',10)
        else
            trigger.action.outTextForCoalition(2,sys..' added to '..params.zone.zone..' for 2000 - buy the Global extra slot to upgrade this zone again',30)
        end
	else
		return 'Must pick friendly zone'
	end
end)

local armMenu=nil
bc:registerShopItem('zarm','Add armor group to a zone',1000,function(sender)
	if armMenu then
		return 'Already choosing a zone'
	end
	local pickZone=function(zName)
		if armMenu then
			local z=bc:getZoneByName(zName)
			if not z or z.side~=2 then
				return 'Must pick friendly zone'
			end
			if z.upgradesUsed >= (1 + (bc.globalExtraUnlock and 1 or 0)) then
				return 'Zone already upgraded'
			end
			local slotID = (Era == 'Coldwar') and 'blueArmor_cw' or 'blueArmor'
			z:addExtraSlot(slotID)
			z:updateLabel()
			if bc.globalExtraUnlock then
				trigger.action.outTextForCoalition(2,'Armor added to '..zName..' for 1000',10)
			else
				trigger.action.outTextForCoalition(2,'Armor added to '..zName..' for 1000 - buy the Global extra slot to upgrade this zone again',30)
			end
			missionCommands.removeItemForCoalition(2,armMenu)
			armMenu=nil
		end
	end
	local allow = buildAllowTable()
	if not next(allow) then
		if not bc.globalExtraUnlock then
			return 'All zones already upgraded - purchase Global extra slot to add another'
		end
		return 'No eligible zone'
	end
	armMenu = bc:showTargetZoneMenu(2,'Choose Zone for Armor',   pickZone,2,nil,allow)
	trigger.action.outTextForCoalition(2,'Select friendly zone from F10 menu.',15)
end,
function(sender,params)
	if params.zone and params.zone.side==2 then
		local max = 1 + (bc.globalExtraUnlock and 1 or 0)
		if params.zone.upgradesUsed >= max then
			if not bc.globalExtraUnlock then
				return 'Zone already upgraded - purchase Global extra slot to add another'
			end
			return 'Zone already upgraded'
		end
		local slotID = (Era == 'Coldwar') and 'blueArmor_cw' or 'blueArmor'
		params.zone:addExtraSlot(slotID)
		params.zone:updateLabel()
		if bc.globalExtraUnlock then
			trigger.action.outTextForCoalition(2,'Armor added to '..params.zone.zone..' for 1000',10)
		else
			trigger.action.outTextForCoalition(2,'Armor added to '..params.zone.zone..' for 1000\nBuy the Global extra slot to upgrade this zone again',30)
		end
	else
		return 'Must pick friendly zone'
	end
end)
Group.getByName('bluePATRIOT'):destroy()
local patMenu=nil
bc:registerShopItem('zpat','Add Patriot system to zone',5000,function(sender)
	if patMenu then
		return 'Already choosing a zone'
	end
	local pickZone=function(zName)
		if patMenu then
			local z=bc:getZoneByName(zName)
			if not z or z.side~=2 then
				return 'Must pick friendly zone'
			end
			if z.upgradesUsed >= (1 + (bc.globalExtraUnlock and 1 or 0)) then
				return 'Zone already upgraded'
			end
			z:addExtraSlot('bluePATRIOT')
			z:updateLabel()
			if bc.globalExtraUnlock then
                trigger.action.outTextForCoalition(2,'Patriot added to '..zName..' for 5000',10)
            else
                trigger.action.outTextForCoalition(2,'Patriot added to '..zName..' for 5000 - buy the Global extra slot to upgrade this zone again',30)
            end
			missionCommands.removeItemForCoalition(2,patMenu)
			patMenu=nil
		end
	end
	local allow = buildAllowTable()
	if not next(allow) then
		if not bc.globalExtraUnlock then
			return 'All zones already upgraded - purchase Global extra slot to add another'
		end
		return 'No eligible zone'
	end
	patMenu = bc:showTargetZoneMenu(2,'Choose Zone for Patriot SAM system',pickZone,2,nil,allow)
	trigger.action.outTextForCoalition(2,'Select friendly zone from F10 menu.',15)
end,
function(sender,params)
	if params.zone and params.zone.side==2 then
		local max = 1 + (bc.globalExtraUnlock and 1 or 0)
		if params.zone.upgradesUsed >= max then
			if not bc.globalExtraUnlock then
				return 'Zone already upgraded - purchase Global extra slot to add another'
			end
			return 'Zone already upgraded'
		end
		params.zone:addExtraSlot('bluePATRIOT')
		params.zone:updateLabel()
		if bc.globalExtraUnlock then
		trigger.action.outTextForCoalition(2,'Patriot added to '..params.zone.zone..' for 5000',10)
		else
		trigger.action.outTextForCoalition(2,'Patriot added to '..params.zone.zone..' for 5000 - buy the Global extra slot to upgrade this zone again',30)
		end
	else
		return 'Must pick friendly zone'
	end
end)

bc:registerShopItem('gslot','Unlock extra upgrade slot',3000,function(sender)
    if bc.globalExtraUnlock then
        return 'Already unlocked'
    end
    bc.globalExtraUnlock = true
    for _,z in pairs(bc:getZones()) do

    end
    trigger.action.outTextForCoalition(2,'All zones can now buy a second upgrade',15)
	bc:removeShopItem(2, 'gslot')
	return nil
end)
------------------------------------------- End of Zone upgrades ----------------------------------------

    bc:addShopItem(2, 'jtac', -1,1)
   	bc:addShopItem(2, 'dynamiccap', -1,2)
	bc:addShopItem(2, 'dynamiccas', -1,3)
	bc:addShopItem(2, 'dynamicdecoy', -1,4)
    bc:addShopItem(2, 'dynamicbomb', -1,5)
    bc:addShopItem(2, 'dynamicsead', -1,6)
    if UseStatics == true then
    bc:addShopItem(2, 'Dynamicstatic', -1,7)
    end
    bc:addShopItem(2, 'capture', -1,8)
    bc:addShopItem(2, 'smoke', -1,9)
    bc:addShopItem(2, 'intel', -1,10)
    bc:addShopItem(2, 'supplies', -1,11)
	bc:addShopItem(2, 'supplies2', -1,12)
    bc:addShopItem(2,'zinf',-1,12)
    bc:addShopItem(2,'zarm',-1,13)
    bc:addShopItem(2,'zsam',-1,14)
    if Era == 'Modern' then bc:addShopItem(2,'zpat',-1,16) end
    bc:addShopItem(2,'gslot',1,17)
    bc:addShopItem(2, 'armor', -1,18)
    bc:addShopItem(2, 'artillery', -1,19)
    bc:addShopItem(2, 'recon', -1,20)
    bc:addShopItem(2, 'airdef', -1,21)
	bc:addShopItem(2, '9lineam', -1,22)
	bc:addShopItem(2, '9linefm', -1,23)





supplyZones = {
    'Bitburg',
    'Spangdahlem',
    'Hahn',
    'Airracing Frankfurt',
    'Mendig',
    'Mendig North FARP',
    'Mendig East FARP',
    'Baumholder FARP',
    'Ramstein',
    'Bad Durkheim',
    'Walldorf FARP',
    'Walldurn FARP',
    'Giebelstadt',
    'Frankfurt',
    'Gelnhausen',
    'Laubach FARP',
    'Fulda',
    'Fritzlar',
    'Salzungen FARP',
    'Bindersleben',
    'Naumburg FARP',
    'Leipzig',
    'Zerbst',
    'Mahlwinkel',
    'Briest',
    'Altes Lager',
    'Wundsdorf FARP',
    'Tegel',
    'Werneuchen',
    'Templin',
    'Neuruppin',
    'Hannover',
    'Scheessel',
    'Bremen',
    'Hamburg',
    'Braunschweig',
    'Fassberg',
    'Lubeck',
    'Laage',
    'Tutow',
    'Peenemunde',
    'Garz',
    'Neubrandenburg',
    'Parchim',
    'Larz',
}

lc = LogisticCommander:new({battleCommander = bc, supplyZones = supplyZones})
lc:init()

bc:loadFromDisk()
bc:init()
bc:startRewardPlayerContribution(15,{infantry = 10, ground = 10, sam = 30, airplane = 30, ship = 200, helicopter=30, crate=100, rescue = 300, ['Zone upgrade'] = 100, ['Zone capture'] = 200, ['CAP mission'] = true, ['CAS mission'] = true})
HercCargoDropSupply.init(bc)
bc:buildZoneDistanceCache()
buildSubZoneRoadCache()
bc:buildConnectionMap()
local HuntNumber = SplashDamage and math.random(8,15) or math.random(6,12)
bc:initHunter(HuntNumber)
evc = EventCommander:new({ decissionFrequency=10*60, decissionVariance=10*60, skipChance = 10})
mc = MissionCommander:new({side = 2, battleCommander = bc, checkFrequency = 60})
--------------------------------------------------- EVENT Intercept Bombers --------------------------------------------------------
local bomb_COOLDOWN = 7200
local lastbomb_COOLDOWN  = -bomb_COOLDOWN
local currentOrigin = "west"
local bomberChoices = {
	{bomber='evt-bomb',escort=Era=='Coldwar' and 'EscortBomberCW' or 'EscortBomber',origin='west'},
	{bomber='evt-bomb-east',escort=Era=='Coldwar' and 'EscortBomberEastCW' or 'EscortBomberEast',origin='east'}
}
for _,v in ipairs(bomberChoices) do
	local g=Group.getByName(v.bomber)
	if g then g:destroy() end
end
evc:addEvent({
	id='bomb',
	action=function()
		local choice=bomberChoices[math.random(#bomberChoices)]
		local bomberGrp=choice.bomber
		local escortGrp=choice.escort
		currentOrigin=choice.origin
		RespawnGroup(bomberGrp)
        RegisterGroupTarget(bomberGrp,250,'Intercept enemy bombers')
		timer.scheduleFunction(function()
			startBomberAttack(bomberGrp)
			RespawnGroup(escortGrp)
			timer.scheduleFunction(function()
				local bomber=Group.getByName(bomberGrp)
				local escort=Group.getByName(escortGrp)
				if bomber and escort then
					local cnt=escort:getController()
					cnt:popTask()
					local escortTask={
						id='Escort',
						params={
							groupId=bomber:getID(),
							pos={x=-20,y=2000,z=50},
							lastWptIndexFlag=false,
							lastWptIndex=-1,
							engagementDistMax=12000,
							targetTypes={'Air'}
						}
					}
					cnt:pushTask(escortTask)
				end
			end,{},timer.getTime()+5)
		end,{},timer.getTime()+10)
	end,
	canExecute=function()
		if timer.getTime()-lastbomb_COOLDOWN<bomb_COOLDOWN then return false end
		if Group.getByName('evt-bomb') or Group.getByName('evt-bomb-east') then return false end
		if math.random(1,100)<20 then return false end
		local triggers={'Frankfurt','Leipzig','Larz','Tutow','Hamburg','Braunschweig','Mahlwinkel','Fassberg'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side==2 then return true end
		end
		return false
	end
})

function startBomberAttack(bomberGrp)
local tgts = {
  'Bitburg','Spangdahlem','Hahn','Mendig','Mendig North FARP',
  'Mendig East FARP','Baumholder FARP','Ramstein','Bad Durkheim',
  'Walldorf FARP','Walldurn FARP','Giebelstadt','Airracing Frankfurt',
  'Frankfurt','Fritzlar','Gelnhausen','Laubach FARP','Fulda',
  'Salzungen FARP','Bindersleben','Naumburg FARP','Leipzig','Zerbst',
  'Mahlwinkel','Braunschweig','Hannover','Fassberg','Scheessel',
  'Bremen','Hamburg','Lubeck','Briest','Altes Lager',
  'Wundsdorf FARP','Tegel','Werneuchen','Neuruppin','Templin',
  'Larz','Parchim','Neubrandenburg','Tutow','Laage','Garz',
  'Peenemunde'
}
	local validtgts={}
	for _,v in ipairs(tgts) do
		if bc:getZoneByName(v).side==2 then
			table.insert(validtgts,v)
		end
	end
	if #validtgts>0 then
		local choice=validtgts[math.random(#validtgts)]
		BASE:I("Chosen target: "..choice)
		if Group.getByName(bomberGrp) then
			bc:carpetBombRandomUnitInZone(choice,bomberGrp)
		end
	else
		BASE:I("No valid targets found for bomber attack.")
	end
end

mc:trackMission({
	title="Intercept Bombers",
	description=function() return "Enemy bombers spotted inbound from the "..currentOrigin.."\nDestroy them before they get in range." end,
	messageStart=function() return "New mission: Intercept Bombers inbound from the "..currentOrigin end,
	messageEnd=function() lastbomb_COOLDOWN=timer.getTime() return "Mission ended: Intercept Bombers" end,
	startAction=function()
		if not missionCompleted and trigger.misc.getUserFlag(180)==0 then
			trigger.action.outSoundForCoalition(2,"ding.ogg")
		end
	end,
	endAction=function()
		if not missionCompleted and trigger.misc.getUserFlag(180)==0 then
			trigger.action.outSoundForCoalition(2,"cancel.ogg")
		end
	end,
	isActive=function()
		local gr=Group.getByName('evt-bomb') or Group.getByName('evt-bomb-east')
		if gr then return true else return false end
	end
})
--------------------------------------------------- END OF EVENT Intercept Bombers --------------------------------------------------------

------------------------------------------------------ EVENT Intercept enemy airstrike --------------------------------------------------------
local airstrike_COOLDOWN = 7200
local lastairstrike_COOLDOWN  = -airstrike_COOLDOWN
local attackGrp = Era=='Coldwar' and 'evt-attackcw' or 'evt-attack'
Group.getByName('evt-attack'):destroy()
Group.getByName('evt-attackcw'):destroy()
evc:addEvent({
	id='cas',
	action=function()
		RespawnGroup(attackGrp)
        RegisterGroupTarget(attackGrp,250,'Intercept enemy bombers')
		timer.scheduleFunction(function()
			local tgts={'Frankfurt','Bindersleben','Leipzig','Zerbst','Mahlwinkel','Ramstein','Neubrandenburg','Laage','Hamburg','Larz','Fassberg'}
			local valid={}
			for _,v in ipairs(tgts) do
				if bc:getZoneByName(v).side==2 then valid[#valid+1]=v end
			end
			if #valid~=0 then
				local choice=valid[math.random(1,#valid)]
				if Group.getByName(attackGrp) then bc:engageZone(choice,attackGrp) end
			end
		end,{},timer.getTime()+3)
	end,
	canExecute=function()
        if timer.getTime()-lastairstrike_COOLDOWN<airstrike_COOLDOWN then return false end
		if Group.getByName(attackGrp) then return false end
		if math.random(1,100)<50 then return false end
		if bc:getZoneByName('Peenemunde').side~=1 then return false end
		local triggers={'Frankfurt','Bindersleben','Mahlwinkel','Larz','Fassberg'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side==2 then return true end
		end
		return false
	end
})

mc:trackMission({
	title = "Intercept enemy airstrike",
	description = "Enemy aircraft conducting an airstrike from the west to south east\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept enemy airstrike",
	messageEnd =function() lastairstrike_COOLDOWN=timer.getTime() return "Mission ended: Intercept enemy airstrike" end,
	startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
		local g1 = Group.getByName('evt-attack')
		local g2 = Group.getByName('evt-attackcw')
		if g1 or g2 then
			return true
		else
			return false
		end
	end
})

------------------------------------------------------ Defend Missions --------------------------------------------------------
local FRANKFURT_COOLDOWN = 7200
local lastFrankfurtEnd   = -FRANKFURT_COOLDOWN
FrankfurtForce = {
    ['Bindersleben'] = {
        Era=='Coldwar' and 'Bindersleben-Attack-Frankfurt-Event ColdWar'
                       or 'Bindersleben-Attack-Frankfurt-Event'
    },
    ['Leipzig'] = {
        Era=='Coldwar' and 'Leipzig-Frankfurt-Bomber ColdWar'
                       or 'Leipzig-Frankfurt-Bomber'
    },
	['Fulda'] = { 'Fulda-attack-frankfurt-event' },
    
}
for i,v in pairs(FrankfurtForce) do
	for _,v2 in ipairs(v) do
		Group.getByName(v2):destroy()
	end
end
evc:addEvent({
	id='FrankfurtAttack',
	action = function()
		for i,v in pairs(FrankfurtForce) do
			if bc:getZoneByName(i).side == 1 then
				for _,v2 in ipairs(v) do
					RespawnGroup(v2)
				end
			end
		end
	end,
	canExecute = function()
        if timer.getTime() - lastFrankfurtEnd < FRANKFURT_COOLDOWN then return false end
		if math.random(1,100) < 30 then return false end
		
		if bc:getZoneByName('Frankfurt').side ~= 2 then return false end
		
		local canAttack = false
		for i,v in pairs(FrankfurtForce) do
			if bc:getZoneByName(i).side == 1 then canAttack = true end
			
			for _,v2 in ipairs(v) do
				if Group.getByName(v2) then return false end
			end
		end
		
		return canAttack
	end
})

mc:trackMission({
	title = "Defend Frankfurt",
	description = "The enemy is preparing an all out attack on Frankfurt.\nDefend the airfield at all cost.",
	messageStart = "New mission: Defend Frankfurt",
	messageEnd = function() lastFrankfurtEnd = timer.getTime() return "Mission ended: Defend Frankfurt" end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	isActive = function()
		for i,v in pairs(FrankfurtForce) do
			for _,v2 in ipairs(v) do
				if Group.getByName(v2) then return true end
			end
		end
		
		return false
	end
})

-----------------------------------------------------------------------------------------------


mc:trackMission({
    title = "Destroy artillery headed toward Frankfurt",
    description = "Artillery has been spotted heading towards Frankfurt from the direction of Laubach FARP.\nDestroy them before they get in range.",
    messageStart = "New mission: Destroy artillery",
    messageEnd = "Mission ended: Destroy artillery",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
        RegisterGroupTarget('Laubach FARP-attack-frankfurt',100,'Destroy artillery')
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        local gr = Group.getByName('Laubach FARP-attack-frankfurt')
        if gr then return true else return false end
    end
})

--------------------------------   EVENT Cargo intercept -------------------------------------------
local Cargo_COOLDOWN = 7200
local lastCargo_COOLDOWN   = -Cargo_COOLDOWN
Group.getByName('evt-cargointercept1'):destroy()
Group.getByName('evt-cargointercept2'):destroy()
Group.getByName('evt-cargointercept3'):destroy()
local cargoDieEvent=nil
evc:addEvent({
	id='cargointercept',
	action=function()
		local planes
		if bc:getZoneByName('Mahlwinkel').side==1 then
			planes={'evt-cargointercept1'}
		elseif bc:getZoneByName('Hannover').side==1 then
			planes={'evt-cargointercept2'}
		elseif bc:getZoneByName('Peenemunde').side==1 then
			planes={'evt-cargointercept3'}
		else
			return
		end
		RespawnGroup(planes[1])
        local u = Group.getByName(planes[1]):getUnit(1)
        if u then RegisterUnitTarget(u:getName(),250,'Cargo plane mission') end
	end,
	canExecute=function()
        if timer.getTime() - lastCargo_COOLDOWN < Cargo_COOLDOWN then return false end
		if math.random(1,100)<50 then return false end
		if Group.getByName('evt-cargointercept1') then return false end
		if Group.getByName('evt-cargointercept2') then return false end
		if Group.getByName('evt-cargointercept3') then return false end
		return true
	end
})
mc:trackMission({
    title = "Intercept cargo plane",
    description = function()
		if Group.getByName('evt-cargointercept1') then
			return "Find and destroy the cargo plane headed to Mahlwinkel\ninbound from the west."
		elseif Group.getByName('evt-cargointercept2') then
			return "Find and destroy the cargo plane headed to Hannover\ninbound from the southeast."
		elseif Group.getByName('evt-cargointercept3') then
			return "Find and destroy the cargo plane headed to Peenemunde\ninbound from the southwest."
		else
			return "Cargo plane is no longer active."
		end
	end,
    messageStart = "New mission: Intercept cargo plane",
    messageEnd =function() lastCargo_COOLDOWN=timer.getTime() return "Mission ended: Intercept cargo plane" end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "radio1.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('evt-cargointercept1') then return true end
        if Group.getByName('evt-cargointercept2') then return true end
        if Group.getByName('evt-cargointercept3') then return true end
        
        return false
    end
})

----------------------------------------------------- End of EVENT Cargo intercept --------------------------------------------------------
local sceneryList = {
  ["KommandantGunter"] = {SCENERY:FindByZoneName("KommandantGunter")},
  ["StrikeTarget1"] = {SCENERY:FindByZoneName("StrikeTarget1")},
  ["NaziReunion"] = {SCENERY:FindByZoneName("NaziReunion")},
  ["HannoverSupply"] = {SCENERY:FindByZoneName("HannoverSupply")},
  
}

-------------------------------------------------------- Hannover Supply --------------------------------------------------------
evc:addEvent({
    
	id = 'HannoverSupply',
	action = function()
		ActiveMission['HannoverSupply'] = true
		local tgt = sceneryList['HannoverSupply'][1] or SCENERY:FindByZoneName('HannoverSupply')
		if not tgt then
			trigger.action.outText('HannoverSupply scenery missing',30)
			return
		end
		RegisterScoreTarget('HannoverSupply',tgt,100,'Hannover supply warehouse')
	end,
	canExecute = function()
		if CustomFlags['HannoverSupply'] then return false end
		if ActiveMission['HannoverSupply'] then return false end
		if bc:getZoneByName('Hannover').side ~= 1 then return false end
		if bc:getZoneByName('Braunschweig').side ~= 2 then return false end
		return true
	end
})
mc:trackMission({
	title = "Strike Hannover supply warehouse",
	description = 
[[Strike Hannover supply warehouse to cripple the supplies to
the 2 SAM sites in the area.

Coordinates:
MGRS: 32 U ND 47006 12542
Lat long: N 52°27'39" E 09°41'30"
Lat long Decimal Minutes: N 52°27.661' E 09°41.511'
Elevation: 168 feet

reward = 100]],
	messageStart = "New strike mission: Strike Hannover supply warehouse\nCoords are in the mission description",
	messageEnd = "Mission ended: Strike Hannover supply warehouse",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	end,
	isActive = function()
	if CustomFlags["HannoverSupply"] then return false end
    if ActiveMission['HannoverSupply'] then return true end
	  return false
	end,
})
-------------------------------------------------- End of Hannover Supply ----------------------------------------------------

------------------------------------------------------- Nazi reunion --------------------------------------------------------
evc:addEvent({
	id = 'NaziReunion',
	action = function()
		ActiveMission['NaziReunion'] = true
		RespawnGroup('NaziGroup')
		local tgt = sceneryList['NaziReunion'][1] or SCENERY:FindByZoneName('NaziReunion')
		if not tgt then
			trigger.action.outText('NaziReunion scenery missing',30)
			return
		end
		RegisterScoreTarget('NaziGroup',tgt,500,'Strike the Nazis')
	end,
	canExecute = function()
		if CustomFlags['NaziReunion'] then return false end
		if ActiveMission['NaziReunion'] then return false end
		if bc:getZoneByName('Bremen').side ~= 2 then return false end
		return true
	end
})
mc:trackMission({
	title = "Strike the Nazi reunion",
	description = 
[[We have intel on a bunch of Nazis holding a reunion at theese coordinates:

MK84 ?

MGRS: 32 U ME 73410 36012
Lat long: N 53°34'20" E 08°35'54"
Lat long Decimal Minutes: N 53°34.338' E 08°35.908'
Elevation: 11 feet

reward = 500]],
	messageStart = "New strike mission: Strike the Nazi reunion\nCoords are in the mission description",
	messageEnd = "Mission ended: Strike the Nazi reunion",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	end,
	isActive = function()
	if CustomFlags["NaziReunion"] then return false end
    if ActiveMission['NaziReunion'] then return true end
	  return false
	end,
})
--------------------------------------------- End Nazi reunion ---------------------------------------------------

------------------------------------------ Kill Kommandant Günter ------------------------------------------------
Group.getByName('KommandantGunter'):destroy()
SecondManEvent = nil
evc:addEvent({
	id = 'kommandantgunter',
	action = function()
		ActiveMission['KommandantGunter'] = true
		local tgt = sceneryList['KommandantGunter'][1] or SCENERY:FindByZoneName('KommandantGunter')
		if not tgt then
			trigger.action.outText('KommandantGunter scenery missing',30)
			return
		end
		RespawnGroup('KommandantGunter')
		RegisterScoreTarget('KommandantGunter',tgt,500,'Kill Kommandant Günter')
	end,
	canExecute = function()
		if CustomFlags['KommandantGunter'] then return false end
		if ActiveMission['KommandantGunter'] then return false end
		if bc:getZoneByName('Mahlwinkel').side ~= 2 then return false end
		return true
	end
})

mc:trackMission({
	title = "Kill Kommandant Günter",
description = 
[[We have the Kommandant Günter location, He is
south of Hildesheim Airport, Take him out!.

Coordinates:
MGRS: 32 U NC 66314 77828
Lat Long: N 52°08'49" E  09°58'08"
Lat long Decimal Minutes: N 52°08.818' E 09°58.149'

Elevation: 394 feet

Reward: 500

Destroy the house and whoever is nearby.]],

	messageStart = "New strike mission: Kill Kommandant Günter",
	messageEnd = "Strike mission ended: Kill Kommandant Günter\nCoords are in the mission description",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	end,
	isActive = function()
		if CustomFlags["KommandantGunter"] then return false end
		if Group.getByName('KommandantGunter') then return true end
		return false
	end
})
------------------------------------- End Kill Kommandant Günter -----------------------------------------
----------------------------------- Strike enemy communication tower -------------------------------------
evc:addEvent({
	id = 'StrikeTarget1',
	action = function()
		ActiveMission['StrikeTarget1'] = true
		local tgt = sceneryList['StrikeTarget1'][1] or SCENERY:FindByZoneName('StrikeTarget1')
		if not tgt then
			trigger.action.outText('StrikeTarget1 scenery missing',30)
			return
		end
		RegisterScoreTarget('StrikeTarget1',tgt,500,'Strike enemy communication tower')
	end,
	canExecute = function()
		if CustomFlags['StrikeTarget1'] then return false end
		if ActiveMission['StrikeTarget1'] then return false end
		if bc:getZoneByName('Fritzlar').side ~= 2 then return false end
		return true
	end
})
mc:trackMission({
	title = "Strike enemy communication tower",
	description = 
[[Strike enemy communication tower at these coordinates:

MGRS: 32 U NC 51769 29542
Lat long: N 51°42'51" E 09°44'57"
Lat long Decimal Minutes: N 51°42.865' E 09°44.960'
Elevation: 1378 feet

reward = 500]],
	messageStart = "New strike mission: Strike enemy communication tower",
	messageEnd = "Mission ended: Strike enemy communication tower",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	end,
	isActive = function()
	if CustomFlags["StrikeTarget1"] then return false end
    if ActiveMission['StrikeTarget1'] then return true end
	  return false
	end,
})
------------------------------------- End Strike enemy communication tower -----------------------------------------

local EscortCooldown = 7200
local lastEscortCooldown   = -EscortCooldown

Group.getByName('escort-me'):destroy()
Group.getByName('interceptor-1'):destroy()
Group.getByName('interceptor-2'):destroy()
evc:addEvent({
	id='escort',
	action = function()
		RespawnGroup('escort-me')
		
	local function spawnIntercept(args)
		local groupname = args[1]
			local g = GROUP:FindByName(groupname)
			if not g then
				if math.random(1,100) > 30 then
					if math.random(1,100) > 50 then
						trigger.action.outTextForCoalition(2,'Enemy interceptor spotted heading for our cargo transport.',15)
					else
						trigger.action.outTextForCoalition(2,'The enemy has launched an intercept mission against our cargo transport',15)
					end
					RespawnGroup(groupname)
				end
			end
		end
		local timers = {math.random(10*60,20*60), math.random(15*60,25*60)}
		local timers = {math.random(10*60,20*60), math.random(15*60,25*60)}
		timer.scheduleFunction(spawnIntercept, {'interceptor-1'}, timer.getTime() + timers[1])
		timer.scheduleFunction(spawnIntercept, {'interceptor-2'}, timer.getTime() + timers[2])
	end,
	canExecute = function()
        if timer.getTime() - lastEscortCooldown < EscortCooldown then return false end
		local gr = Group.getByName('escort-me')
		if gr then return false end
		if bc:getZoneByName('Frankfurt').side ~= 2 then return false end
		local triggers = {'Frankfurt', 'Leipzig', 'Mahlwinkel'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})
mc:trackMission({
    title = "Escort cargo plane from Frankfurt",
    description = "Friendly cargo plane is taking off from Frankfurt. Protect it until it leaves the airspace.",
    messageStart = "New mission: Escort cargo plane",
    messageEnd = function() lastEscortCooldown = timer.getTime() return "Mission ended: Escort cargo plane" end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('escort-me') then return true end
        return false
    end
})

Group.getByName('EnemScuds'):destroy()
evc:addEvent({
	id='scuds',
	action=function()
		RespawnGroup('EnemScuds')
        RegisterGroupTarget('EnemScuds',250,'Destroy enemy Scuds','ScudsIsDestroyed')

		timer.scheduleFunction(function()
			if IsGroupActive('EnemScuds') then
                local scudGrp = GROUP:FindByName('EnemScuds')
                local _,_,_,_,missilesLeft = scudGrp:GetAmmunition()
                 if missilesLeft == 0 then return timer.getTime() + (45*60) end
				local tgts={'Frankfurt','Giebelstadt','Walldurn FARP','Walldorf FARP','Bad Durkheim','Ramstein','Hahn','Gelnhausen'}
				local valid={}
				for _,v in ipairs(tgts) do
					if bc:getZoneByName(v).side==2 then valid[#valid+1]=v end
				end
				if #valid==0 then return timer.getTime()+(10*60) end

				local choice=valid[math.random(1,#valid)]
				bc:fireAtZone(choice,'EnemScuds',false,8)
				trigger.action.outTextForCoalition(2,'Enemy SCUDs launching at '..choice,15)
			end
			return timer.getTime()+(45*60)
		end,{},timer.getTime()+(20*60))
	end,
	canExecute=function()
		if IsGroupActive('EnemScuds') then return false end
		if CustomFlags["ScudsIsDestroyed"] then return false end
		local triggers={'Frankfurt','Walldorf FARP','Giebelstadt','Gelnhausen'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side==2 then return true end
		end
		return false
	end
})

mc:trackMission({
    title = "Destroy enemy SCUDS",
	description = 
[[Strike enemy scuds before they fire.

Coordinates:
MGRS: 32 U PC 28469 06081
Lat long: N 51°29'28" E 10°51'01"
Lat long Decimal Minutes: N 51°29.476' E 10°51.031'

Elevation: 623 feet

reward = 500]],
    messageStart = "New mission: Destroy enemy Scuds\nCoords are in the mission description",
    messageEnd = "Mission ended: Destroy SCUDS",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if CustomFlags["ScudsIsDestroyed"] then return false end
        local gr = Group.getByName('EnemScuds')
        if gr then return true else return false end
    end
})

---------------------------------------------------------------------
--                          CAP MISSION                            --

capMissionTarget = nil
capKillsByPlayer = {}
capTargetPlanes = 0
capWinner = nil
capMissionCooldownUntil = 0

mc:trackMission({
    title = function() return "CAP mission" end,
    description = function()
        if not next(capKillsByPlayer) then
            return "Kill "..capTargetPlanes.." A/A targets without getting shot down, who wins?"
        else
            local scoreboard = "Current Kill Count:\n"
            for playerName, kills in pairs(capKillsByPlayer) do
                scoreboard = scoreboard .. string.format("%s: %d\n", playerName, kills)
            end
            return string.format("Kill %d A/A targets, who wins?\n\n%s", capTargetPlanes, scoreboard)
        end
    end,
    messageStart = function()
        return "New CAP mission: Kill "..capTargetPlanes.." A/A targets." end,
    messageEnd = '',
    startAction = function()
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
	endAction = function()
        if capWinner then
            local reward = capTargetPlanes * 30
            local pname  = capWinner
            bc.playerContributions[2][pname] = (bc.playerContributions[2][pname] or 0) + reward
            bc:addTempStat(pname,'CAP mission',1)
            trigger.action.outTextForCoalition(2,"["..pname.."] completed the CAP mission!\nReward pending: "..reward.." credits (land to redeem).",20)
            capMissionCooldownUntil = timer.getTime() + 900
        end
        capMissionTarget = nil
        capKillsByPlayer = {}
        capWinner        = nil
        capTargetPlanes  = 0
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2,"cancel.ogg")
        end
	end,
    isActive = function()
        if not capMissionTarget then return false end
        return true
    end
})
--                    End of CAP MISSION                           --
---------------------------------------------------------------------

---------------------------------------------------------------------
--                          CAS MISSION                            --
casMissionTarget = nil
casKillsByPlayer = {}
casTargetKills = 0
casWinner = nil
casMissionCooldownUntil = 0

mc:trackMission({
	title = function() return 'CAS mission' end,
	description = function()
		if not next(casKillsByPlayer) then
			return 'Destroy '..casTargetKills..' ground targets without getting shot down, who wins?'
		else
			local scoreboard = 'Current Kill Count:\n'
			for playerName, kills in pairs(casKillsByPlayer) do
				scoreboard = scoreboard..string.format('%s: %d\n', playerName, kills)
			end
			return string.format('Destroy %d ground targets, who wins?\n\n%s', casTargetKills, scoreboard)
		end
	end,
	messageStart = function()
		return 'New CAS mission: Destroy '..casTargetKills..' ground targets.'
	end,
	messageEnd = '',
	startAction = function()
		if not missionCompleted then trigger.action.outSoundForCoalition(2,'ding.ogg') end
	end,
   endAction = function()
        if casWinner then
            local reward = casTargetKills*20
            local pname  = casWinner
            bc.playerContributions[2][pname] = (bc.playerContributions[2][pname] or 0) + reward
            bc:addTempStat(pname,'CAS mission',1)

            trigger.action.outTextForCoalition(2,'['..pname..'] completed the CAS mission!\nReward pending: '..reward..' credits (land to redeem).',20)
            casMissionCooldownUntil = timer.getTime()+900
        end
        casMissionTarget  = nil
        casKillsByPlayer  = {}
        casWinner         = nil
        casTargetKills    = 0
        if not missionCompleted then trigger.action.outSoundForCoalition(2,'cancel.ogg') end
    end,
	isActive = function()
		if not casMissionTarget then return false end
		return true
	end
})
--                    End of CAS MISSION                           --
---------------------------------------------------------------------
---------------------------------------------------------------------
--                     		ESCORT MISSION                         --

function generateEscortMission(zoneName, groupName, groupID, group, mission)
    local mission = mission or missions[zoneName]
    if not mission then return false end

    missionGroupIDs[zoneName] = missionGroupIDs[zoneName] or {}
    missionGroupIDs[zoneName][groupID] = {
        groupID = groupID,
        group = group
    }
	if IsGroupActive(mission.missionGroup) then
		trigger.action.outSoundForGroup(groupID, "ding.ogg")
		trigger.action.outTextForGroup(groupID, "Active mission is pending:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
        return
    end
	if mc.missionFlags[zoneName] then
			trigger.action.outSoundForGroup(groupID, "ding.ogg")
			trigger.action.outTextForGroup(groupID, "Special mission available:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
		return 
	end

    mc:trackMission({
        MainTitle = function() return "Escort mission" end,
        title = function() return "Escort mission" end,
		titleBefore = function(self)
			self.notified = true
			trigger.action.outSoundForGroup(groupID, "ding.ogg")
			trigger.action.outTextForGroup(groupID, "Special mission available:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
		 end,
        description = function() return "\nEscort a convoy to " .. mission.TargetZone .. "\nThe roads are filled with hostile enemies." end,
        isEscortMission = true,
        accept = false,
        missionGroup = mission.missionGroup,
        zoneName = zoneName,
        messageStart = function() return "Escort convoy to " .. mission.TargetZone end,
		missionFail = function(self)
		self.accept = false
		if not IsGroupActive(mission.missionGroup) then
			mc.missionFlags[zoneName] = nil
			if missionGroupIDs[zoneName] and next(missionGroupIDs[zoneName]) then
				for groupName, data in pairs(missionGroupIDs[zoneName]) do
					local groupID = data.groupID
					local group = data.group
					trigger.action.outSoundForGroup(groupID, "cancel.ogg")
					trigger.action.outTextForGroup(groupID, "Mission failed:\n\nConvoy was destroyed\n\nStandby, looking for a new group...", 30)
					removeMissionMenuForAll(mission.zone, groupID)
					if trackedGroups[groupName] then
						trackedGroups[groupName] = nil
						--handleMission(zoneName, groupName, groupID, group)
					end
				end
			else
				trigger.action.outSoundForCoalition(2, "cancel.ogg")
				trigger.action.outTextForCoalition(2, "Mission failed:\n\nConvoy was destroyed", 30)
				removeMissionMenuForAll(mission.zone, nil, true)
				destroyGroupIfActive(mission.missionGroup)
			end
			return true
		end
		return false
		end,
		startOver = function(self)
			timer.scheduleFunction(function()
		if missionGroupIDs[zoneName] then
			for groupName, data in pairs(missionGroupIDs[zoneName]) do
				local groupID = data.groupID
				local group = data.group
				handleMission(zoneName, groupName, groupID, group)
				return nil
			end
		end	
			end, nil, timer.getTime() + 10)
		end,
        startAction = function() return IsGroupActive(mission.missionGroup) end,
		endAction = function()
			local targetZone = bc:getZoneByName(mission.TargetZone)
			if targetZone.side == 2 and targetZone.active then
				local reward   = 1000
				local playlist = {}
				if missionGroupIDs[zoneName] then
					for _, data in pairs(missionGroupIDs[zoneName]) do
						local grp = data.group
						if grp and grp:isExist() then
							for _, u in pairs(grp:getUnits()) do
								local pl = u:getPlayerName()
								if pl and pl ~= "" then
									playlist[pl] = true
								end
							end
						end
					end
				end
				local cnt   = 0
				local names = {}
				for pl in pairs(playlist) do
					cnt = cnt + 1
					names[#names + 1] = pl
				end
				local share = cnt > 0 and math.floor(reward / cnt) or reward
				if cnt > 0 then
					for pl in pairs(playlist) do
						if bc.playerContributions[2][pl] ~= nil then
							bc.playerContributions[2][pl] = bc.playerContributions[2][pl] + share
							bc:addTempStat(pl,'Escort Mission',1)
						end
					end
				else
					bc:addFunds(2, reward)
				end
				if missionGroupIDs[zoneName] then
					for groupName, data in pairs(missionGroupIDs[zoneName]) do
						local groupID = data.groupID
						local grp     = data.group
						if grp and grp:isExist() then
							removeMissionMenuForAll(mission.zone, groupID)
						end
						if trackedGroups[groupName] then
							trackedGroups[groupName] = nil
						end
						destroyGroupIfActive(mission.missionGroup)
						timer.scheduleFunction(function()
							handleMission(mission.TargetZone, groupName, groupID, grp)
						end, nil, timer.getTime() + 30)
					end
				else
					removeMissionMenuForAll(mission.zone, nil, true)
					destroyGroupIfActive(mission.missionGroup)
				end
				mc.missionFlags[zoneName] = nil
				local msg
				if cnt > 1 then
					msg = "Escort mission completed by " .. table.concat(names, ", ") .. "\ncredit " .. share .. " each - land to redeem"
				elseif cnt == 1 then
					msg = "Escort mission completed by " .. names[1] .. "\ncredit " .. reward .. " - land to redeem"
				else
					msg = "Escort mission completed — no players alive.\nReward + " .. reward
				end
				trigger.action.outSoundForCoalition(2, "ding.ogg")
				trigger.action.outTextForCoalition(2, msg, 20)
				return true
			end
			return false
		end,
        isActive = function()
            local targetZone = bc:getZoneByName(mission.TargetZone)
            if targetZone.side ~= 2 and targetZone.active then
                return true
            end
            return false
        end,
        returnAccepted = function(self)
            if not self.accept then return false end
            return IsGroupActive(mission.missionGroup)
        end,
    })

    mc.missionFlags[zoneName] = true
	mc.escortMissionGenerated = true
end

---------------------------------------------------------------------
--                     END OF ESCORT MISSION                       --
---------------------------------------------------------------------
--                      RUN WAY STRIKE MISSION                     --

mc:trackMission({
    title=function() return 'Bomb runway' end,
    description=function()
      local wp=WaypointList[runwayTargetZone] or ""
      if #runwayNames>1 then
        return 'Drop 1 bomb on each runway at '..runwayTargetZone..wp
      else
        return 'Drop 1 bomb on the runway at '..runwayTargetZone..wp
      end
    end,
    messageStart=function()
    local wp=WaypointList[runwayTargetZone] or ""
      if #runwayNames>1 then
        return 'New mission: Bomb all runways at '..runwayTargetZone..wp
      else
        return 'New mission: Bomb runway at '..runwayTargetZone..wp
      end
    end,
	messageEnd = function()
		trigger.action.outSoundForCoalition(2,'cancel.ogg')
		if runwayTargetZone then
			if runwayCompleted then
				return 'Mission ended: Bomb runway at '..runwayTargetZone..' completed'..(bomberName and (' by '..bomberName..'\ncredit 100 - land to redeem') or '')
			else
				return 'Mission ended: Bomb runway at '..runwayTargetZone..' canceled'
			end
		else
			return 'Mission canceled: Bomb runway'
		end
	end,
	startAction = function()
	ActiveCurrentMission[runwayTargetZone] = ActiveCurrentMission[runwayTargetZone] or {}
	ActiveCurrentMission[runwayTargetZone]["Bomb runway"] = true

	local z = bc:getZoneByName(runwayTargetZone) if z then z:updateLabel() end
	if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
		trigger.action.outSoundForCoalition(2, "ding.ogg")
	end
	end,
	endAction = function()
	if RunwayHandler then
		RunwayHandler:UnHandleEvent(EVENTS.Shot)
		RunwayHandler = nil
		runwayMission = nil
	end
	RUNWAY_ZONE_COOLDOWN[runwayTargetZone]=timer.getTime()+1800
	runwayCooldown = timer.getTime()+900
	local t = ActiveCurrentMission[runwayTargetZone]
	if t then
		t["Bomb runway"] = nil
		if not next(t) then ActiveCurrentMission[runwayTargetZone] = nil end
	end
	local z = bc:getZoneByName(runwayTargetZone) if z then z:updateLabel() end
	runwayTargetZone, bomberName, runwayTarget = nil, nil, nil
	end,
	isActive = function()
        if not runwayMission then return false end
        local targetzn = bc:getZoneByName(runwayTargetZone)
        return targetzn and targetzn.side == 1
    end
})

---------------------------------------------------------------------
--                 END OF RUN WAY STRIKE MISSION                   --

resupplyTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[resupplyTarget] or ""
        return "Resupply " .. resupplyTarget .. wp
    end,
    description = function()
        return "Deliver supplies to " .. resupplyTarget end,
    messageStart = function()
        local wp = WaypointList[resupplyTarget] or ""
        return "New mission: Resupply " .. resupplyTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Resupply " .. resupplyTarget end,
    startAction = function()
        local MissionType = "Resupply"
        ActiveCurrentMission[resupplyTarget] = MissionType
        local z = bc:getZoneByName(resupplyTarget) ; if z then z:updateLabel() end
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()       
        local MissionType = "Resupply"
        if ActiveCurrentMission[resupplyTarget] == MissionType then
            ActiveCurrentMission[resupplyTarget] = nil
        end
        local z = bc:getZoneByName(resupplyTarget) ; if z then z:updateLabel() end
        resupplyTarget = nil
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not resupplyTarget then return false end

        local targetzn = bc:getZoneByName(resupplyTarget)
        return targetzn and targetzn.side == 2 and targetzn:canRecieveSupply()
    end
})


attackTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[attackTarget] or ""
        return "Attack " .. attackTarget .. wp
    end,
    description = function()
        local wp = WaypointList[attackTarget] or ""
        return "Destroy enemy forces at " .. attackTarget end,
    messageStart = function()
        local wp = WaypointList[attackTarget] or ""
        return "New mission: Attack " .. attackTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Attack " .. attackTarget end,
	startAction = function()
		ActiveCurrentMission[attackTarget] = ActiveCurrentMission[attackTarget] or {}
		ActiveCurrentMission[attackTarget]["Attack"] = true
		local z = bc:getZoneByName(attackTarget) if z then z:updateLabel() end
		if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
			trigger.action.outSoundForCoalition(2, "cas.ogg")
		end
	end,
	endAction = function()
		local t = ActiveCurrentMission[attackTarget]
		if t then
			t["Attack"] = nil
			if not next(t) then ActiveCurrentMission[attackTarget] = nil end
		end
		local z = bc:getZoneByName(attackTarget) if z then z:updateLabel() end
		attackTarget = nil
		if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
			trigger.action.outSoundForCoalition(2, "cancel.ogg")
		end
	end,
    isActive = function()
        if not attackTarget then return false end
        local targetzn = bc:getZoneByName(attackTarget)
        return targetzn.side == 1
    end
})
captureTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[captureTarget] or ""
        return "Capture " .. captureTarget .. wp
    end,
    description = function()
        return captureTarget .. " is neutral. Capture it by delivering supplies" end,
    messageStart = function()
        local wp = WaypointList[captureTarget] or ""
        return "New mission: Capture " .. captureTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Capture " .. captureTarget end,
    startAction = function()
        local MissionType = "Capture"
        ActiveCurrentMission[captureTarget] = MissionType
        local z = bc:getZoneByName(captureTarget) ; if z then z:updateLabel() end
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
        local MissionType = "Capture"
        if ActiveCurrentMission[captureTarget] == MissionType then
            ActiveCurrentMission[captureTarget] = nil
        end
        local z = bc:getZoneByName(captureTarget) ; if z then z:updateLabel() end
        captureTarget = nil
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not captureTarget then return false end
        local targetzn = bc:getZoneByName(captureTarget)
        return targetzn.side == 0 and targetzn.active
    end
})


seadTarget = nil
function generateSEADMission()
    if seadTarget then return end
    if not attackTarget then return end

    local function isSEADZone(zone)
        local lname = zone.zone:lower()
        return zone.side == 1 and zone.active and (lname:find('sam') or lname:find('defence'))
    end

	local validSEADZones = {}
	local attackZone = bc:getZoneByName(attackTarget)

	if attackZone and attackZone.zone then
		local znA = attackZone.zone
		for _, zone in ipairs(bc.zones) do
			local znB = zone.zone
			local dist = ZONE_DISTANCES[znA] and ZONE_DISTANCES[znA][znB]
			if isSEADZone(zone) and dist and dist <= 24000 then
				table.insert(validSEADZones, zone.zone)
			end
		end
	end

    if #validSEADZones == 0 then
        for _, connection in ipairs(bc.connections) do
            local from = bc:getZoneByName(connection.from)
            local to = bc:getZoneByName(connection.to)

            if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
                if isSEADZone(from) then
                    table.insert(validSEADZones, from.zone)
                end
                if isSEADZone(to) then
                    table.insert(validSEADZones, to.zone)
                end
            end
        end
    end

    if #validSEADZones == 0 then return end

    seadTarget = validSEADZones[math.random(#validSEADZones)]
    return true
end

mc:trackMission({
    title = function() return "SEAD mission at " .. seadTarget end,
    description = function() return "Neutralize enemy SAM/defences at " .. seadTarget end,
    messageStart = function() return "New SEAD mission: Engage SAM at " .. seadTarget end,
    messageEnd = function() return "SEAD mission ended" end,
    startAction = function()
        local MissionType = "SEAD"
        ActiveCurrentMission[seadTarget] = MissionType
        local z = bc:getZoneByName(seadTarget) ; if z then z:updateLabel() end
        if not missionCompleted then trigger.action.outSoundForCoalition(2,"ding.ogg") end
    end,
    endAction = function()
        local MissionType = "SEAD"
        if ActiveCurrentMission[seadTarget] == MissionType then
            ActiveCurrentMission[seadTarget] = nil
        end
        local z = bc:getZoneByName(seadTarget) ; if z then z:updateLabel() end
        seadTarget = nil
        if not missionCompleted then trigger.action.outSoundForCoalition(2,"cancel.ogg") end
    end,
    isActive = function()
        if not seadTarget then return false end
        local zn = bc:getZoneByName(seadTarget)
        return zn and zn.side == 1
    end
})

function generateCaptureMission()
    if captureTarget ~= nil then return end
    
    local validzones = {}
    for _, v in ipairs(bc.zones) do
        if v.active and v.side == 0 and (not v.NeutralAtStart or v.firstCaptureByRed) and 
           not string.find(v.zone, "Hidden") then
            table.insert(validzones, v.zone)
        end
    end
    
    if #validzones == 0 then return end
    
    local choice = math.random(1, #validzones)
    if validzones[choice] then
        captureTarget = validzones[choice]
        return true
    end
end


function generateAttackMission()
    if missionCompleted then return end
    if attackTarget ~= nil then return end

    local validzones = {}
    for _, v in ipairs(bc.connections) do
        local to = bc:getZoneByName(v.to)
        local from = bc:getZoneByName(v.from)

        local function checkValid(zone)
			local lname = zone.zone:lower()
            return zone.side == 1 and zone.active and not isZoneUnderSEADMission(zone.zone)
			and not lname:find('sam') and not lname:find('defence')
        end

        if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
            if checkValid(from) then table.insert(validzones, from.zone) end
            if checkValid(to)   then table.insert(validzones, to.zone)   end
        end
    end

    if #validzones == 0 then return end

    local choice = math.random(1, #validzones)
    attackTarget = validzones[choice]
    return true
end

function generateSupplyMission()
	if resupplyTarget ~= nil then return end
		
	local validzones = {}
	for _,v in ipairs(bc.zones) do
		if v.side == 2 and v:canRecieveSupply() then
			table.insert(validzones, v.zone)
		end
	end
	
	if #validzones == 0 then return end
	
	local choice = math.random(1, #validzones)
	if validzones[choice] then
		resupplyTarget = validzones[choice]
		return true
	end
end
timer.scheduleFunction(function(_, time)
	if generateCaptureMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 20)

timer.scheduleFunction(function(_, time)
	if generateAttackMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 35)

timer.scheduleFunction(function(_, time)
	if generateSEADMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 120)
timer.scheduleFunction(function(_, time)
	if checkAndGenerateCASMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 180)
timer.scheduleFunction(function(_, time)
	if generateSupplyMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 60)
timer.scheduleFunction(function(_,time)
   if checkAndGenerateCAPMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 480)
timer.scheduleFunction(function(_,time)
    if generateRunwayStrikeMission() then
        return time+300
    else
        return time+120
    end
end,{},timer.getTime()+210) 
mc:init()
evc:init()
----------------------- FLAGS --------------------------
function checkZoneFlags()

    if trigger.misc.getUserFlag("3") == 0 and zones.frankfurt.active and zones.frankfurt.wasBlue then
        trigger.action.setUserFlag("3", true)
    end
    if trigger.misc.getUserFlag("4") == 0 and zones.bindersleben.active and zones.bindersleben.wasBlue then
        trigger.action.setUserFlag("4", true)
        trigger.action.setUserFlag("3", false)
    end
    if trigger.misc.getUserFlag("5") == 0 and zones.braunschweig.wasBlue and not zones.fassberg.wasBlue then
        trigger.action.setUserFlag("5", true)
        trigger.action.setUserFlag("21", true)
    end
    if trigger.misc.getUserFlag("6") == 0 and zones.fassberg.wasBlue and not zones.werneuchen.wasBlue then
        trigger.action.setUserFlag("6", true)
        trigger.action.setUserFlag("5", false)
    end
    if trigger.misc.getUserFlag("7") == 0 and zones.werneuchen.wasBlue and zones.fassberg.wasBlue and (not zones.parchim.wasBlue) then
        trigger.action.setUserFlag("7", true)
        trigger.action.setUserFlag("6", false)
        trigger.action.setUserFlag("5", false)
    end
    if trigger.misc.getUserFlag("20") == 0 and zones.mahlwinkel.wasBlue then
        trigger.action.setUserFlag("20", true)
    end
        if trigger.misc.getUserFlag("8") == 0 and zones.neuruppin.wasBlue and (not zones.parchim.wasBlue) and zones.templin.wasBlue then
        trigger.action.setUserFlag("8", true)
    end
    if trigger.misc.getUserFlag("8") == 0 and IsGroupActive('awacs') and zones.fulda.active and zones.fulda.wasBlue then -- only tanker to move them down east of fulda.
        trigger.action.setUserFlag("8", true)
    end
    if trigger.misc.getUserFlag("9") == 0 and not zones.fassberg.active and not zones.parchim.wasBlue and zones.werneuchen.wasBlue then -- only tanker to move them down east of fulda.
        trigger.action.setUserFlag("9", true)
        trigger.action.setUserFlag("8", false)
        trigger.action.setUserFlag("7", false)
        trigger.action.setUserFlag("6", false)
        trigger.action.setUserFlag("5", false)
    end
        if trigger.misc.getUserFlag("10") == 0 and zones.larz.active and zones.parchim.wasBlue then -- only tanker to move them down east of fulda.
        trigger.action.setUserFlag("10", true)
        trigger.action.setUserFlag("9", false)
        trigger.action.setUserFlag("8", false)
        trigger.action.setUserFlag("7", false)
        trigger.action.setUserFlag("6", false)
        trigger.action.setUserFlag("5", false)
    end

end 
timer.scheduleFunction(function()
    checkZoneFlags()
    return timer.getTime() + 30
end, {}, timer.getTime() + 3)


buildingCache = buildingCache or {}
for _, z in ipairs(bc:getZones()) do
	local c = CustomZone:getByName(z.zone)
	if c then c:getZoneBuildings() end
end
-------------------------- END OF FLAGS --------------------------

env.info("Mission Setup : is completed!")
