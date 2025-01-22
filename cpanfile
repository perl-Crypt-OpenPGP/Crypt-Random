# This file is generated by Dist::Zilla::Plugin::CPANFile v6.032
# Do not edit this file directly. To change prereqs, edit the `dist.ini` file.

requires "Carp" => "0";
requires "Class::Loader" => "2.00";
requires "Crypt::URandom" => "0";
requires "Data::Dumper" => "0";
requires "Exporter" => "0";
requires "Fcntl" => "0";
requires "IO::Socket" => "0";
requires "Math::Pari" => "2.001804";
requires "Statistics::ChiSquare" => "1.0000";
requires "perl" => "5.008";

on 'test' => sub {
  requires "Statistics::ChiSquare" => "1.0000";
  requires "Test" => "0";
  requires "Test2::V0" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Test::CPAN::Meta::JSON" => "0.16";
  requires "Test::Kwalitee" => "1.21";
  requires "Test::Pod" => "1.41";
  requires "Test::Spelling" => "0.17";
};
