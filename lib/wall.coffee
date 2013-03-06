define ['crafty'], (crafty) ->
    crafty.c 'Wall',
        init: () ->
            @requires('2D, Canvas, Color, Tile')
            @color('rgb(128,0,0)')