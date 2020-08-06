function main()

    tileLocations = {}

    bigfont = require("bigfont")
    --Wrap monitor
    side = "top"
    --Wrap inventory
    inventory = peripheral.wrap("bottom")
    --stock = inventory.list()
    shopName = "Switch Shop"
    shopOwner = "thm51b8f2d68cs"
    version = "1.0 alpha"
    monitor = peripheral.wrap(side)

    --Define color palette
    monitor.setPaletteColor(colors.black, 0x000000)
    monitor.setPaletteColor(colors.gray, 0x151515)
    monitor.setPaletteColor(colors.white, 0xFFFFFF)
    monitor.setPaletteColor(colors.lightGray, 0x292929)
    monitor.setPaletteColor(colors.lightBlue, 0x0AD9FF)

    --Redirect terminal to monitor
    local terminal = term.redirect(monitor)

    monitor.setCursorBlink(false)
    monitor.setTextScale(0.5)

    --Draw page background
    drawBackground(1, 1, 150, 62, colors.black)
    --Draw title
    drawTitle(40, 3)
    --Draw categories
    drawCategories(2, 2)
    --Draw report bug
    drawBugReport(2, 48)
    --Draw popular tab
    --Color of each item frame will come from the frame info
    --Draw popular items in frames of popular tab
    --Draw buttons
    local spacing = 5
    local buttonAnchor = 44
    drawUpButton(150, buttonAnchor - spacing, 10, 10)
    drawDownButton(150, buttonAnchor, 10 ,10)
    --Draw footer background
    drawFooter(33, 48)
    --Draw made by
    drawMadeBy(34, 48)
    --Draw version
    drawVersion(160 - (#version * 5), 48)
    --Draw frames
    --term.redirect(terminal)
end

function setColors()
    monitor.setPaletteColor(colors)
end

function drawBackground(startX, startY, endX, endY, color)
    --monitor.setBackgroundColor(color)
    paintutils.drawFilledBox(startX, startY, endX, endY, color)
end

function drawTitle(x, y)
    drawBackground(33, 2, 142, 11, colors.gray)
    --Set text size for title
    monitor.setCursorPos(x, y)
    --monitor.setTextScale(4.2)
    monitor.setTextColor(colors.lightBlue)
    monitor.setBackgroundColor(colors.gray)
    --monitor.write("Switch Shop")
    bigfont.writeOn(monitor, 2, shopName, monitor.getCursorPos())
end

function drawCategories(x, y)

    drawBackground(2, 2, 31, 46, colors.white)
    --Set colors for categories text and fill
    --Set text size for categories

    local categories = io.open("categories.txt", "r")
    local index = 0

    for line in categories:lines() do
        --line = io.read("*l")
        --line = line:sub(1, -2)

        monitor.setCursorPos(x, y)

        if (index % 2 == 0) then
            monitor.setTextColor(colors.lightBlue)
            monitor.setBackgroundColor(colors.gray)
            drawBackground(x, y, x + 29, y + 2, colors.gray)
            bigfont.writeOn(monitor, 1, line, x, y)
        else
            monitor.setTextColor(colors.white)
            monitor.setBackgroundColor(colors.lightGray)
            drawBackground(x, y, x + 29, y + 2, colors.lightGray)
            bigfont.writeOn(monitor, 1, line, x, y)
        end

        index = index + 1
        y = y + 3
    end
    categories:close()
end

function drawCategory()
end

function drawBugReport(x, y)
    drawBackground(x, y, 31, 51, colors.lightGray)
    monitor.setTextColor(colors.white)
    monitor.setBackgroundColor(colors.lightGray)
    bigfont.writeOn(monitor, 1, "Report bug", x, y + 1)
end

function drawPopularTab(startX, startY, endX, endY)

end

function drawUpButton(x, y, width, height)
    drawBackground(x, y, x + width, y + width, colors.gray)
    drawUpButtonTriangle(x, y, width, height)
end

function drawUpButtonTriangle(startX, startY, endX, endY)
    buttonWidth = endX - startX
    buttonHeight = endY - startY
    middleXOfButton = (buttonWidth / 2) + 1
    --Draw middle of triangle
    for y = startY + 1, endY - 1, 1 do 
        paintutils.drawPixel(middleXOfButton, y, colors.lightBlue)
    end
    
    --Draw left angle
    for x = middleXOfButton, startX + 1, -1 do
        paintutils.drawPixel(x, endY - 1, colors.lightBlue)
    end
    --Draw right angle
    for x = middleXOfButton, endX - 1, 1 do
        paintutils.drawPixel(x, endY - 1, colors.lightBlue)
    end
end

function drawDownButton(x, y, width, height)
    drawBackground(x, y, x + width, y + width, colors.gray)
    drawDownButtonTriangle(x, y, width, height)
end

function drawDownButtonTriangle(startX, startY, endX, endY)
    buttonWidth = endX - startX
    buttonHeight = endY - startY
    middleXOfButton = (buttonWidth / 2) + 1
    --Draw middle of triangle
    for y = endY - 1, startY + 1, -1 do 
        paintutils.drawPixel(middleXOfButton, y, colors.lightBlue)
    end
    
    --Draw left angle
    for x = middleXOfButton, startX + 1, -1 do
        paintutils.drawPixel(x, startY + 1, colors.lightBlue)
    end
    --Draw right angle
    for x = middleXOfButton, endX - 1, 1 do
        paintutils.drawPixel(x, startY + 1, colors.lightBlue)
    end
end

function drawFooter(x, y)
    drawBackground(x, y, 142, 51, colors.gray)
end

function drawMadeBy(x, y)
    monitor.setTextColor(colors.lightBlue)
    monitor.setBackgroundColor(colors.gray)
    bigfont.writeOn(monitor, 1, "Made by: " .. shopOwner, x, y + 1)
end

function drawVersion(x, y)
    monitor.setTextColor(colors.lightBlue)
    monitor.setBackgroundColor(colors.gray)
    bigfont.writeOn(monitor, 1, version, x, y + 1)
end

function parseItems()
    local items = io.open("items.txt", "w")
    for item in inventory.list() do
        items:write(textutils.serialize(item))
    end
    items:close()
end

function formatItems()
    local items = io.open("items.txt", "rw")
    local data = items.read("*a")
    local catalog = textutils.unserialize(data)
    for item in catalog do
        item.purchases = "0"
    end
    
    items:write(textutils.serialize(catalog))
    items:close()

end

function logPurchase(itemBought)
    local items = io.open("items.txt", "rw")
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

main()