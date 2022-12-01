
import os
#open file Challange1.txt where this file is located
file = open("Day 1\input.txt", "r")
#read the file
data = file.read()
#calculate How many measurements are larger than the previous measurement

def number_of_increases(data):
    """calculate number of increases in the data"""
    return sum(1 for i in range(len(data)-1) if int(data[i]) < int(data[i+1]))

data_list = data.split('\n')

# part 1
print(number_of_increases(data_list))

# part 2
# calculate sums of each consecutive group of 3 numbers
sums_of_three = [sum(map(int, data_list[i:i+3])) for i in range(len(data_list)-2)]
print(number_of_increases(sums_of_three))
