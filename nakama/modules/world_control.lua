local world_control = {}


local OpCodes = {
    update_position = 1
}

local commands = {}
commands[OpCodes.update_position] = function(data, state)
    local id = data.id
    local positionX = data.positionX
    local positionY = data.positionY
    if state.positions[id] ~= nil then
        state.positions[id] = {positionX, positionY}
    end
end


function world_control.match_init(context, params)
    
    local state = {
        presences = {}
    }
    local tick_rate = 10
    local label = "Game_world"
    return state, tick_rate, label
end 



function world_control.match_join_attempt(context, dispatcher, tick, state, presence, metadata)
    
    if state.presences[presence.user_id] ~= nil then
        return state, true, "User already joined"
    end
    
    return state, true
end

function world_control.match_join(context, dispatcher, tick, state, presences)

    for _, presence in ipairs(presences) do
        state.presences[presence.user_id] = presence

        return state
    end
end

function world_control.match_leave(context, dispatcher, tick, state, presences)

    for presence in ipairs(presences) do
        state.presences[presence.user_id] = nil

        return state
    end
end 

function world_control.match_loop(context, dispatcher, tick, state, messages)
    return state
end

function world_control.match_signal(context, dispatcher, tick, state, data) 
    return state, data
end

function world_control.match_terminate(context, dispatcher, tick, state, grace_seconds)
    return state
end

return world_control