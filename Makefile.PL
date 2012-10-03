
use strict;
use warnings;

use 5.004;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Handles hardware MAC Addresses (EUI-48 and EUI-64)",
  "AUTHOR" => "Dean Hamstead <dean\@fragfest.com.au>",
  "BUILD_REQUIRES" => {
    "Test::Trap" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "NetAddr-MAC",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "NetAddr::MAC",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "List::Util" => 0,
    "base" => 0,
    "constant" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.78",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



