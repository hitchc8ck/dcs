-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with blue AWACS and blue EWR.
detection_group_blue_big = SET_GROUP:New()
detection_group_blue_big:FilterPrefixes({"blue_awacs_big", "blue_ewr_big"})
detection_group_blue_big:FilterStart()

detection_group_blue_medium = SET_GROUP:New()
detection_group_blue_medium:FilterPrefixes({"blue_awacs_medium", "blue_ewr_medium"})
detection_group_blue_medium:FilterStart()

detection_group_blue_small = SET_GROUP:New()
detection_group_blue_small:FilterPrefixes({"blue_awacs_small", "blue_ewr_small"})
detection_group_blue_small:FilterStart()

detection_blue_big = DETECTION_AREAS:New(detection_group_blue_big, 185000)
detection_blue_medium = DETECTION_AREAS:New(detection_group_blue_medium, 144000)
detection_blue_small = DETECTION_AREAS:New(detection_group_blue_small, 90000)

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher_blue = AI_A2A_DISPATCHER:New(detection_blue_big, detection_blue_medium, detection_blue_small)

-- Enable the tactical display panel.
A2ADispatcher_blue:SetTacticalDisplay(false)

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name blue Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
blue_border_zone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ))
A2ADispatcher_blue:SetBorderZone(blue_border_zone)

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher_blue:SetEngageRadius(140000)
A2ADispatcher_blue:SetDisengageRadius(100000)


-- Setup the squadrons.
A2ADispatcher_blue:SetSquadron( "Rovaniemi", AIRBASE.Kola.Rovaniemi, { "blue_cap_south" }, 25 ) 
A2ADispatcher_blue:SetSquadron( "Banak", AIRBASE.Kola.Banak, { "blue_cap_north" }, 25 ) 

-- Setup the overhead
A2ADispatcher_blue:SetSquadronOverhead("Rovaniemi", 1)
A2ADispatcher_blue:SetSquadronOverhead("Banak", 1)

-- Setup the Grouping
A2ADispatcher_blue:SetSquadronGrouping("Rovaniemi", 2)
A2ADispatcher_blue:SetSquadronGrouping("Banak", 2)

-- Setup the Takeoff and Landing methods
A2ADispatcher_blue:SetSquadronTakeoff("Rovaniemi", AI_A2A_DISPATCHER.Takeoff.Hot)
A2ADispatcher_blue:SetSquadronLanding("Rovaniemi", AI_A2A_DISPATCHER.Takeoff.Hot)

A2ADispatcher_blue:SetSquadronTakeoff("Banak", AI_A2A_DISPATCHER.Landing.AtRunway)
A2ADispatcher_blue:SetSquadronLanding("Banak", AI_A2A_DISPATCHER.Landing.AtRunway)

-- Setup the CAP parameter
A2ADispatcher_blue:SetIntercept(30)
A2ADispatcher_blue:SetDefaultCapTimeInterval(7000, 10000)

-- CAP Squadron execution.
-- FloorAltitude, CeilingAltitude, PatrolMinSpeed, PatrolMaxSpeed, EngageMinSpeed, EngageMaxSpeed, AltType
-- The altitude type, which is a string "BARO" defining Barometric or "RADIO" defining radio controlled altitude.
blue_cap_airspace_south = ZONE_POLYGON:New("blue_cap_airspace_south", GROUP:FindByName("blue_cap_airspace_south"))
A2ADispatcher_blue:SetSquadronCap("Rovaniemi", blue_cap_airspace_south, 8000, 11000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_blue:SetSquadronCapInterval("Rovaniemi", 3, 400, 800, 1)

blue_cap_airspace_north = ZONE_POLYGON:New("blue_cap_airspace_north", GROUP:FindByName("blue_cap_airspace_north"))
A2ADispatcher_blue:SetSquadronCap("Banak", blue_cap_airspace_north, 8000, 11000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_blue:SetSquadronCapInterval("Banak", 3, 400, 800, 1)

--set.SquadronCapIntervall SquadronName, CapLimit, LowInterval, HighInterval, Probability
A2ADispatcher_blue:SetDefaultFuelThreshold(0.2)
-- A2ADispatcher_blue:SetSquadronTanker("Rovaniemi", "blueTanker1")

-- GCI Squadron execution.
A2ADispatcher_blue:SetSquadronGci( "Rovaniemi", 800, 1500 )
A2ADispatcher_blue:SetSquadronGci( "Banak", 800, 1500 )

-- CleanUp_Rovaniemi = CLEANUP_AIRBASE:New({AIRBASE.Kola.Rovaniemi})
-- CleanUp_Banak = CLEANUP_AIRBASE:New({AIRBASE.Kola.Banak})
A2ADispatcher_blue:Start()