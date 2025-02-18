--create an instance of the IADS
redIADS = SkynetIADS:create('red_idas')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
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
redIADS:addEarlyWarningRadarsByPrefix('red_ew')

--add all groups begining with group name 'SAM' to the IADS:
redIADS:addSAMSitesByPrefix('red_sam')

--add a command center:
commandCenter = StaticObject.getByName('red_cc_1')
redIADS:addCommandCenter(commandCenter)

commandCenter2 = StaticObject.getByName('red_cc_2')
redIADS:addCommandCenter(commandCenter2)

---we add a K-50 AWACs, manually. This could just as well be automated by adding an 'EW' prefix to the unit name:
redIADS:addEarlyWarningRadar('red_awacs')

--all SA-10 sites shall act as EW sites, meaning their radars will be on all the time:
redIADS:getSAMSitesByNatoName('SA-10'):setActAsEW(true)

--add a power source and a connection node for this EW radar:
-- local powerSource = StaticObject.getByName('Power-Source-EW-Center3')
-- local connectionNodeEW = StaticObject.getByName('Connection-Node-EW-Center3')
-- redIADS:getEarlyWarningRadarByUnitName('EW-Center3'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a connection node to this SA-2 site, and set the option for it to go dark, if it looses connection to the IADS:
-- local connectionNode = Unit.getByName('Mobile-Command-Post-SAM-SA-2')
-- redIADS:getSAMSiteByGroupName('SAM-SA-2'):addConnectionNode(connectionNode):setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK)

--this SA-2 site will go live at 70% of its max search range:
-- redIADS:getSAMSiteByGroupName('SAM-SA-2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--set the SA-15's as point defence for the SA-10 site. We set the SA-10 to always identify HARMs so we can demonstrate the point defence mechanism in Skynet.
--the SA-10 will stay online when shot at by HARMS as long as the point defences and SAM site have ammo and the saturation point is not reached.
-- local sa15 = redIADS:getSAMSiteByGroupName('SAM-SA-15-point-defence-SA-10')
-- redIADS:getSAMSiteByGroupName('SAM-SA-10'):addPointDefence(sa15):setHARMDetectionChance(100)

--set this SA-11 site to go live 70% of max range of its missiles (default value: 100%), its HARM detection probability is set to 50% (default value: 70%)
-- redIADS:getSAMSiteByGroupName('SAM-SA-11'):setGoLiveRangeInPercent(70):setHARMDetectionChance(50)

--this SA-6 site will always react to a HARM being fired at it:
-- redIADS:getSAMSiteByGroupName('SAM-SA-6'):setHARMDetectionChance(100)

--set this SA-11 site to go live at maximunm search range (default is at maximung firing range):
-- redIADS:getSAMSiteByGroupName('SAM-SA-11-2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()

--activate the IADS
redIADS:activate()	

--add the jammer
-- local jammer = SkynetIADSJammer:create(Unit.getByName('jammer-emitter'), redIADS)
-- jammer:masterArmOn()

--setup blue IADS:
-- blueIADS = SkynetIADS:create('BLUE IADS')
-- blueIADS:addSAMSitesByPrefix('BLUE-SAM')
-- blueIADS:addEarlyWarningRadarsByPrefix('BLUE-EW')
-- blueIADS:activate()
-- blueIADS:addRadioMenu()

-- local iadsDebug = blueIADS:getDebugSettings()
-- iadsDebug.IADSStatus = true
-- iadsDebug.contacts = true