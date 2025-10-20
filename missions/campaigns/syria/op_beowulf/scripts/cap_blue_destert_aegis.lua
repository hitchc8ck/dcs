-- Set up a basic system for the red side, we'll reside on Palmyra, and use GROUP objects with "red_ew" in the name as EW Radar Systems.
local blue_air = EASYGCICAP:New("Blue Akrotiri Airwing",AIRBASE.Syria.Akrotiri,"blue","blue_ew")

-- Add a CAP patrol point belonging to our airbase, we'll be at 30k ft doing 400 kn, initial direction 90 degrees (East), leg 20NM
blue_air:AddPatrolPointCAP(AIRBASE.Syria.Akrotiri,ZONE:FindByName("blue_cap_airspace_north"):GetCoordinate(),25000,400,270,30)
-- Add a Squadron with template "blue_air_cap_1", 20 airframes, skill good, Modex starting with 102
blue_air:AddSquadron("blue_air_cap_1","blue_air_cap_north-1",AIRBASE.Syria.Akrotiri,6,AI.Skill.RANDOM,101)
blue_air:AddSquadron("blue_air_cap_2","blue_air_cap_north-2",AIRBASE.Syria.Akrotiri,14,AI.Skill.RANDOM,110)


blue_air:AddAirwing(AIRBASE.Syria.Ramat_David,"Blue Ramat_David Airwing")
blue_air:AddPatrolPointCAP(AIRBASE.Syria.Ramat_David,ZONE:FindByName("blue_cap_airspace_south"):GetCoordinate(),30000,400,270,20)
blue_air:AddSquadron("blue_air_cap_1","blue_air_cap_south-1",AIRBASE.Syria.Ramat_David,6,AI.Skill.RANDOM,101)
blue_air:AddSquadron("blue_air_cap_2","blue_air_cap_south-2",AIRBASE.Syria.Ramat_David,14,AI.Skill.RANDOM,110)

-- Add a couple of zones
-- We'll defend our own border
blue_air:AddAcceptZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) ))
-- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
blue_air:AddConflictZone(ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" )))
-- We'll leave the reds alone on their turf
blue_air:AddRejectZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ) ))

-- -- **Note** If you need different tanker types, i.e. Boom and Drogue, set them up at different AirWings!
-- -- Add a tanker point
-- blue_air:AddPatrolPointTanker(AIRBASE.Caucasus.Kutaisi,ZONE:FindByName("Blue Zone Tanker"):GetCoordinate(),20000,280,270,50)
-- -- Add a tanker squad - Radio 251 AM, TACAN 51Y
-- blue_air:AddTankerSquadron("Blue Tanker","Tanker Ops Kutaisi",AIRBASE.Caucasus.Kutaisi,20,AI.Skill.EXCELLENT,602,nil,251,radio.modulation.AM,51)

-- Optional - Draw the borders on the map so we see what's going on
-- Set up borders on map
-- local BlueBorder = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ))
-- BlueBorder:DrawZone(-1,{0,0,1},1,FillColor,FillAlpha,1,true)
-- local ConflictZone = ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" ))
-- ConflictZone:DrawZone(-1,{1,1,0},1,FillColor,FillAlpha,2,true)
-- local BlueNoGoZone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) )
-- BlueNoGoZone:DrawZone(-1,{1,0,0},1,FillColor,FillAlpha,4,true)

-- blue_air.debug = true -- log information
-- blue_air.Monitor = true -- show some statistics on screen