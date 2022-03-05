local component = require("component")
local robot_api = require("robot")
local sides = require("sides")
local c = component.crafting
local ic = component.inventory_controller



function craft(slot)
    ic.suckFromSlot(sides.bottom, slot, 64)
    robot_api.transferTo(1,16)
    robot_api.transferTo(2,16)
    robot_api.transferTo(5,16)
    robot_api.transferTo(6,16)
    c.craft()
    robot_api.drop()
end

function checkSlot()
    for i=1,12,1 do
        quantity=ic.getStackInSlot(sides.bottom, i)
        if (quantity.size>64) then
            craft(i)
        else
            print('no more in ' .. i)
        end
    end
end

while true do
    checkSlot()
    os.sleep(1)
end


