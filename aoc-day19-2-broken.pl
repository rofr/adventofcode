use strict;
use warnings;

# An array of elves where the value is the elfs initial position, 
# removing one at a time until only one is left


my $num_elves = 5; #3014387;
my @elves = 1 .. $num_elves;

my $current = 0;

while (scalar @elves > 1) {
   my $across = ($current + (int $num_elves / 2)) % $num_elves;
   print "current: $current, across: $across, num_elves: $num_elves\n";
   print join ",", @elves;
   print "\n";
   splice @elves, $across, 1;
   $current++;
   $num_elves--;
}

print "Elf number " . $elves[0] . " has all the presents\n";