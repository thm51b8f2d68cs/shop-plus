

function parseItems()
    local items = io.open("items.txt", "w")
    for item in inventory.list() do
        items:write(textutils.serialize(item))
    end
    items:close()
end

-- function formatItems()
--     local items = io.open("items.txt", "rw")
--     local data = items.read("*a")
--     local catalog = textutils.unserialize(data)
--     for item in catalog do
--         item.purchases = "0"
--     end
    
--     items:write(textutils.serialize(catalog))
--     items:close()

-- end

function logPurchase(itemBought)
    local items = io.open("items.txt", "r")
    local data = items.read("*a")
    local catalog = textutils.unserialize(data)
    for item in catalog do
        if (item.name == itemBought.name) then
            item.purchases = item.purchases + 1
        end
    end

    items:write(textutils.serialize(catalog))
    items:close()
end