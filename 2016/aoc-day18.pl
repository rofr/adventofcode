use strict;
use warnings;

sub next_row;

my %productions =  ( 
    "^^." => "^", 
    ".^^" => "^", 
    "^.." => "^",
    "..^" => "^",
    "^^^" => ".",
    "^.^" => ".",
    "..." => ".",
    ".^." => ".");

my $row = ".^^^.^.^^^.^.......^^.^^^^.^^^^..^^^^^.^.^^^..^^.^.^^..^.^..^^...^.^^.^^^...^^.^.^^^..^^^^.....^....";
my $safe = 0;

for (1..400000) {
    $safe += $row =~ tr/././;
    $row = join '', 
        map { $productions{substr ".$row.", $_, 3} } 
        0 .. length($row) - 1;
}

print "Number of safe: $safe\n";
