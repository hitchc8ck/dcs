-- Set up a basic system for the red side, we'll reside on Palmyra, and use GROUP objects with "red_ew" in the name as EW Radar Systems.
local blue_air_akrotiri = EASYGCICAP:New("Blue Airwing Akrotiri",AIRBASE.Syria.Akrotiri,"blue","blue_ew")
blue_air_akrotiri:SetDefaultCAPGrouping(3)
blue_air_akrotiri:SetMaxAliveMissions(6)
blue_air_akrotiri:SetDefaultMissionRange(140)

blue_air_akrotiri:AddAirwing(AIRBASE.Syria.Akrotiri,"494th Panthers Akrotiri")
blue_air_akrotiri:AddPatrolPointCAP(AIRBASE.Syria.Akrotiri,ZONE:FindByName("blue_cap_airspace_north"):GetCoordinate(),28000,340,70,30)
blue_air_akrotiri:AddSquadron("blue_air_akrotiri_1","494th Panthers Akrotiri",AIRBASE.Syria.Akrotiri,14,AI.Skill.RANDOM,101)

blue_air_akrotiri:AddAirwing(AIRBASE.Syria.Akrotiri,"179th Bulldogs Akrotiri")
blue_air_akrotiri:AddPatrolPointCAP(AIRBASE.Syria.Akrotiri,ZONE:FindByName("blue_cap_airspace_north"):GetCoordinate(),28000,340,100,30)
blue_air_akrotiri:AddSquadron("blue_air_akrotiri_2","179th Bulldogs Akrotiri",AIRBASE.Syria.Akrotiri,14,AI.Skill.RANDOM,110)

-- Add a couple of zones
-- We'll defend our own border
blue_air_akrotiri:AddAcceptZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" )))
-- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
blue_air_akrotiri:AddConflictZone(ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" )))
-- We'll leave the reds alone on their turf
blue_air_akrotiri:AddRejectZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" )))

-- Set up a basic system for the red side, we'll reside on Palmyra, and use GROUP objects with "red_ew" in the name as EW Radar Systems.
local blue_air_ramatdavid = EASYGCICAP:New("Blue Airwing Ramat David",AIRBASE.Syria.Ramat_David,"blue","blue_ew")
blue_air_ramatdavid:SetDefaultCAPGrouping(2)
blue_air_ramatdavid:SetMaxAliveMissions(4)
blue_air_ramatdavid:SetDefaultMissionRange(30)

blue_air_ramatdavid:AddAirwing(AIRBASE.Syria.Ramat_David,"494th Panthers Ramat David")
blue_air_ramatdavid:AddPatrolPointCAP(AIRBASE.Syria.Ramat_David,ZONE:FindByName("blue_cap_airspace_south"):GetCoordinate(),28000,340,50,20)
blue_air_ramatdavid:AddSquadron("blue_air_ramat_david_1","494th Panthers Ramat David",AIRBASE.Syria.Ramat_David,14,AI.Skill.RANDOM,101)

blue_air_ramatdavid:AddAirwing(AIRBASE.Syria.Ramat_David,"179th Bulldogs Ramat David")
blue_air_ramatdavid:AddPatrolPointCAP(AIRBASE.Syria.Ramat_David,ZONE:FindByName("blue_cap_airspace_south"):GetCoordinate(),28000,340,50,20)
blue_air_ramatdavid:AddSquadron("blue_air_ramat_david_2","179th Bulldogs Ramat David",AIRBASE.Syria.Ramat_David,14,AI.Skill.RANDOM,110)

-- Add a couple of zones
-- We'll defend our own border
blue_air_ramatdavid:AddAcceptZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" )))
-- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
blue_air_ramatdavid:AddConflictZone(ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" )))
-- We'll leave the reds alone on their turf
blue_air_ramatdavid:AddRejectZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" )))

-- -- **Note** If you need different tanker types, i.e. Boom and Drogue, set them up at different AirWings!
-- -- Add a tanker point
-- blue_air:AddPatrolPointTanker(AIRBASE.Caucasus.Kutaisi,ZONE:FindByName("Blue Zone Tanker"):GetCoordinate(),20000,280,270,50)
-- -- Add a tanker squad - Radio 251 AM, TACAN 51Y
-- blue_air:AddTankerSquadron("Blue Tanker","Tanker Ops Kutaisi",AIRBASE.Caucasus.Kutaisi,20,AI.Skill.EXCELLENT,602,nil,251,radio.modulation.AM,51)

-- -- Optional - Draw the borders on the map so we see what's going on
-- -- Set up borders on map
-- local BlueBorder = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ))
-- BlueBorder:DrawZone(-1,{0,0,1},1,FillColor,FillAlpha,1,true)
-- local ConflictZone = ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" ))
-- ConflictZone:DrawZone(-1,{1,1,0},1,FillColor,FillAlpha,2,true)
-- local BlueNoGoZone = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ) )
-- BlueNoGoZone:DrawZone(-1,{1,0,0},1,FillColor,FillAlpha,4,true)

-- blue_air.debug = true -- log information
-- blue_air_akrotiri.Monitor = true -- show some statistics on screen
-- blue_air_ramatdavid.Monitor = true -- show some statistics on screen