#load file challenge2.txt and print the content
file = open("Day 2\input.txt", "r")
#read the file
data = file.read()
steps = data.split("\n")

class Position:
    def __init__(self, horizontal = 0, depth = 0, aim = 0):
        self.horizontal = horizontal
        self.depth = depth
        self.aim = aim

# Part 1
position = Position()
for step in steps:
    direction, distance = step.split(" ")
    distance = int(distance)
    if direction == "forward":
        position.horizontal += distance
    elif direction == "up":
        position.depth -= distance
    elif direction == "down":
        position.depth += distance
print("Product:", position.horizontal * position.depth)

# Part 2
position = Position()
for step in steps:
    direction, distance = step.split(" ")
    distance = int(distance)
    if direction == "forward":
        position.horizontal += distance
        position.depth += position.aim * distance
    elif direction == "up":
        position.aim -= distance
    elif direction == "down":
        position.aim += distance
print("Product:", position.horizontal * position.depth)

file.close()