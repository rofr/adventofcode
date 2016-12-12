
use strict;
use warnings;


my $regs = {
    a => 0,
    b => 0,
    c => 1,
    d => 0
};

my $handlers =  {
    'cpy' => sub { 
        my ($source, $dest) = @_; 
        $regs->{$dest} = $source =~ /^[a-d]$/ ? $regs->{$source} : $source;
        return 1;
    },
    'inc' => sub { 
        my $r = shift; 
        $regs->{$r}++; 
        return 1; 
    },
    'dec' => sub { 
        my $r = shift;
        $regs->{$r}--; 0;
        return 1;
    },
    'jnz' => sub {
        my ($source, $offset) = @_;
        $source = $regs->{$source} if $source =~ /^[a-d]$/;
        return $source != 0 ? $offset : 1;
    }
};

my @instructions =  <DATA>;
chomp @instructions;

my $ip = 0;

# hand out all the chips and rules
while ($ip < scalar @instructions) {
    $instructions[$ip] =~ /^(\w{3}) (\w+)( (-?\w+))?$/;
    $ip += $handlers->{$1}->($2, $4);
}

print "Regs:\n";
print "a ", $regs->{a}, "\n";
print "b ", $regs->{b}, "\n";
print "c ", $regs->{c}, "\n";
print "d ", $regs->{d}, "\n";

__DATA__
cpy 1 a
cpy 1 b
cpy 26 d
jnz c 2
jnz 1 5
cpy 7 c
inc d
dec c
jnz c -2
cpy a c
inc a
dec b
jnz b -2
cpy c b
dec d
jnz d -6
cpy 13 c
cpy 14 d
inc a
dec d
jnz d -2
dec c
jnz c -5