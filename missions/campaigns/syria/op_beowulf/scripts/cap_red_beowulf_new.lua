-- Set up a basic system for the blue side, we'll reside on Kutaisi, and use GROUP objects with "Blue EWR" in the name as EW Radar Systems.
local red_air = EASYGCICAP:New("Red CAP Ops",AIRBASE.Syria.Jirah,"red","red_ew")

-- Add a CAP patrol point belonging to our airbase, we'll be at 30k ft doing 400 kn, initial direction 90 degrees (East), leg 20NM
red_air:AddPatrolPointCAP(AIRBASE.Syria.Jirah,ZONE:FindByName("red_cap_airspace_north"):GetCoordinate(),30000,400,270,30)

-- Add a Squadron with template "Blue Sq1 M2000c", 20 airframes, skill good, Modex starting with 102 and skin "Vendee Jeanne"
red_air:AddSquadron("red_air_cap_1","CAP Jirah",AIRBASE.Syria.Jirah,20,AI.Skill.RANDOM,100,"ec1.5_Vendee_Jeanne_clean")

-- Add a couple of zones
-- We'll defend our own border
red_air:AddAcceptZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ) ))
-- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
red_air:AddConflictZone(ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" )))
-- We'll leave the reds alone on their turf
red_air:AddRejectZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) ))

-- Optional - Draw the borders on the map so we see what's going on
-- Set up borders on map
local BlueBorder = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ) )
BlueBorder:DrawZone(-1,{0,0,1},1,FillColor,FillAlpha,1,true)
local ConflictZone = ZONE_POLYGON:New("red_defense_zone", GROUP:FindByName( "red_defense_zone" ))
ConflictZone:DrawZone(-1,{1,1,0},1,FillColor,FillAlpha,2,true)
local BlueNoGoZone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) )
BlueNoGoZone:DrawZone(-1,{1,0,0},1,FillColor,FillAlpha,4,true)

-- -- Set this up at Sukhumi
-- red_air:AddAirwing(AIRBASE.Caucasus.Sukhumi_Babushara,"Blue CAP Sukhumi")
-- -- CAP Point "Blue Zone 2"
-- red_air:AddPatrolPointCAP(AIRBASE.Caucasus.Sukhumi_Babushara,ZONE:FindByName("Blue Zone 2"):GetCoordinate(),30000,400,90,20)

-- -- This one has two squadrons to choose from
-- red_air:AddSquadron("Blue Sq3 F16","CAP Sukhumi II",AIRBASE.Caucasus.Sukhumi_Babushara,20,AI.Skill.GOOD,402,"JASDF 6th TFS 43-8526 Skull Riders")
-- red_air:AddSquadron("Blue Sq2 F15","CAP Sukhumi I",AIRBASE.Caucasus.Sukhumi_Babushara,20,AI.Skill.GOOD,202,"390th Fighter SQN")

-- -- **Note** If you need different tanker types, i.e. Boom and Drogue, set them up at different AirWings!
-- -- Add a tanker point
-- red_air:AddPatrolPointTanker(AIRBASE.Caucasus.Kutaisi,ZONE:FindByName("Blue Zone Tanker"):GetCoordinate(),20000,280,270,50)
-- -- Add a tanker squad - Radio 251 AM, TACAN 51Y
-- red_air:AddTankerSquadron("Blue Tanker","Tanker Ops Kutaisi",AIRBASE.Caucasus.Kutaisi,20,AI.Skill.EXCELLENT,602,nil,251,radio.modulation.AM,51)