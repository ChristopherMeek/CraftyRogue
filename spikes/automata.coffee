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

    findOpen: () ->
        for x in [0...@width]
            for y in [0...@height]
                return { x: x , y: y} if @get(x,y) is 0
        null

    isInBounds: (x,y) ->
        0 <= x < @width and 0 <= y < @height

    fill: (x,y,value,match) ->
        if @isInBounds x, y
            if @get(x,y) is match
                @set(x,y,value)
                @fill x-1, y, value, match
                @fill x+1, y, value, match
                @fill x, y-1, value, match
                @fill x, y+1, value, match


buildDungeon = (options) ->
    if !options.grid
        options.grid = new Grid options.width, options.height
        options.grid.fillRandom options.fillLevel

    newGrid = new Grid options.grid.width, options.grid.height

    for x in [0...options.grid.width]
        for y in [0...options.grid.height]
            newGrid.set x, y, processRules x, y, options

    options.grid = newGrid

    if options.generations > 1
        --options.generations;
        buildDungeon options

    return options.grid;


processRules = (x, y, data) ->
    neighbourCount = data.grid.getNeighbourCount x, y
    return 1 if neighbourCount in data.born and data.grid.get(x,y) is 0
    return 1 if neighbourCount in data.survive and data.grid.get(x,y) is 1
    0

getNeighbourCount = (grid, x, y) ->
    count = 0
    for dx in [-1..1]
        for dy in [-1..1]
            count += grid[x + dx][y + dy] unless dx is 0 and dy is 0
    count

displayDungeon = (dungeon) ->
    for x in [0...dungeon.width]
        line = ""
        for y in [0...dungeon.height]
            line += if dungeon.get x, y is 1 then '#' else '.'
        console.log(line)

dungeon = buildDungeon
    width: 160
    height: 40
    fillLevel: 0.45
    born: [5, 6, 7, 8]
    survive: [3, 4, 5, 6, 7, 8]
    generations: 15

i = 65

console.log dungeon.findOpen()

until dungeon.findOpen() is null

    open = dungeon.findOpen()
    dungeon.fill(open.x,open.y,String.fromCharCode(i++),0)

dungeon.print()