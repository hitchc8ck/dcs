-- Palmyra Airbase
local red_air_palmyra = EASYGCICAP:New("Red Airwing Palmyra",AIRBASE.Syria.Palmyra,"red","red_ew")
red_air_palmyra:SetDefaultCAPGrouping(4)
red_air_palmyra:SetMaxAliveMissions(6)
red_air_palmyra:SetDefaultMissionRange(60)
red_air_palmyra:SetDefaultRepeatOnFailure(2)

red_air_palmyra:AddAirwing(AIRBASE.Syria.Palmyra,"Palmyra_Airwing")

red_air_palmyra:AddSquadron("red_air_mig29_1","697 Squadron Palmyra",AIRBASE.Syria.Palmyra,6,AI.Skill.RANDOM,100)
red_air_palmyra:AddSquadron("red_air_mig29_2","697 Squadron Palmyra",AIRBASE.Syria.Palmyra,14,AI.Skill.RANDOM,140)
red_air_palmyra:AddSquadron("red_air_mig21_1","12 Squadron Palmyra",AIRBASE.Syria.Palmyra,5,AI.Skill.RANDOM,140)

red_air_palmyra:AddPatrolPointCAP(AIRBASE.Syria.Palmyra,ZONE:FindByName("red_cap_center"):GetCoordinate(),28000,370,1,20)

red_air_palmyra:AddAcceptZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" )))
red_air_palmyra:AddConflictZone(ZONE_POLYGON:New("defense_zone", GROUP:FindByName( "defense_zone" )))
red_air_palmyra:AddRejectZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" )))

-- Sayqal Airbase
red_air_sayqal = EASYGCICAP:New("Red Airwing Sayqal",AIRBASE.Syria.Sayqal,"red","red_ew")
red_air_sayqal:AddAirwing(AIRBASE.Syria.Sayqal,"Sayqal_Airwing")
red_air_sayqal:SetDefaultCAPGrouping(4)
red_air_sayqal:SetMaxAliveMissions(6)
red_air_sayqal:SetDefaultMissionRange(60)
red_air_sayqal:SetDefaultRepeatOnFailure(2)

red_air_sayqal:AddSquadron("red_air_mig29_1","697 Squadron Sayqal",AIRBASE.Syria.Sayqal,6,AI.Skill.RANDOM,100)
red_air_sayqal:AddSquadron("red_air_mig29_2","697 Squadron Sayqal",AIRBASE.Syria.Sayqal,14,AI.Skill.RANDOM,140)
red_air_sayqal:AddSquadron("red_air_mig21_1","12 Squadron Sayqal",AIRBASE.Syria.Sayqal,5,AI.Skill.RANDOM,140)

red_air_sayqal:AddPatrolPointCAP(AIRBASE.Syria.Sayqal,ZONE:FindByName("red_cap_south"):GetCoordinate(),28000,370,270,20)

red_air_sayqal:AddAcceptZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" )))
red_air_sayqal:AddConflictZone(ZONE_POLYGON:New("defense_zone", GROUP:FindByName( "defense_zone" )))
red_air_sayqal:AddRejectZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" )))

-- Jirah Airbase
-- red_air_jirah = EASYGCICAP:New("Red Airwing Jirah",AIRBASE.Syria.Jirah,"red","red_ew")
-- red_air_jirah:AddAirwing(AIRBASE.Syria.Jirah,"Jirah_Airwing")
-- red_air_jirah:SetDefaultCAPGrouping(4)
-- red_air_jirah:SetMaxAliveMissions(7)
-- red_air_jirah:SetDefaultMissionRange(100)
-- red_air_jirah:SetDefaultRepeatOnFailure(2)

-- red_air_jirah:AddSquadron("red_air_mig29_1","697 Squadron Jirah",AIRBASE.Syria.Jirah,6,AI.Skill.RANDOM,100)
-- red_air_jirah:AddSquadron("red_air_mig29_2","697 Squadron Jirah",AIRBASE.Syria.Jirah,14,AI.Skill.RANDOM,140)
-- red_air_jirah:AddSquadron("red_air_mig21_1","12 Squadron Jirah",AIRBASE.Syria.Jirah,5,AI.Skill.RANDOM,140)

-- red_air_jirah:AddPatrolPointCAP(AIRBASE.Syria.Jirah,ZONE:FindByName("red_cap_north"):GetCoordinate(),28000,370,270,20)

-- red_air_jirah:AddAcceptZone(ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" )))
-- red_air_jirah:AddConflictZone(ZONE_POLYGON:New("defense_zone", GROUP:FindByName( "defense_zone" )))
-- red_air_jirah:AddRejectZone(ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" )))


-- -- Optional - Draw the borders on the map so we see what's going on
-- -- Set up borders on map
-- local BlueBorder = ZONE_POLYGON:New( "red_border", GROUP:FindByName( "red_border" ))
-- BlueBorder:DrawZone(-1,{0,0,1},1,FillColor,FillAlpha,1,true)
-- local ConflictZone = ZONE_POLYGON:New("defense_zone", GROUP:FindByName( "defense_zone" ))
-- ConflictZone:DrawZone(-1,{1,1,0},1,FillColor,FillAlpha,2,true)
-- local BlueNoGoZone = ZONE_POLYGON:New( "blue_border", GROUP:FindByName( "blue_border" ) )
-- BlueNoGoZone:DrawZone(-1,{1,0,0},1,FillColor,FillAlpha,4,true)

-- red_air_palmyra.debug = true -- log information
-- red_air_palmyra.Monitor = true -- show some statistics on screen

-- red_air_jirah.debug = true -- log information
-- red_air_jirah.Monitor = true -- show some statistics on screen

-- red_air_sayqal.debug = true -- log information
-- red_air_sayqal.Monitor = true -- show some statistics on screen