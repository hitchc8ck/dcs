-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with Red AWACS and Red EWR.
detection_group_red = SET_GROUP:New()
-- detection_group_red:FilterPrefixes({"red_awacs", "red_ew"})
-- detection_group_red:FilterStart()

detection_red = DETECTION_AREAS:New(detection_group_red, 120000)

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher_red = AI_A2A_DISPATCHER:New(detection_red)

-- Enable the tactical display panel.
A2ADispatcher_red:SetTacticalDisplay(true)

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name Red Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
red_border_zone = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ))
A2ADispatcher_red:SetBorderZone(red_border_zone)

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher_red:SetEngageRadius(100000)
A2ADispatcher_red:SetDisengageRadius(150000)


-- Setup the squadrons.
A2ADispatcher_red:SetSquadron( "Jirah", AIRBASE.Syria.Jirah, { "red_cap_north-1", "red_cap_north-2" }, 10 ) 
A2ADispatcher_red:SetSquadron( "Palmyra", AIRBASE.Syria.Palmyra, { "red_cap_south-1", "red_cap_south-2" }, 10 ) 

-- Setup the overhead
A2ADispatcher_red:SetSquadronOverhead("Jirah", 0.5)
A2ADispatcher_red:SetSquadronOverhead("Palmyra", 0.5)

-- Setup the Grouping
A2ADispatcher_red:SetSquadronGrouping("Jirah", 2)
A2ADispatcher_red:SetSquadronGrouping("Palmyra", 2)

-- Setup the Takeoff and Landing methods
A2ADispatcher_red:SetSquadronTakeoff("Jirah", AI_A2A_DISPATCHER.Takeoff.Hot)
A2ADispatcher_red:SetSquadronLanding("Palmyra", AI_A2A_DISPATCHER.Takeoff.Hot)

A2ADispatcher_red:SetSquadronTakeoff("Jirah", AI_A2A_DISPATCHER.Landing.AtRunway)
A2ADispatcher_red:SetSquadronLanding("Palmyra", AI_A2A_DISPATCHER.Landing.AtRunway)

-- Setup the CAP parameter
A2ADispatcher_red:SetIntercept(2)
A2ADispatcher_red:SetDefaultCapTimeInterval(7000, 10000)

-- CAP Squadron execution.
-- FloorAltitude, CeilingAltitude, PatrolMinSpeed, PatrolMaxSpeed, EngageMinSpeed, EngageMaxSpeed, AltType
-- The altitude type, which is a string "BARO" defining Barometric or "RADIO" defining radio controlled altitude.
red_cap_airspace_south = ZONE_POLYGON:New("red_cap_airspace_south", GROUP:FindByName("red_cap_airspace_south"))
A2ADispatcher_red:SetSquadronCap("Palmyra", red_cap_airspace_south, 8000, 10000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_red:SetSquadronCapInterval("Palmyra", 1, 400, 800, 1)

red_cap_airspace_north = ZONE_POLYGON:New("red_cap_airspace_north", GROUP:FindByName("red_cap_airspace_north"))
A2ADispatcher_red:SetSquadronCap("Jirah", red_cap_airspace_north, 8000, 10000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_red:SetSquadronCapInterval("Jirah", 1, 400, 800, 1)

--set.SquadronCapIntervall SquadronName, CapLimit, LowInterval, HighInterval, Probability
A2ADispatcher_red:SetDefaultFuelThreshold(0.2)
-- A2ADispatcher_red:SetSquadronTanker("", "redTanker1")

-- GCI Squadron execution.
-- A2ADispatcher_red:SetSquadronGci( "", 800, 1500 )
-- A2ADispatcher_red:SetSquadronGci( "", 800, 1500 )

CleanUp_Jirah = CLEANUP_AIRBASE:New({AIRBASE.Syria.Jirah})
CleanUp_Palmyra = CLEANUP_AIRBASE:New({AIRBASE.Syria.Palmyra})
A2ADispatcher_red:Start()