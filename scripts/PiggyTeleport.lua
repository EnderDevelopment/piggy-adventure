-- Piggy Teleport Script

local Piggy = script.Parent

local function teleportToItem(item)
    local itemPosition = item.Position
    Piggy:PivotTo(CFrame.new(itemPosition))
end

local function findNearestItem()
    local items = workspace:GetChildren()
    local nearestItem = nil
    local shortestDistance = math.huge

    for _, item in ipairs(items) do
        if item:IsA("BasePart") and item.Name ~= "Piggy" then
            local distance = (Piggy.Position - item.Position).Magnitude
            if distance < shortestDistance then
                nearestItem = item
                shortestDistance = distance
            end
        end
    end

    return nearestItem
end

local function onTeleportRequest()
    local nearestItem = findNearestItem()
    if nearestItem then
        teleportToItem(nearestItem)
    else
        print("No items found to teleport to.")
    end
end

Piggy.TeleportEvent.Event:Connect(onTeleportRequest)
