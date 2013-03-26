define ['crafty','settings'], (crafty) ->
    crafty.c 'Player',
             init: () ->
                 @requires('2D, Canvas, Image,Tile,Fourway,Collision')
                     .fourway(10)
                     .collision([25,49],[25,91],[76,91],[76,49])
                     .stopOnSolids()
                 @image('assets/Character Boy.png')
                 @bind 'Moved', ()->
                     crafty.viewport.x = 400-@x
                     crafty.viewport.y = 300-@y
                     @z = @y + 83
             stopOnSolids: () ->
                 @onHit 'Solid', @stopMoving
                 @
             stopMoving: () ->
                 console.log 'stopped'
                 @_speed = 0
                 if @_movement
                     @x -= @_movement.x
                     @y -= @_movement.y