-- Set up a basic system for the red side, we'll reside on Palmyra, and use GROUP objects with "red_ew" in the name as EW Radar Systems.
local red_air = EASYGCICAP:New("Red Airwing",AIRBASE.Syria.Palmyra,"red","red_ew")
red_air:SetDefaultCAPGrouping(2)
red_air:SetMaxAliveMissions(8)
red_air:SetDefaultMissionRange(50)

-- Palmyra Airbase
red_air:AddAirwing(AIRBASE.Syria.Palmyra,"697 Squadron Palmyra")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Palmyra,ZONE:FindByName("red_cap_airspace_center"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_mig29_1","697 Squadron Palmyra",AIRBASE.Syria.Palmyra,6,AI.Skill.RANDOM,100)
red_air:AddSquadron("red_air_mig29_2","697 Squadron Palmyra",AIRBASE.Syria.Palmyra,14,AI.Skill.RANDOM,140)

red_air:AddAirwing(AIRBASE.Syria.Palmyra,"12 Squadron Palmyra")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Palmyra,ZONE:FindByName("red_cap_airspace_center"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_mig21_1","12 Squadron Palmyra",AIRBASE.Syria.Palmyra,5,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_mig23_1","12 Squadron Palmyra",AIRBASE.Syria.Palmyra,5,AI.Skill.RANDOM,140)

-- Jirah Airbase
red_air:AddAirwing(AIRBASE.Syria.Jirah,"697 Squadron Jirah")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Jirah,ZONE:FindByName("red_cap_airspace_north"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_mig29_1","697 Squadron Jirah",AIRBASE.Syria.Jirah,6,AI.Skill.RANDOM,100)
red_air:AddSquadron("red_air_mig29_2","697 Squadron Jirah",AIRBASE.Syria.Jirah,14,AI.Skill.RANDOM,140)

red_air:AddAirwing(AIRBASE.Syria.Jirah,"12 Squadron Jirah")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Jirah,ZONE:FindByName("red_cap_airspace_north"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_mig21_1","12 Squadron Jirah",AIRBASE.Syria.Jirah,5,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_mig23_1","12 Squadron Jirah",AIRBASE.Syria.Jirah,5,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_mig25_1","12 Squadron Jirah",AIRBASE.Syria.Jirah,10,AI.Skill.RANDOM,100)

-- Sayqal Airbase
red_air:AddAirwing(AIRBASE.Syria.Sayqal,"697 Squadron Sayqal")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Sayqal,ZONE:FindByName("red_cap_airspace_south"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_mig29_1","697 Squadron Sayqal",AIRBASE.Syria.Sayqal,6,AI.Skill.RANDOM,100)
red_air:AddSquadron("red_air_mig29_2","697 Squadron Sayqal",AIRBASE.Syria.Sayqal,14,AI.Skill.RANDOM,140)

red_air:AddAirwing(AIRBASE.Syria.Sayqal,"12 Squadron Sayqal")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Sayqal,ZONE:FindByName("red_cap_airspace_south"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_mig21_1","12 Squadron Sayqal",AIRBASE.Syria.Sayqal,5,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_mig23_1","12 Squadron Sayqal",AIRBASE.Syria.Sayqal,5,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_mig25_1","12 Squadron Sayqal",AIRBASE.Syria.Sayqal,10,AI.Skill.RANDOM,100)

-- Add a couple of zones
-- We'll defend our own border
-- red_air:AddAcceptZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ) ))
-- -- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
-- red_air:AddConflictZone(ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" )))
-- -- We'll leave the reds alone on their turf
-- red_air:AddRejectZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) ))

-- -- **Note** If you need different tanker types, i.e. Boom and Drogue, set them up at different AirWings!
-- -- Add a tanker point
-- red_air:AddPatrolPointTanker(AIRBASE.Caucasus.Kutaisi,ZONE:FindByName("Blue Zone Tanker"):GetCoordinate(),20000,280,270,50)
-- -- Add a tanker squad - Radio 251 AM, TACAN 51Y
-- red_air:AddTankerSquadron("Blue Tanker","Tanker Ops Kutaisi",AIRBASE.Caucasus.Kutaisi,20,AI.Skill.EXCELLENT,602,nil,251,radio.modulation.AM,51)

-- Optional - Draw the borders on the map so we see what's going on
-- Set up borders on map
-- local BlueBorder = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ))
-- BlueBorder:DrawZone(-1,{0,0,1},1,FillColor,FillAlpha,1,true)
-- local ConflictZone = ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" ))
-- ConflictZone:DrawZone(-1,{1,1,0},1,FillColor,FillAlpha,2,true)
-- local BlueNoGoZone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) )
-- BlueNoGoZone:DrawZone(-1,{1,0,0},1,FillColor,FillAlpha,4,true)

-- red_air.debug = true -- log information
-- red_air.Monitor = true -- show some statistics on screen