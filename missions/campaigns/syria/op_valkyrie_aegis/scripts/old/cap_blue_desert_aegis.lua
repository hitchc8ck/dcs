-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with blue AWACS and blue EWR.
detection_group_blue = SET_GROUP:New()
-- detection_group_blue:FilterPrefixes({"blue_awacs", "blue_ew"})
-- detection_group_blue:FilterStart()

detection_blue = DETECTION_AREAS:New(detection_group_blue, 120000)

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher_blue = AI_A2A_DISPATCHER:New(detection_blue)

-- Enable the tactical display panel.
A2ADispatcher_blue:SetTacticalDisplay(false)

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name blue Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
blue_border_zone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ))
A2ADispatcher_blue:SetBorderZone(blue_border_zone)

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher_blue:SetEngageRadius(100000)
A2ADispatcher_blue:SetDisengageRadius(150000)


-- Setup the squadrons.
A2ADispatcher_blue:SetSquadron( "Akrotiri", AIRBASE.Syria.Akrotiri, { "blue_air_cap_north-1" }, 10 ) 
A2ADispatcher_blue:SetSquadron( "Ramat_David", AIRBASE.Syria.Ramat_David, { "blue_air_cap_south-1"}, 10 ) 

-- Setup the overhead
A2ADispatcher_blue:SetSquadronOverhead("Akrotiri", 0.5)
A2ADispatcher_blue:SetSquadronOverhead("Ramat_David", 0.5)

-- Setup the Grouping
A2ADispatcher_blue:SetSquadronGrouping("Akrotiri", 2)
A2ADispatcher_blue:SetSquadronGrouping("Ramat_David", 2)

-- Setup the Takeoff and Landing methods
A2ADispatcher_blue:SetSquadronTakeoff("Akrotiri", AI_A2A_DISPATCHER.Takeoff.Hot)
A2ADispatcher_blue:SetSquadronLanding("Ramat_David", AI_A2A_DISPATCHER.Takeoff.Hot)

A2ADispatcher_blue:SetSquadronTakeoff("Akrotiri", AI_A2A_DISPATCHER.Landing.AtRunway)
A2ADispatcher_blue:SetSquadronLanding("Ramat_David", AI_A2A_DISPATCHER.Landing.AtRunway)

-- Setup the CAP parameter
A2ADispatcher_blue:SetIntercept(2)
A2ADispatcher_blue:SetDefaultCapTimeInterval(7000, 10000)

-- CAP Squadron execution.
-- FloorAltitude, CeilingAltitude, PatrolMinSpeed, PatrolMaxSpeed, EngageMinSpeed, EngageMaxSpeed, AltType
-- The altitude type, which is a string "BARO" defining Barometric or "RADIO" defining radio controlled altitude.
blue_cap_airspace_north = ZONE_POLYGON:New("blue_cap_airspace_north", GROUP:FindByName("blue_cap_airspace_north"))
A2ADispatcher_blue:SetSquadronCap("Akrotiri", blue_cap_airspace_north, 6000, 8000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_blue:SetSquadronCapInterval("Akrotiri", 1, 400, 800, 2)

blue_cap_airspace_south = ZONE_POLYGON:New("blue_cap_airspace_south", GROUP:FindByName("blue_cap_airspace_south"))
A2ADispatcher_blue:SetSquadronCap("Ramat_David", blue_cap_airspace_south, 6000, 8000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_blue:SetSquadronCapInterval("Ramat_David", 1, 400, 800, 2)

--set.SquadronCapIntervall SquadronName, CapLimit, LowInterval, HighInterval, Probability
A2ADispatcher_blue:SetDefaultFuelThreshold(0.2)
-- A2ADispatcher_blue:SetSquadronTanker("", "blueTanker1")

-- GCI Squadron execution.
-- A2ADispatcher_blue:SetSquadronGci( "", 800, 1500 )
-- A2ADispatcher_blue:SetSquadronGci( "", 800, 1500 )

CleanUp_Akrotiri = CLEANUP_AIRBASE:New({AIRBASE.Syria.Akrotiri})
CleanUp_Ramat_David = CLEANUP_AIRBASE:New({AIRBASE.Syria.Ramat_David})
A2ADispatcher_blue:Start()