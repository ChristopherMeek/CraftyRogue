define ['crafty','settings'], (crafty) ->
    crafty.c 'Player',
             init: () ->
                 @requires('2D, Canvas, Image,Tile,Fourway').fourway 10
                 @image('assets/Character Boy.png')