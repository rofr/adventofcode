import re

required_keys = ('byr', 'iyr','eyr','hgt','hcl','ecl','pid')

def parse(raw):
    return dict([pair.split(':') for pair in raw.split()])

def height(h):
    if not re.search('^\d{2,3}(cm|in)$', h): return False
    suffix = h[-2:]
    num = int(h[:-2])
    if suffix == 'cm':
        return num >= 150 and num <= 193
    elif suffix == 'in':
        return num >= 59 and num <= 76
    else:
        return False
        
rules = {
    'byr': lambda byr: int(byr) >= 1920 and int(byr) <= 2002,
    'iyr': lambda iyr: int(iyr) >= 2010 and int(iyr) <= 2020,
    'eyr': lambda eyr: int(eyr) >= 2020 and int(eyr) <= 2030,
    'hgt': height,
    'hcl': lambda hcl: re.search(r'^#[0-9a-f]{6}$', hcl),
    'ecl': lambda ecl: ecl in ['amb', 'blu', 'brn', 'gry', 'grn','hzl','oth'],
    'pid': lambda pid: re.search(r'^\d{9}$', pid),
    'cid': lambda cid: True
}

def isvalid(passport):
    for key in required_keys:
        if not key in passport:
            return False
    # day 2 below
    for key in passport:
        if not rules[key](passport[key]): return False
    return True



    """
byr (Birth Year) - four digits; at least 1920 and at most 2002.
iyr (Issue Year) - four digits; at least 2010 and at most 2020.
eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
hgt (Height) - a number followed by either cm or in:
If cm, the number must be at least 150 and at most 193.
If in, the number must be at least 59 and at most 76.
hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
pid (Passport ID) - a nine-digit number, including leading zeroes.
cid (Country ID) - ignored, missing or not.
    """


file = open('day4.txt', 'r')
input = file.read()
file.close()

passports = input.split("\n\n")
print(len(passports))

#number of valid passports
valid = 0

for raw in passports:
    passport = parse(raw)
    print(passport)
    if isvalid(passport): valid += 1

print("Valid passports: ", valid)
