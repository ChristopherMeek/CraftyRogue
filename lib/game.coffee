define ['crafty','tile','wall','settings'], (crafty, tile, wall, settings) ->    
    width: () -> return settings.grid.width * settings.grid.tile.width
    height: () -> return (settings.grid.height * settings.grid.tile.height) + settings.grid.tile.topPadding + settings.grid.tile.bottomPadding
    make_wall: (x,y) -> crafty.e('Wall').at x, y
    at_edge: (x,y) -> 
        x is 0 or y is 0 or x is settings.grid.width-1 or y is settings.grid.height-1
    start: () ->
        console.log(@height())
        crafty.init @width(), @height()
        crafty.background 'rgb(80, 80, 80)'
        for x in [0..settings.grid.width-1]
            for y in [0..settings.grid.height-1]
                @make_wall x, y if @at_edge x, y
        null

