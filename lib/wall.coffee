define ['crafty'], (crafty) ->
    crafty.c 'Wall',
        init: () ->
            @requires('2D, Canvas, Image, Tile')
            @image('../assets/Stone Block.png')