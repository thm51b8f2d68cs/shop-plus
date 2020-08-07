
function main()
    --Wrap inventory
    inventory = peripheral.wrap("bottom")
    inventory = require("inventoryManager.lua")
    shell.run("display.lua")
    
end


main()