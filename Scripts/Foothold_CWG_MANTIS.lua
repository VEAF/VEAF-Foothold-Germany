mysamGermany = MANTIS:New("Germany", "Red SAM", "Red EWR", nil, "red", true, nil)
mysamGermany:SetSAMRange(110)
mysamGermany:SetDetectInterval(10)

ZoneTable_Mantis = SET_ZONE:New():FilterPrefixes("Scoot"):FilterStart()
mysamGermany:AddScootZones(ZoneTable_Mantis, 3, true, "Cone")
--mysamGermany:Debug(true)

mysamGermany:Start()

