#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use Template;

use ok 'Template::Plugin::JSON';

ok(Template->new->process(
	\q{[% USE JSON ( escape_slash => 1 ) %][% foo.json %]},
	{ foo => ['woo/bar'] },
	\(my $out),
), "Template processing") || warn Template->error;

is($out, q{["woo\/bar"]}, "escape_slash option properly honoured");

done_testing;
