
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Template Toolkit dumper plugin using Data::Printer",
  "AUTHOR" => "Stephen Thirlwall <sdt\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Exporter" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "HTML::Entities" => 0,
    "Template" => 0,
    "Term::ANSIColor" => 0,
    "Test::Builder" => 0,
    "Test::More" => 0,
    "Test::NoWarnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Template-Plugin-DataPrinter",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Template::Plugin::DataPrinter",
  "PREREQ_PM" => {
    "Data::Printer" => 0,
    "HTML::FromANSI::Tiny" => 0,
    "Hash::Merge::Simple" => 0,
    "Template::Plugin" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.011",
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



