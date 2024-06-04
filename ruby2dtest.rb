require 'ruby2d'
set title: "Binding of Nails"

Text.new('WASD to Move')
Text.new('Arrows to Shoot', x: 300)

# Build Character Square
@square  = Rectangle.new(x: 30, y: 30, width: 50, height: 80, color: 'red');
@wall = Square.new(x: 200, y: 200, size: 300, color: 'blue')

@x_speed = 0.0
@y_speed = 0.0

on :key_down do |event|
    if event.key == 'a'
        @x_speed = -5
        ##@y_speed = 0
    elsif event.key == 'd'
        @x_speed = 5
        ##@y_speed = 0
    elsif event.key == 'w'
        ##@x_speed = 0
        @y_speed = -5
    elsif event.key == 's'
        ##@x_speed = 0
        @y_speed = 5
    end
end


on :key_up do |event|
    if event.key == 'a'
        @x_speed = 0
        ##@y_speed = 0
    elsif event.key == 'd'
        @x_speed = 0
        ##@y_speed = 0
    elsif event.key == 'w'
        ##@x_speed = 0
        @y_speed = 0
    elsif event.key == 's'
        ##@x_speed = 0
        @y_speed = 0
    end
end

def collusion(player, wall)
    wall_pointx = wall.x - player.width
    wall_pointy  = wall.y - player.height
    if  wall_pointx < player.x 
       @x_speed = 0
    end

    if wall_pointy < player.y
        @y_speed = 0 
    end
end

update do
    @square.x += @x_speed
    @square.y += @y_speed
    collusion(@square, @wall)
end

show 