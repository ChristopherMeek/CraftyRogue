define ['crafty','settings'], (crafty,settings) ->
    crafty.c 'Tile',
        init: () ->
            console.log 'init tile'
            @attr
                w: settings.grid.tile.width
                h: settings.grid.tile.height
        at: (x, y) ->
            @attr
                x: x * settings.grid.tile.width
                y: y * settings.grid.tile.height
            @