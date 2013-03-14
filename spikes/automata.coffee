class Grid
    constructor: (@width, @height) ->
        @content = []
        for x in [0...@width]
            @content.push([])
            for y in [0...@height]
                @content[x].push 0

    fillRandom: (fillLevel) ->
        for x in [0...@width]
            for y in [0...@height]
                rand = if Math.random() < fillLevel then 1 else 0
                @set x, y, rand
        null

    getNeighbourCount: (x, y) ->
        count = 0
        for dx in [-1..1]
            if 0 <= x + dx < @width
                for dy in [-1..1]
                    unless dy is 0 and dx is 0
                        if 0 <= y + dy < @height
                            count += @content[x + dx][y + dy]
                        else
                            count += 1
            else
                count += 3
        count

    get: (x, y) ->
        @content[x][y]

    set: (x, y, value) ->
        @content[x][y] = value

    print: () ->
        for y in [0...@height]
            line = ""
            for x in [0...@width]
                line += if @get(x, y) is 1 then "." else @get(x, y)
            console.log line
        null

class Dungeon
    constructor: (@width, @height) ->
        @build
            width: @width
            height: @height
            fillLevel: 0.4
            born: [5, 6, 7, 8]
            survive: [3, 4, 5, 6, 7, 8]
            generations: 12

    build: (options) ->
        if !options.grid
            options.grid = new Grid options.width, options.height
            options.grid.fillRandom options.fillLevel

        newGrid = new Grid options.grid.width, options.grid.height

        for x in [0...options.grid.width]
            for y in [0...options.grid.height]
                newGrid.set x, y, @processRules x, y, options

        options.grid = newGrid

        if options.generations > 1
            --options.generations
            @build options

        @grid = options.grid

    processRules: (x, y, data) ->
        neighbourCount = data.grid.getNeighbourCount x, y
        return 1 if neighbourCount in data.born and data.grid.get(x,y) is 0
        return 1 if neighbourCount in data.survive and data.grid.get(x,y) is 1
        0

    print = () ->
        @grid.print


dungeon = new Dungeon 60, 30
dungeon.print