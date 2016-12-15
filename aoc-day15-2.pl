use strict;
use warnings;

sub solved;

my $time = 0;
my @puzzle = ([1,13],[10,19],[2,3],[1,7],[3,5],[5,17],[0,11]);
while (1) {
   last if solved @puzzle;
   $time++;
   @puzzle = map {[$_->[0] = ($_->[0] + 1) % $_->[1], $_->[1]]} @puzzle;
}

print "Start time: $time\n";


sub solved {
    my $delta = 1;
    scalar @_ == scalar grep { $_->[0] == ($_->[1] - $delta++) % $_->[1]} @_;    
}
