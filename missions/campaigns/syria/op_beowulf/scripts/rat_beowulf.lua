local rus_transport_line_group_1="red_transport-1", "red_transport-2" -- variables for groups
local rus_transport_line_airports_1={"Sayqal", "Khalkhalah", "Shayrat", "Palmyra", "Tabqa", "Minakh", "Jirah", "Bassel_Al_Assad"} -- list of airports
local rus_transport_line_group_2="red_transport-3", "red_transport-4", "red_transport-5" -- variables for groups
local rus_transport_line_airports_2={"Sayqal", "Khalkhalah", "Shayrat", "Palmyra", "Jirah", "Bassel_Al_Assad", "Aleppo", "Deir_ez_Zor"} -- list of airports

-- Create a RAT object 
local rus_transport_line_1=RAT:New(rus_transport_line_group_1) -- create a new rat object
rus_transport_line_1:SetDeparture(rus_transport_line_airports_1) -- set departure
rus_transport_line_1:SetDestination(rus_transport_line_airports_1) -- set destination
rus_transport_line_1:SetFLmin(3) -- set flight Min 
rus_transport_line_1:SetFLcruise(10) -- sets min cruise alt
rus_transport_line_1:ATC_Messages(false) -- no atc 
rus_transport_line_1:SetMaxDistance(200) -- set max distance

local rus_transport_line_2=RAT:New(us_transport_line_group_2) -- create a new rat object
rus_transport_line_2:SetDeparture(rus_transport_line_airports_2) -- set departure
rus_transport_line_2:SetDestination(rus_transport_line_airports_2) -- set destination
rus_transport_line_2:SetFLmin(10) -- set flight Min 
rus_transport_line_2:SetFLcruise(25) -- sets min cruise alt
rus_transport_line_2:ATC_Messages(false) -- no atc 
rus_transport_line_2:SetMaxDistance(400) -- set max distance

local rus_rat_manager_1=RATMANAGER:New(6) -- create a new rat manager object
rus_rat_manager_1:Add(rus_transport_line_1, 6) -- add the rat object to the rat manager
rus_rat_manager_1:Start(60) -- start(delay) the rat manager
rus_rat_manager_1:SetTspawn(600)

local rus_rat_manager_2=RATMANAGER:New(4) -- create a new rat manager object
rus_rat_manager_2:Add(rus_transport_line_2, 4) -- add the rat object to the rat manager
rus_rat_manager_2:Start(60) -- start(delay) the rat manager
rus_rat_manager_2:SetTspawn(600)