-- Create a RAT object 
local rus_transport_line_1=RAT:New("red_transport-1", "red_transport-2") -- create a new rat object
rus_transport_line_1:SetDeparture({"Sayqal"}) -- set departure
rus_transport_line_1:SetDestination({"BT8432"}) -- set destination
rus_transport_line_1:SetTakeoff("cold") -- aircraft spawn type
rus_transport_line_1:SetFLmin(1) -- set flight Min 
rus_transport_line_1:SetFLcruise(5) -- sets min cruise alt
rus_transport_line_1:ATC_Messages(false) -- no atc messages

local rus_rat_manager=RATMANAGER:New(10) -- create a new rat manager object
rus_rat_manager:Add(rus_transport_line_1, 3) -- add the rat object to the rat manager
rus_rat_manager:Start(60) -- start(delay) the rat manager