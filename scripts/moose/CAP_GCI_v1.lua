-- Name: A2A GCI CAP
-- Author: FlightControl + Hitchcock_
-- Date Created: 30 Sep 2019

-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with Red AWACS and Red EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes({"REDAWACS", "REDEWR"})
DetectionSetGroup:FilterStart()
Detection = DETECTION_AREAS:New(DetectionSetGroup, 110000)

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New(Detection)

-- Enable the tactical display panel.
A2ADispatcher:SetTacticalDisplay(false)

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name Red Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
CCCPBorderZone = ZONE_POLYGON:New( "redBorderZone", GROUP:FindByName( "redBorderZone" ))
A2ADispatcher:SetBorderZone(CCCPBorderZone)

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius(100000)
A2ADispatcher:SetDisengageRadius(60000)

-- Setup the squadrons.
A2ADispatcher:SetSquadron( "Lincoln_County", AIRBASE.Nevada.Lincoln_County, { "SU_27_Ace" }, 26 ) 

-- Setup the overhead
A2ADispatcher:SetSquadronOverhead("Lincoln_County", 1)

-- Setup the Grouping
A2ADispatcher:SetSquadronGrouping("Lincoln_County", 2)

-- Setup the Takeoff and Landing methods
A2ADispatcher:SetSquadronTakeoff("Lincoln_County", AI_A2A_DISPATCHER.Takeoff.Air)
A2ADispatcher:SetSquadronLanding("Lincoln_County", AI_A2A_DISPATCHER.Takeoff.Runway)

-- Setup the CAP parameter
A2ADispatcher:SetIntercept(30)
A2ADispatcher:SetDefaultCapTimeInterval(7000, 10000)

-- CAP Squadron execution.
-- FloorAltitude, CeilingAltitude, PatrolMinSpeed, PatrolMaxSpeed, EngageMinSpeed, EngageMaxSpeed, AltType
-- The altitude type, which is a string "BARO" defining Barometric or "RADIO" defining radio controlled altitude.
CAPZoneBorder = ZONE_POLYGON:New("redCAPzoneBorder", GROUP:FindByName("redCAPzoneBorder"))
A2ADispatcher:SetSquadronCap("Lincoln_County", CAPZoneBorder, 5000, 13000, 400, 500, 500, 1200, "RADIO")
A2ADispatcher:SetSquadronCapInterval("Lincoln_County", 3, 100, 200, 1)

--set.SquadronCapIntervall SquadronName, CapLimit, LowInterval, HighInterval, Probability
A2ADispatcher:SetDefaultFuelThreshold(0.2)
A2ADispatcher:SetSquadronTanker("Lincoln_County", "redTanker1")

-- GCI Squadron execution.
-- A2ADispatcher:SetSquadronGci( "Lincoln_County", 800, 1500 )
CleanUp = CLEANUP_AIRBASE:New({AIRBASE.Nevada.Lincoln_County})
A2ADispatcher:Start()