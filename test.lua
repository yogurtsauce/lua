local component = require("component")
local robot_api = require("robot")
local sides = require("sides")
local c = component.crafting
local ic = component.inventory_controller

quantity=ic.getStackInSlot(sides.top, 1)

print(quantity.size())