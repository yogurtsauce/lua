local robot_api = require("robot")

function mine()
    robot_api.suckUp(1)
    robot_api.place()
    robot_api.swing()
    robot_api.dropDown()
end

while true do
    mine()
end