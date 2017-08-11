use strict;
use warnings;

use Test::Simple tests => 1;

use Grid::Layout;

my $gl = Grid::Layout->new();

my $v_1 = $gl->add_vertical_line  ();
my $h_1 = $gl->add_horizontal_line();

my $v_2 = $gl->add_vertical_line  ();
my $h_2 = $gl->add_horizontal_line();

my $v_3 = $gl->add_vertical_line  ();
my $v_4 = $gl->add_vertical_line  ();

my $h_3 = $gl->add_horizontal_line();
my $h_4 = $gl->add_horizontal_line();



ok(1);
