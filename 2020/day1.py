
file = open('day1.txt', 'r')

numbers = file.readlines()
file.close()

#numbers = [1,2,3,4,5,6,200, 1820, 7, 12, 600, 500]

size = len(numbers)

for i in range(size):
    a = int(numbers[i])
    for j in range(i+1, size):
        b = int(numbers[j])
        for k in range(j+1, size):
            c = int(numbers[k])
            sum = a + b + c
            if sum == 2020:
                print(a,b,c,sum)
                product = a * b * c
                print('product is ', product)

