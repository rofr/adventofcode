import re

required_keys = ('byr', 'iyr','eyr','hgt','hcl','ecl','pid')

def isvalid(passport):
    for key in required_keys:
        if not key in passport:
            return False
    return True

file = open('day4.txt', 'r')
input = file.read()
file.close()

passports = input.split("\n\n")
print(len(passports))

#number of valid passports
valid = 0

for raw in passports:
    matches = len(re.findall("(byr|iyr|eyr|hgt|hcl|ecl|pid):", raw))
    if matches == 7: valid += 1

print("Valid passports: ", valid)
