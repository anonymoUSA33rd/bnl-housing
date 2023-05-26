Prop = {}
Prop.__index = Prop

function Prop.new(data, property)
    local instance = setmetatable(Prop, {})

    instance.id = data.id
    instance.model = data.model
    instance.location = json.decode(data.location)
    instance.rotation = json.decode(data.rotation)
    instance.property = property

    CreateThread(function()
        Prop:spawn()
    end)

    return instance
end

function Prop:spawn()
    local entity = CreateObject(
        self.model,
        self.property.location.x + self.location.x,
        self.property.location.y + self.location.y,
        self.property.location.z + self.location.z,
        true,
        true,
        false
    )

    -- wait for the entity to be created
    while not DoesEntityExist(entity) do Wait(10) end

    FreezeEntityPosition(entity, true)
    -- SetEntityRoutingBucket(instance.entity, property.bucketId)

    SetEntityRotation(
        entity,
        self.rotation.x,
        self.rotation.y,
        self.rotation.z,
        2,
        true
    )

    self.entity = entity
end

function Prop:destroy()
    DeleteEntity(self.entity)
end

function Prop:interact(source)
end
