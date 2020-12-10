
file = open('day1-input.txt', 'r')

numbers = file.readlines()
file.close()

#numbers = [1,2,3,4,5,6,200, 1820, 7, 12, 600, 500]

size = len(numbers)

for i in range(size):
    a = int(numbers[i])
    for j in range(i+1, size):
        b = int(numbers[j])
        sum = a + b
        if sum == 2020:
            print(a,b,sum)
        #print(a, b, a + b)

