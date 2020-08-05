function main()
    bigfont = require("bigfont")
    --Wrap monitor
    side = "top"
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
    --Canvas size is 50x26
    drawBackground(1, 1, 102, 38, colors.black)

    --Draw title
    drawBackground(15, 5, 93, 25, colors.gray)
    drawTitle(15, 5)

    --Draw categories background

    drawBackground(2, 2, 10, 14, colors.white)

    --Draw categories
    --drawCategories(2, 2)

    --Set text size for report bug
    --Draw report bug

    --Draw popular tab

    --Color of each item frame will come from the frame info
    --Draw popular items in frames of popular tab

    --Draw buttons

    --Draw footer background

    --Set text size
    --Draw made by
    --Draw version

    --Draw frames

    term.redirect(terminal)
end

function setColors()
    monitor.setPaletteColor(colors)
end

function drawBackground(startX, startY, endX, endY, color)
    --monitor.setBackgroundColor(color)
    paintutils.drawFilledBox(startX, startY, endX, endY, color)
end

function drawTitle(x, y)
    --Set text size for title
    monitor.setCursorPos(x, y)
    --monitor.setTextScale(4.2)
    monitor.setTextColor(colors.lightBlue)
    monitor.setBackgroundColor(colors.gray)
    --monitor.write("Switch Shop")
    bigfont.writeOn(monitor, 1.5, "Switch Shop", monitor.getCursorPos())
end

function drawCategories(x, y)
    --Set colors for categories text and fill
    --Set text size for categories

    monitor.setTextScale(1)

    local categories = io.open("categories.txt", "r")
    local index = 0

    for line in categories:lines() do
        line = io.read("*l")
        --line = line:sub(1, -2)

        monitor.setCursorPos(x, y)

        if (index % 2 == 0) then
            monitor.setTextColor(colors.lightBlue)
            monitor.setBackgroundColor(colors.gray)
            monitor.write(line)
        else
            monitor.setTextColor(colors.white)
            monitor.setBackgroundColor(colors.lightGray)
            monitor.write(line)
        end

        index = index + 1
        y = y + 3
    end
    categories:close()
end

function drawPopularTab(startX, startY, endX, endY, color)
end

function drawButtons(color, spacing)
end

function drawFooter()
end

function drawMadeBy(x, y)
end

function drawVersion(x, y)
end



main()