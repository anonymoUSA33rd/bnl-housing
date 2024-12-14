---@param model string
---@return table?
function GetPropFromModel(model)
    for _, category in pairs(Data.Props) do
        local d = category[model]
        if d then
            return d
        end
    end
end

---@param props table
---@return table
function FormatPlacedProps(props)
    return table.map(props, function(prop)
        local data = GetPropFromModel(prop.model)

        -- Ensure rotation is valid and has a fallback if not provided
        local rotation = prop.rotation
        if type(rotation) ~= "table" then
            rotation = {x = 0, y = 0, z = 0} -- Default rotation
        end

        return {
            id = prop.id,
            model = prop.model,
            name = data and data.name or prop.model,
            location = json.encode(prop.location or {}),
            rotation = json.encode(rotation),
            metadata = json.encode(prop.metadata or {}),
        }
    end)
end
