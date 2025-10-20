--create an instance of the IADS
blueIADS = SkynetIADS:create('blue_idas')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = blueIADS:getDebugSettings()
iadsDebug.IADSStatus = false
iadsDebug.radarWentDark = false
iadsDebug.contacts = false
iadsDebug.radarWentLive = false
iadsDebug.noWorkingCommmandCenter = false
iadsDebug.samNoConnection = false
iadsDebug.jammerProbability = false
iadsDebug.addedEWRadar = false
iadsDebug.harmDefence = false
---end remove debug ---

--add all units with unit name beginning with 'EW' to the IADS:
blueIADS:addEarlyWarningRadarsByPrefix('blue_ew')

--add all groups begining with group name 'SAM' to the IADS:
blueIADS:addSAMSitesByPrefix('blue_sam')

--all patriot sites shall act as EW sites, meaning their radars will be on all the time:
blueIADS:getSAMSitesByNatoName('Patriot'):setActAsEW(true)

--add a command center:
blueCommandCenter = StaticObject.getByName('blue_cc_1')
blueIADS:addCommandCenter(blueCommandCenter)
blueCommandCenter2 = Unit.getByName('blue_cvw-8-1')
blueIADS:addCommandCenter(blueCommandCenter2)
blueCommandCenter3 = Unit.getByName('blue_cvw-5-1')
blueIADS:addCommandCenter(blueCommandCenter3)

--activate the radio menu to toggle IADS Status output
blueIADS:addRadioMenu()

--activate the IADS
blueIADS:activate()	

--add the jammer
-- local jammer = SkynetIADSJammer:create(Unit.getByName('jammer-emitter'), blueIADS)
-- jammer:masterArmOn()