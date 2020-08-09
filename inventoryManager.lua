--function parseItems(inventory)
--    local items = io.open("items.txt", "w")
--    for item in inventory.list() do
--        items:write(textutils.serialize(item))
--    end
--    items:close()
--end


local function parseItems(inventory)
local items = io.open("items.txt", "w")
for item in inventory.list() do
items:write(textutils.serialize(item))
end
items:close()
end

return {
parseItems = parseItems
}