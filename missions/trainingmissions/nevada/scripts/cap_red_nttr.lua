-- Set up a basic system for the red side, we'll reside on Lincoln_County, and use GROUP objects with "red_ew" in the name as EW Radar Systems.
local red_air = EASYGCICAP:New("Red Aggressors",AIRBASE.Nevada.Lincoln_County,"red","red_ew")
red_air:SetDefaultCAPGrouping(2)
red_air:SetMaxAliveMissions(4)
red_air:SetDefaultMissionRange(30)

-- Palmyra Airbase
red_air:AddAirwing(AIRBASE.Nevada.Lincoln_County,"Red Aggressor Squadron Lincoln County")
red_air:AddPatrolPointCAP(AIRBASE.Nevada.Lincoln_County,ZONE:FindByName("red_cap_airspace"):GetCoordinate(),25000,370,270,20)
red_air:AddSquadron("red_air_su27","Red Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,6,AI.Skill.RANDOM,100)
red_air:AddSquadron("red_air_mig29","Red Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,14,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_jf17","Red Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,14,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_jf11","Red Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,14,AI.Skill.RANDOM,140)

red_air:AddAirwing(AIRBASE.Nevada.Lincoln_County,"Blue Aggressor Squadron Lincoln County")
red_air:AddSquadron("red_air_f16","Blue Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,14,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_f15c","Blue Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,14,AI.Skill.RANDOM,140)
red_air:AddSquadron("red_air_f18","Blue Aggressor Squadron Lincoln County",AIRBASE.Nevada.Lincoln_County,14,AI.Skill.RANDOM,140)



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