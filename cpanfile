requires "Carp" => "0";
requires "Exporter" => "0";
requires "List::Util" => "0";
requires "base" => "0";
requires "constant" => "0";
requires "perl" => "5.004";
requires "strict" => "0";
requires "vars" => "0";
requires "warnings" => "0";

on 'build' => sub {
  requires "Test::Trap" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};

on 'develop' => sub {
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Test::CPAN::Meta" => "0";
  requires "Test::Kwalitee" => "1.12";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
};
