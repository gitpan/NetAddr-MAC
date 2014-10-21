#!/usr/bin/perl

use strict;
use warnings FATAL   => 'all';
use Test::More tests => 7;

BEGIN {
    use_ok('NetAddr::MAC')
      or die "# NetAddr::MAC not available\n";
}

{

    local $NetAddr::MAC::die_on_error = 1;

    eval { NetAddr::MAC->new('') };
    like( $@, qr/Please provide a mac address/i, 'Empty MAC' );

    ok( !$NetAddr::MAC::errstr, 'errstr stays empty when die_on_error = 1' );

    eval { NetAddr::MAC->new() };
    like( $@, qr/please provide a mac address/i, 'Undef MAC' );

    eval { NetAddr::MAC->new('11:22:33:44:xx:55') };
    like( $@, qr/Invalid MAC format/, 'Bad MAC character' );

    eval { NetAddr::MAC->new('1:1') };
    like( $@, qr/Invalid MAC format/, 'Bad MAC octet' );

    eval { NetAddr::MAC->new('11:22:33') };
    like( $@, qr/Invalid MAC format/, 'Short MAC' );

}
