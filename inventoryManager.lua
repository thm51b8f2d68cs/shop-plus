--function parseItems(inventory)
--    local items = io.open("items.txt", "w")
--    for item in pairs(inventory.list()) do
--        items:write(textutils.serialize(item))
--    end
--    items:close()
--end


local function parseItems(inventory)
    local items = io.open("items.txt", "w")
    local itemData = {}
    for slot, item in pairs(inventory.list()) do
        itemData.slot = item
    end
    items:write(itemData)
    items:close()
end

return {
    parseItems = parseItems
}