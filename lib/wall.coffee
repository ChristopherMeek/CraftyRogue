define ['crafty'], (crafty) ->
    crafty.c 'Wall',
        init: () ->
            @requires('2D, Canvas, Image, Tile, Solid')
            @image('assets/Stone Block Tall.png')