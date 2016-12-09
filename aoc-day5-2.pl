use Digest::MD5 qw(md5 md5_hex md5_base64);

use strict;
use warnings;

my $input = 'cxdnnyjw';
my $index = 0;
my $code = '-' x 8;
while ($code =~ /-/) {
    my $hash = md5_hex $input . $index;
    if ($hash =~ /^00000/) {
        my $pos = substr $hash, 5, 1;
        my $char = substr $hash, 6, 1;
        print "pos $pos, char $char, code $code\n";
        substr($code, $pos, 1) = $char if $pos =~ /^[0-7]$/ && substr($code,$pos,1) eq '-';
    }
    $index++;
}

print "the code is $code";