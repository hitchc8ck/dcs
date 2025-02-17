local rus_transport_line_groups="red_transport-1", "red_transport-2" -- variables for groups
local rus_transport_line_airports={"Sayqal", "Khalkhalah", "Shayrat", "Palmyra", "Tobqa", "Minakh", "Al-Dumayr", "Jirah", "Bassel_Al_Assad"} -- list of airports

-- Create a RAT object 
local rus_transport_line_1=RAT:New(rus_transport_line_groups) -- create a new rat object
rus_transport_line_1:SetDeparture(rus_transport_line_airports) -- set departure
rus_transport_line_1:SetDestination(rus_transport_line_airports) -- set destination
-- rus_transport_line_1:SetTakeoff("cold") -- aircraft spawn type
rus_transport_line_1:SetFLmin(2) -- set flight Min 
rus_transport_line_1:SetFLcruise(10) -- sets min cruise alt
rus_transport_line_1:ATC_Messages(false) -- no atc 
rus_transport_line_1:SetMaxDistance(205) -- set max distance

local rus_rat_manager=RATMANAGER:New(8) -- create a new rat manager object
rus_rat_manager:Add(rus_transport_line_1, 6) -- add the rat object to the rat manager
rus_rat_manager:Start(60) -- start(delay) the rat manager
rus_rat_manager:SetTspawn(600)