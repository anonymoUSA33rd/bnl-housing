ClientFunctions = {}

function RegisterClientFunction(name, func)
    local eventName = ("%s:%s"):format(cache.resource, name)

    if IsDuplicityVersion() then
        -- server
        ClientFunctions[name] = function(source, ...)
            TriggerClientEvent(eventName, source, ...)
        end
    else
        -- client
        RegisterNetEvent(eventName, function(...)
            func(...)
        end)
        ClientFunctions = nil
    end
end

RegisterClientFunction("FadeIn", DoScreenFadeIn)
RegisterClientFunction("FadeOut", DoScreenFadeOut)
