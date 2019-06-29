require_relative 'table.rb'
require_relative 'robot.rb'

puts "Toy Robot Simulator"
puts """
    Commands available:
    PLACE X,Y,DIRECTION
    MOVE
    LEFT
    RIGHT
    REPORT
    EXIT

    Instructions: Move the Robot around on the tabletop which has a 5 x 5 surface, You must first place the robot on the surface.
                  You can then move the robot around though it is unable to fall to it's destruction. All input must be UPPERCASE. 
     """
robot = Robot::Robot.new
table = Table::Table.new
placed = false

input = gets().strip

while input != "EXIT"
    if input.include?("PLACE")

        placement_occured = false

        place_input = input.gsub(/,/, ' ').split(" ")
        x = place_input[1].to_i
        y = place_input[2].to_i
        robot_direction = place_input[3]
        robot.directions.each do |direction|
            if direction == robot_direction
                if x.between?(table.min_x, table.max_x) && y.between?(table.min_y, table.max_y)
                    robot.place(x, y, direction)
                    input = gets().strip
                    placed = true
                    placement_occured = true
                else
                    puts "Cannot place robot outside of table parameters \nx and y values must be between 0 and 4"
                    placement_occured = nil
                    input = gets().strip
                end
            end
        end
        if placement_occured == false
            puts "invalid input, is everything UPPERCASE? \nDirections Available are NORTH, EAST, SOUTH and WEST"
            input = gets().strip
        end
    else
        if placed == true
            case input
            when "MOVE"
                robot.move(table)
                input = gets().strip
            when "LEFT" 
                robot.left(robot)
                input = gets().strip
            when "RIGHT" 
                robot.right(robot)
                input = gets().strip
            when "REPORT"
                robot.report()
                input = gets().strip
            when "EXIT"
                exit
            else
                puts "invalid input"
                input = gets().strip
            end
        else
            puts "You must place the robot on the tabletop before doing anything else" 
            input = gets().strip
        end
    end
end
