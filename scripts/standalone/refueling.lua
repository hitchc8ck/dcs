unitName = ""
setNewSpeed = 300
setNewAltitude = 1000
displayMessageUI = true
Keep = true

-- Simple message to display that script is running
trigger.action.outText("Script is running!", 5)

-- Function to display a message to all players
function displayMessage(message, duration, displayMessageUI)
    if displayMessageUI == true then
        trigger.action.outText(message, duration)
        return
    end
end

-- Function to get detailed information about the unit specified by the user
function getUnitInfo()
    local unit = Unit.getByName(unitName)
    
    if unit and unit:isExist() then
        -- Get unit's position and other details
        local position = unit:getPosition().p
        local altitude = position.y -- Altitude in meters
        local altitude_feet = altitude*3,28084
        local latitude, longitude = coord.LOtoLL(position) -- Convert to lat/lon

        -- Get unit type and category
        local unitType = unit:getTypeName() or "N/A"
        local unitCategory = unit:getDesc().category or "N/A"
        
        -- Get coalition info
        local coalition = unit:getCoalition() == 1 and "Red" or unit:getCoalition() == 2 and "Blue" or "Neutral"

        -- Get group information
        local groupName = "N/A"
        local group = unit:getGroup()
        if group then
            groupName = group:getName()
        end

        -- Get velocity and calculate heading
        local velocity = unit:getVelocity()
        local heading = "N/A"
        if velocity.x ~= 0 or velocity.z ~= 0 then
            heading = math.deg(math.atan2(velocity.z, velocity.x))
            if heading < 0 then heading = heading + 360 end -- Normalize to 0-360 degrees
        end

        -- Format the message
        local message = string.format(
            "%s Information:\n" ..
            "Type: %s\n" ..
            "Category: %s\n" ..
            "Coalition: %s\n" ..
            "Group: %s\n" ..
            "Altitude: %.2f meters\n" ..
            "Altitude: %.2f feet\n" ..
            "Latitude: %.6f, Longitude: %.6f\n" ..
            "Heading: %.2f degrees",
            unitName, unitType, unitCategory, coalition, groupName, altitude, altitude_feet, latitude, longitude, heading
        )
        
        -- Display the message
        displayMessage(message, 5, displayMessageUI)
    else
        -- Unit not found or doesn't exist
        displayMessage("Unit '" .. unitName .. "' not found or no longer exists!", 5, displayMessageUI)
    end
end

-- -- Function to change units speed
-- function setUnitSpeedAndAltitute()
--     local unit = Unit.getByName(unitName)
--     if unit and unit:isExist() then
--         local group = unit:getGroup()
--         if group then
--             local controller = unit:getController()
--             if controller then
--                 for key, value in pairs(controller) do
--                     env.info("Key: " .. tostring(key) .. ", Value: " .. tostring(value))
--                 end
--                 displayMessage("'" .. controller.id_ .. "'", 5, displayMessageUI)
--                 -- Set unit's speed in meters per second
--                 controller.id_:setSpeed(setNewSpeed, false)
--                 -- Set unit's altitude
--                 -- controller:setAltitude(setNewAltitude, "BARO")
--                 -- Display success message
--                 displayMessage(
--                     string.format("Unit '%s' speed set to %d m/s and altitude set to %d meters.", unitName, setNewSpeed, setNewAltitude), 5, displayMessageUI)
--             else
--                 displayMessage("Controller not found for unit '" .. unitName .. "'.", 5, displayMessageUI)
--             end
--         else
--             displayMessage("Group not found for unit '" .. unitName .. "'.", 5, displayMessageUI)
--         end
--     else
--         displayMessage("Unit '" .. unitName .. "' not found or no longer exists.", 5, displayMessageUI)
--     end
-- end

-- -- Function to change a unit's speed and altitude
-- function setUnitSpeedAndAltitude(unitName, setNewSpeed, setNewAltitude)
--     local unit = Unit.getByName(unitName)
--     if unit and unit:isExist() then
--         local group = unit:getGroup()
--         if group then
--             local controller = unit:getController()
--             if controller then
--                 -- Set the unit's speed in meters per second
--                 controller:setSpeed(setNewSpeed, true)

--                 -- Set the unit's altitude
--                 -- controller:setAltitude(setNewAltitude, "BARO")

--                 -- Display success message
--                 displayMessage(
--                     string.format(
--                         "Unit '%s' speed set to %d m/s.",
--                         unitName, setNewSpeed
--                     ),
--                     5, displayMessageUI
--                 )
--             else
--                 displayMessage("Controller not found for unit '" .. unitName .. "'.", 5, displayMessageUI)
--             end
--         else
--             displayMessage("Group not found for unit '" .. unitName .. "'.", 5, displayMessageUI)
--         end
--     else
--         displayMessage("Unit '" .. unitName .. "' not found or no longer exists.", 5, displayMessageUI)
--     end
-- end

function setUnitSpeedAndAltitude(unitName, setNewSpeed)
    -- Validate the unit name
    if not unitName or type(unitName) ~= "string" then
        displayMessage("Invalid unit name provided.", 5, displayMessageUI)
        return
    end

    local unit = Unit.getByName(unitName)
    if unit and unit:isExist() then
        local controller = unit:getController()
        if controller then
            -- Debugging the controller object
            env.info("Controller Object: " .. tostring(controller))

            -- Set the unit's speed
            local success, err = pcall(function()
                controller:setSpeed(setNewSpeed, Keep) -- Set 'Keep' to true to maintain speed across waypoints
            end)

            if not success then
                env.info("Error setting speed: " .. tostring(err))
                displayMessage("Error setting speed for unit '" .. unitName .. "'.", 5, displayMessageUI)
            else
                displayMessage(
                    string.format("Unit '%s' speed set to %d m/s.", unitName, setNewSpeed),
                    5, displayMessageUI
                )
            end
        else
            displayMessage("Controller not found for unit '" .. unitName .. "'.", 5, displayMessageUI)
        end
    else
        displayMessage("Unit '" .. unitName .. "' not found or no longer exists.", 5, displayMessageUI)
    end
end

-- Call the function's
-- getUnitInfo()
setUnitSpeedAndAltitude(unitName, setNewSpeed, setNewAltitude)