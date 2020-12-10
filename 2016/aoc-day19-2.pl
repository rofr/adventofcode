use strict;
use warnings;

# A linked list of elves where the value is the elfs initial position, 
# removing one at a time until only one is left

sub build_list;
sub find_before_across;

my $num_elves = 3014387;
my $last = [$num_elves];

my $current = build_list 1;
my $before_across = find_before_across;
push @{$last}, $current;

while ($num_elves > 1) {
    #remove elf across
    $before_across->[1] = $before_across->[1]->[1];
    $num_elves --;
    $before_across = $before_across->[1] if $num_elves % 2 == 0;
    $current = $current->[1]; # move to next elf
}
print "Elf number " . $current->[0] . " has all the presents\n";

sub find_before_across {
    my $node = $current;
    my $steps = int $num_elves / 2;
    $steps --;
    $node = $node->[1] while $steps --> 0;
    return $node;
}

sub remove_elf_across {
    
}

sub build_list {
    my $val = shift;
    return [$val, build_list $val + 1] if $val < $num_elves;
    return $last;
}