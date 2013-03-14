define ['crafty'], (crafty) ->
    crafty.c 'Floor',
             init: () ->
                 @requires('2D, Canvas, Image, Tile')
                 @image('assets/Dirt Block.png')