local component = require("component")
local robot_api = require("robot")
local sides = require("sides")
local c = component.crafting
local ic = component.inventory_controller

robot_api.select(16)

function getCobble()
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(1, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(2, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(3, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(5, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(6, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(7, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(9, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(10, 64)
    ic.suckFromSlot(sides.top, 1, 64)
    robot_api.transferTo(11, 64)
    c.craft()
end

function swing()
    i = 0
    repeat
        robot_api.place()
        robot_api.swing()
        i = i + 1
    until (i == 64)
    robot_api.transferTo(1)
end

function main()
    getCobble()
    swing()
    robot_api.select(1) -- make sand
    robot_api.transferTo(16)
    robot_api.select(16)
    swing()
    robot_api.select(1) -- make dust
    robot_api.transferTo(16)
    robot_api.select(16)
    swing()
    craftAndTransfer()
end

function craftAndTransfer()
    i = 0
    repeat
        c.craft(63)
        robot_api.dropDown()
        i = i + 1
    until (i == 10)
end

while true do
    main()
end
