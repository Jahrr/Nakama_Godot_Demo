local nakama = require("nakama")


local function get_world_id(_,_)
    
    local matches = nakama.match_list()
    local currentMatch = matches[1]

    if currentMatch == nil then
        return nakama.match_create("world_control", {})
    else
        return currentMatch.match_id
    end
    
end

nakama.register_rpc(get_world_id, "get_world_id")