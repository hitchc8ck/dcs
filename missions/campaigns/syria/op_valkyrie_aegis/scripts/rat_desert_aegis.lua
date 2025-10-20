local rus_transport_line_airports_1={"Sayqal", "Khalkhalah", "Shayrat", "Palmyra", "Tabqa", "Minakh", "Jirah", "Bassel Al-Assad"}
local rus_transport_line_airports_2={"Sayqal", "Palmyra", "Aleppo", "Deir ez-Zor"}

-- Create a RAT object 
local rus_transport_line_1=RAT:New("red_transport-1") -- create a new rat object
rus_transport_line_1:SetDeparture(rus_transport_line_airports_1) -- set departure
rus_transport_line_1:SetDestination(rus_transport_line_airports_1) -- set destination
rus_transport_line_1:SetFLmin(3) -- set flight Min 
rus_transport_line_1:SetFLcruise(10) -- sets min cruise alt
rus_transport_line_1:ATC_Messages(false) -- no atc 
rus_transport_line_1:SetMaxDistance(200) -- set max distance

-- Create a RAT object 
local rus_transport_line_2=RAT:New("red_transport-2") -- create a new rat object
rus_transport_line_2:SetDeparture(rus_transport_line_airports_1) -- set departure
rus_transport_line_2:SetDestination(rus_transport_line_airports_1) -- set destination
rus_transport_line_2:SetFLmin(3) -- set flight Min 
rus_transport_line_2:SetFLcruise(10) -- sets min cruise alt
rus_transport_line_2:ATC_Messages(false) -- no atc 
rus_transport_line_2:SetMaxDistance(200) -- set max distance

local rus_transport_line_3=RAT:New("red_transport-3") -- create a new rat object
rus_transport_line_3:SetDeparture(rus_transport_line_airports_2) -- set departure
rus_transport_line_3:SetDestination(rus_transport_line_airports_2) -- set destination
rus_transport_line_3:SetFLmin(10) -- set flight Min 
rus_transport_line_3:SetFLcruise(25) -- sets min cruise alt
rus_transport_line_3:ATC_Messages(false) -- no atc 
rus_transport_line_3:SetMaxDistance(400) -- set max distance

local rus_transport_line_4=RAT:New("red_transport-4") -- create a new rat object
rus_transport_line_4:SetDeparture(rus_transport_line_airports_2) -- set departure
rus_transport_line_4:SetDestination(rus_transport_line_airports_2) -- set destination
rus_transport_line_4:SetFLmin(10) -- set flight Min 
rus_transport_line_4:SetFLcruise(25) -- sets min cruise alt
rus_transport_line_4:ATC_Messages(false) -- no atc 
rus_transport_line_4:SetMaxDistance(400) -- set max distance

local rus_rat_manager=RATMANAGER:New(6) -- create a new rat manager object
rus_rat_manager:Add(rus_transport_line_1, 2) -- add the rat object to the rat manager
rus_rat_manager:Add(rus_transport_line_2, 2) -- add the rat object to the rat manager
rus_rat_manager:Add(rus_transport_line_3, 1) -- add the rat object to the rat manager
rus_rat_manager:Add(rus_transport_line_4, 1) -- add the rat object to the rat manager
rus_rat_manager:Start(60) -- start(delay) the rat manager
rus_rat_manager:SetTspawn(120) -- set the spawn time between the rats