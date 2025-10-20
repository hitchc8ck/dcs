-- Set up a basic system for the red side, we'll reside on Palmyra, and use GROUP objects with "red_ew" in the name as EW Radar Systems.
local red_air = EASYGCICAP:New("Red Palmyra Airwing",AIRBASE.Syria.Palmyra,"red","red_ew")

-- Add a CAP patrol point belonging to our airbase, we'll be at 30k ft doing 400 kn, initial direction 90 degrees (East), leg 20NM
red_air:AddPatrolPointCAP(AIRBASE.Syria.Palmyra,ZONE:FindByName("red_cap_airspace_center"):GetCoordinate(),25000,350,270,30)
-- Add a Squadron with template "red_air_cap_1", 20 airframes, skill good, Modex starting with 102
red_air:AddSquadron("red_air_cap_1","red_air_Palmyra_mig29I",AIRBASE.Syria.Palmyra,6,AI.Skill.RANDOM,101)
red_air:AddSquadron("red_air_cap_2","red_air_Palmyra_mig29II",AIRBASE.Syria.Palmyra,14,AI.Skill.RANDOM,110)
red_air:AddSquadron("red_air_cap_3","red_air_Palmyra_mig25",AIRBASE.Syria.Palmyra,5,AI.Skill.RANDOM,201)
red_air:AddSquadron("red_air_cap_4","red_air_Palmyra_mig23",AIRBASE.Syria.Palmyra,5,AI.Skill.RANDOM,301)
red_air:AddSquadron("red_air_cap_5","red_air_Palmyra_mig21",AIRBASE.Syria.Palmyra,5,AI.Skill.RANDOM,401)


red_air:AddAirwing(AIRBASE.Syria.Jirah,"Red Jirah Airwing")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Jirah,ZONE:FindByName("red_cap_airspace_north"):GetCoordinate(),30000,350,270,20)
red_air:AddSquadron("red_air_cap_1","red_air_Jirah_mig29I",AIRBASE.Syria.Jirah,6,AI.Skill.RANDOM,101)
red_air:AddSquadron("red_air_cap_2","red_air_Jirah_mig29II",AIRBASE.Syria.Jirah,14,AI.Skill.RANDOM,110)
red_air:AddSquadron("red_air_cap_3","red_air_Jirah_mig25",AIRBASE.Syria.Jirah,5,AI.Skill.RANDOM,201)
red_air:AddSquadron("red_air_cap_4","red_air_Jirah_mig23",AIRBASE.Syria.Jirah,5,AI.Skill.RANDOM,301)
red_air:AddSquadron("red_air_cap_5","red_air_Jirah_mig21",AIRBASE.Syria.Jirah,5,AI.Skill.RANDOM,401)

red_air:AddAirwing(AIRBASE.Syria.Sayqal,"Red Sayqal Airwing")
red_air:AddPatrolPointCAP(AIRBASE.Syria.Sayqal,ZONE:FindByName("red_cap_airspace_south"):GetCoordinate(),28000,400,230,30)
red_air:AddSquadron("red_air_cap_1","red_air_Sayqal_mig29I",AIRBASE.Syria.Sayqal,6,AI.Skill.RANDOM,101)
red_air:AddSquadron("red_air_cap_2","red_air_Sayqal_mig29II",AIRBASE.Syria.Sayqal,14,AI.Skill.RANDOM,110)
red_air:AddSquadron("red_air_cap_3","red_air_Sayqal_mig25",AIRBASE.Syria.Sayqal,5,AI.Skill.RANDOM,201)
red_air:AddSquadron("red_air_cap_4","red_air_Sayqal_mig23",AIRBASE.Syria.Sayqal,5,AI.Skill.RANDOM,301)
red_air:AddSquadron("red_air_cap_5","red_air_Sayqal_mig21",AIRBASE.Syria.Sayqal,5,AI.Skill.RANDOM,401)

-- Add a couple of zones
-- We'll defend our own border
red_air:AddAcceptZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ) ))
-- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
red_air:AddConflictZone(ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" )))
-- We'll leave the reds alone on their turf
red_air:AddRejectZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) ))

-- -- **Note** If you need different tanker types, i.e. Boom and Drogue, set them up at different AirWings!
-- -- Add a tanker point
-- red_air:AddPatrolPointTanker(AIRBASE.Caucasus.Kutaisi,ZONE:FindByName("Blue Zone Tanker"):GetCoordinate(),20000,280,270,50)
-- -- Add a tanker squad - Radio 251 AM, TACAN 51Y
-- red_air:AddTankerSquadron("Blue Tanker","Tanker Ops Kutaisi",AIRBASE.Caucasus.Kutaisi,20,AI.Skill.EXCELLENT,602,nil,251,radio.modulation.AM,51)

-- -- Optional - Draw the borders on the map so we see what's going on
-- -- Set up borders on map
-- local BlueBorder = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ))
-- BlueBorder:DrawZone(-1,{0,0,1},1,FillColor,FillAlpha,1,true)
-- local ConflictZone = ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" ))
-- ConflictZone:DrawZone(-1,{1,1,0},1,FillColor,FillAlpha,2,true)
-- local BlueNoGoZone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) )
-- BlueNoGoZone:DrawZone(-1,{1,0,0},1,FillColor,FillAlpha,4,true)

-- red_air.debug = true -- log information
-- red_air.Monitor = true -- show some statistics on screen