define ['crafty', 'tile', 'wall', 'settings', 'rot', 'floor','player'], (crafty, tile, wall, settings, ROT) ->
    width: () -> return settings.grid.width * settings.grid.tile.width
    height: () -> return (settings.grid.height * settings.grid.tile.height) + settings.grid.tile.topPadding + settings.grid.tile.bottomPaddi
    playerStart: null
    make_tile: (x, y, isWall) ->
        if isWall then crafty.e('Wall').at x, y else crafty.e('Floor').at x, y
        if not isWall and not @playerStart
            @playerStart = { x: x, y: y }
    digger: new ROT.Map.Uniform(settings.grid.width, settings.grid.height)
    start: () ->
        console.log("Width:",@width())
        crafty.init @width(), @height()
        crafty.background 'rgb(80, 80, 80)'
        @digger.create(@make_tile.bind(this))
        crafty.e('Player').at @playerStart.x, @playerStart.y
        crafty.viewport.init 800, 600
        null

