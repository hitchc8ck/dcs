-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with Red AWACS and Red EWR.
detection_group_red = SET_GROUP:New()
detection_group_red:FilterPrefixes({"red_awacs", "red_ewr"})
detection_group_red:FilterStart()

detection_red = DETECTION_AREAS:New(detection_group_red, 120000)

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher_red = AI_A2A_DISPATCHER:New(detection_red)

-- Enable the tactical display panel.
A2ADispatcher_red:SetTacticalDisplay(false)

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name Red Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
red_border_zone = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ))
A2ADispatcher_red:SetBorderZone(red_border_zone)

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher_red:SetEngageRadius(120000)
A2ADispatcher_red:SetDisengageRadius(180000)


-- Setup the squadrons.
A2ADispatcher_red:SetSquadron( "Monchegorsk", AIRBASE.Kola.Monchegorsk, { "red_cap_south" }, 15 ) 
A2ADispatcher_red:SetSquadron( "Severomorsk_1", AIRBASE.Kola.Severomorsk_1, { "red_cap_north" }, 15 ) 

-- Setup the overhead
A2ADispatcher_red:SetSquadronOverhead("Monchegorsk", 0.5)
A2ADispatcher_red:SetSquadronOverhead("Severomorsk_1", 0.5)

-- Setup the Grouping
A2ADispatcher_red:SetSquadronGrouping("Monchegorsk", 2)
A2ADispatcher_red:SetSquadronGrouping("Severomorsk_1", 2)

-- Setup the Takeoff and Landing methods
A2ADispatcher_red:SetSquadronTakeoff("Monchegorsk", AI_A2A_DISPATCHER.Takeoff.Hot)
A2ADispatcher_red:SetSquadronLanding("Monchegorsk", AI_A2A_DISPATCHER.Takeoff.Hot)

A2ADispatcher_red:SetSquadronTakeoff("Severomorsk_1", AI_A2A_DISPATCHER.Landing.AtRunway)
A2ADispatcher_red:SetSquadronLanding("Severomorsk_1", AI_A2A_DISPATCHER.Landing.AtRunway)

-- Setup the CAP parameter
A2ADispatcher_red:SetIntercept(2)
A2ADispatcher_red:SetDefaultCapTimeInterval(7000, 10000)

-- CAP Squadron execution.
-- FloorAltitude, CeilingAltitude, PatrolMinSpeed, PatrolMaxSpeed, EngageMinSpeed, EngageMaxSpeed, AltType
-- The altitude type, which is a string "BARO" defining Barometric or "RADIO" defining radio controlled altitude.
red_cap_airspace_south = ZONE_POLYGON:New("red_cap_airspace_south", GROUP:FindByName("red_cap_airspace_south"))
A2ADispatcher_red:SetSquadronCap("Monchegorsk", red_cap_airspace_south, 8000, 10000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_red:SetSquadronCapInterval("Monchegorsk", 1, 400, 800, 1)

red_cap_airspace_north = ZONE_POLYGON:New("red_cap_airspace_north", GROUP:FindByName("red_cap_airspace_north"))
A2ADispatcher_red:SetSquadronCap("Severomorsk_1", red_cap_airspace_north, 8000, 10000, 500, 600, 600, 1200, "RADIO")
A2ADispatcher_red:SetSquadronCapInterval("Severomorsk_1", 1, 400, 800, 1)

--set.SquadronCapIntervall SquadronName, CapLimit, LowInterval, HighInterval, Probability
A2ADispatcher_red:SetDefaultFuelThreshold(0.2)
-- A2ADispatcher_red:SetSquadronTanker("Monchegorsk", "redTanker1")

-- GCI Squadron execution.
-- A2ADispatcher_red:SetSquadronGci( "Monchegorsk", 800, 1500 )
-- A2ADispatcher_red:SetSquadronGci( "Severomorsk_1", 800, 1500 )

CleanUp_Monchegorsk = CLEANUP_AIRBASE:New({AIRBASE.Kola.Monchegorsk})
CleanUp_Severomorsk_1 = CLEANUP_AIRBASE:New({AIRBASE.Kola.Severomorsk_1})
A2ADispatcher_red:Start()