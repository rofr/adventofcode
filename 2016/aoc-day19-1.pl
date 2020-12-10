use strict;
use warnings;

# A linked list of elves where the value is the elfs initial position, 
# removing one at a time until only one is left

sub elf;

my $num_elves = 3014387;
my $last = [$num_elves];

my $first = elf 1;
push @{$last}, $first;

while ($first->[1] != $first) {
    $first->[1] = $first->[1]->[1];  # remove loser from chain
    $first = $first->[1]; # move to next elf
}
print "Elf number " . $first->[0] . " has all the presents\n";

sub elf {
    my $val = shift;
    return [$val, elf $val + 1] if $val < $num_elves;
    return $last;
}