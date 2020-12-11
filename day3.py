
input = open('day3.txt', 'r')
lines = input.readlines()
input.close()


def count_trees(map, slope):
    #look at the last line because there is no new line
    columns = len(map[len(map)-1])
    (right,down) = slope
    trees = 0
    line = 0
    column = 0
    while line < len(map):
        if map[line][column] == '#':
            trees += 1
        line = line + down
        column = (column + right) % columns
    return trees


product = 1
slopes = ((1,1),(3,1),(5,1),(7,1),(1,2))
for slope in slopes:
    print(slope, end = ", trees: ")
    trees = count_trees(lines, slope)
    print(trees)
    product *= trees

print(product)