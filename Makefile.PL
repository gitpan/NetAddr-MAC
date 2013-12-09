
use strict;
use warnings;

use 5.004;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Handles hardware MAC Addresses (EUI-48 and EUI-64)",
  "AUTHOR" => "Dean Hamstead <dean\@bytefoundry.com.au>",
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
  "TEST_REQUIRES" => {},
  "VERSION" => "0.82",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Exporter" => 0,
  "List::Util" => 0,
  "Test::Trap" => 0,
  "base" => 0,
  "constant" => 0,
  "strict" => 0,
  "vars" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



