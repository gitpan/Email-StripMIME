use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Email::StripMIME',
    'VERSION_FROM'	=> 'lib/Email/StripMIME.pm', # finds $VERSION
    'PREREQ_PM'		=> { 
			Email::MIME => 0.01,
			Email::MIME::Encodings => 1.1,
			HTML::FormatText => 0.01,
			HTML::TreeBuilder => 0.01,
			Test::More => 0.01,
			}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Email/StripMIME.pm', # retrieve abstract from module
       AUTHOR     => 'Pete Sergeant <stripmime@clueball.com>') : ()),
);
