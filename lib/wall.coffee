define ['crafty'], (crafty) ->
    crafty.c 'Wall',
        init: () ->
            @requires('2D, Canvas, Image, Tile, Solid, Collision')
                .collision([0,0],[0,81],[101,81],[101,0])
            @image('assets/Stone Block Tall.png')