use Digest::MD5 qw(md5 md5_hex md5_base64);

use strict;
use warnings;

my $input = 'cxdnnyjw';
my $index = 0;
my $code = '';

while (length $code < 8) {
    my $hash = md5_hex $input . $index;
    $code .= substr $hash, 5, 1 if $hash =~ /^00000/;
    $index++;
}

print "the code is $code";