-- Piggy Teleport Script for Roblox

local Piggy = script.Parent

-- Function to find the nearest item
local function findNearestItem()
    local nearestItem = nil
    local shortestDistance = math.huge

    -- Iterate through all items in the workspace
    for _, item in ipairs(workspace:GetChildren()) do
        if item:IsA("BasePart") and item.Name ~= "Piggy" then
            local distance = (Piggy.Position - item.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestItem = item
            end
        end
    end

    return nearestItem
end

-- Function to teleport Piggy to the nearest item
local function teleportToNearestItem()
    local nearestItem = findNearestItem()
    if nearestItem then
        Piggy.Position = nearestItem.Position + Vector3.new(0, 5, 0) -- Teleport above the item
    end
end

-- Connect a function to a button press or other event to trigger teleportation
script.Parent.ClickDetector.MouseClick:Connect(teleportToNearestItem)

-- Alternatively, you can use a key press event
-- UserInputService.InputBegan:Connect(function(input, gameProcessed)
--     if input.KeyCode == Enum.KeyCode.E then
--         teleportToNearestItem()
--     end
-- end)