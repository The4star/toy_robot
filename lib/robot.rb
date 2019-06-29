module Robot

    class Robot

        attr_accessor(:x, :y, :direction, :directions)

        def initialize()
            @x_position = x
            @y_position = y
            @direction = direction
            @directions = ["NORTH", "EAST", "SOUTH", "WEST"]
        end

        def report()
            puts "#{@x_position}, #{@y_position}, #{@direction}"
        end

        def place(x, y, direction)
            @x_position = x 
            @y_position = y
            @direction = direction
        end

        def move(table)
            if @direction == "NORTH"
                if @y_position < table.max_y
                    @y_position += 1
                else
                    puts "Command ignored, robot unable to fall off table to destruction"
                end
            elsif @direction == "EAST"
                if @x_position < table.max_x
                    @x_position += 1
                else
                    puts "Command ignored, robot unable to fall off table to destruction"
                end
            elsif @direction == "SOUTH"
                if @y_position > table.min_y
                    @y_position -= 1
                else
                    puts "Command ignored, robot unable to fall off table to destruction"
                end
            elsif @direction == "WEST"
                if @x_position > table.min_x
                    @x_position -= 1
                else
                    puts "Command ignored, robot unable to fall off table to destruction"
                end
            end
        end

        def left(robot)
            new_direction_index = 0
            @directions.each_with_index do |value, index|
                if robot.direction == value 
                   new_direction_index = index - 1
                end
            end
            robot.direction = @directions[new_direction_index]
        end

        def right(robot)
            new_direction_index = 0
            @directions.each_with_index do |value, index|
                if robot.direction == value 
                    if index == 3
                        new_direction_index = 0
                    else
                        new_direction_index = index + 1
                    end
                end
            end
            robot.direction = @directions[new_direction_index]
        end

    end

end