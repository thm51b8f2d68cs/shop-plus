
function main()



    --Wrap monitor
    side = "top"
    monitor = peripheral.wrap(side)

    --Redirect terminal to monitor
    local terminal = term.redirect(monitor)

    --Set colors for page background
    monitor.setPaletteColor(colors.black, 0x000000)
    --Draw page background
    --Canvas size is 50x26
    drawBackground(1, 1, 50, 26, colors.black)

    monitor.setPaletteColor(colors.black, 0x050505)
    --Draw title
    drawBackground(15, 3, 18, 24, colors.black)
    drawTitle(15, 3)

    --Set colors for categories background
    --Draw categories background
    monitor.setPaletteColor(colors.white, 0xFFFFFF)
    drawBackground(2, 2, 14, 22, colors.white)

    --Draw categories
    drawCategories(2, 2)

    --Set colors for report bug background and text
    --Set text size for report bug
    --Draw report bug

    --Set colors for background of popular tab
    --Draw popular tab

    --Color of each item frame will come from the frame info
    --Draw popular items in frames of popular tab

    --Set colors for buttons
    --Draw buttons

    --Set colors for footer background
    --Draw footer background

    --Set colors for text
    --Set text size
    --Draw made by
    --Draw version

    --Set color for frames
    --Draw frames

    term.redirect(terminal)

end

function setColors()
    monitor.setPaletteColor(colors)
end

function drawBackground(startX, startY, endX, endY, color)
    paintutils.drawFilledBox(startX, startY, endX, endY, color)
end

function drawTitle(x, y)
    --Set colors for title
    --Set text size for title
    monitor.setCursorPos(x,y)
    monitor.setTextScale(2)
    monitor.blit("Switch Shop", "0x0AD9FF", "0x050505")
end

function drawCategories(x, y)
    --Set colors for categories text and fill
    --Set text size for categories

    monitor.setTextScale(1)

    local categories = io.open("categories.txt", "r")
    local index = 0

    for line in categories:lines() do
        line = io.read("*l")
        line = line:sub(1, -2)

        monitor.setCursorPos(x,y)

        if (index % 2 == 0) then
           monitor.blit(line, "0x0AD9FF", "0x050505")
        else
            monitor.blit(line, "0xFFFFFF", "0x292929")
        end

        index = index + 1
        y = y + 3
    end

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