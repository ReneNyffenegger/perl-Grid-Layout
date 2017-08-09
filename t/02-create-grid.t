use strict;
use warnings;

use Test::Simple tests => 46;
use Test::More;

use Grid::Layout;

my $gl = Grid::Layout->new();                    isa_ok($gl        , 'Grid::Layout', '$gl is a Grid::Layout');

is_deeply($gl->{V}{tracks}, [], '$gl->{V}{tracks} is an array reference');
is_deeply($gl->{H}{tracks}, [], '$gl->{H}{tracks} is an array reference');

my @size = $gl->size();

is_deeply(\@size, [0, 0], 'Size is 0x0');

my $cell;

$cell = $gl->cell(0, 0);
is($cell, undef, 'cell 0.0 is undefined');

is(scalar @{$gl->{V}->{lines}}, 0, '0 vertical lines');
is(scalar @{$gl->{H}->{lines}}, 0, '0 horizontal lines');

# Add 4 horizontal and 3 vertical tracks:
my $track_h_01 = $gl->add_horizontal_track();
                 isa_ok($track_h_01, 'Grid::Layout::Track', '$track_h_01 is a Grid::Layout::Track');
                 is($gl->size_x, 0, 'gl size_x is 1');
                 is($gl->size_y, 1, 'gl size_y is 0');
                 @size=$gl->size(); is_deeply(\@size, [0, 1], 'Size is 0x1');
                 $cell = $gl->cell(0, 0); is($cell, undef, 'cell 0.0 is undefined');
                 is(scalar @{$gl->{V}->{lines}}, 0, '0 vertical lines');
                 is(scalar @{$gl->{H}->{lines}}, 2, '2 horizontal lines');
my $track_h_02 = $gl->add_horizontal_track();
                 isa_ok($track_h_02, 'Grid::Layout::Track', '$track_h_02 is a Grid::Layout::Track');
                 is($gl->size_x, 0, 'gl size_x is 2');
                 is($gl->size_y, 2, 'gl size_y is 0');
                 @size=$gl->size(); is_deeply(\@size, [0, 2], 'Size is 0x2');
                 $cell = $gl->cell(0, 0); is($cell, undef, 'cell 0.0 is undefined');
                 is(scalar @{$gl->{V}->{lines}}, 0, '0 vertical lines');
                 is(scalar @{$gl->{H}->{lines}}, 3, '3 horizontal lines');
my $track_h_03 = $gl->add_horizontal_track();
                 isa_ok($track_h_03, 'Grid::Layout::Track', '$track_h_03 is a Grid::Layout::Track');
                 is($gl->size_x, 0, 'gl size_x is 3');
                 is($gl->size_y, 3, 'gl size_y is 0');
                 $cell = $gl->cell(0, 0); is($cell, undef, 'cell 0.0 is undefined');
                 is(scalar @{$gl->{V}->{lines}}, 0, '0 vertical lines');
                 is(scalar @{$gl->{H}->{lines}}, 4, '4 horizontal lines');
my $track_v_01 = $gl->add_vertical_track();
                 isa_ok($track_v_01, 'Grid::Layout::Track', '$track_h_01 is a Grid::Layout::Track');
                 @size=$gl->size(); is_deeply(\@size, [1, 3], 'Size is 1x3');
                 $cell = $gl->cell(0, 0); isa_ok($cell, 'Grid::Layout::Cell', 'cell 0.0 is Cell');
                 $cell = $gl->cell(0, 1); isa_ok($cell, 'Grid::Layout::Cell', 'cell 0.1 is Cell');
                 $cell = $gl->cell(0, 2); isa_ok($cell, 'Grid::Layout::Cell', 'cell 0.2 is Cell');
                 $cell = $gl->cell(1, 0); is    ($cell,  undef              , 'cell 0.1 is undef');
                 $cell = $gl->cell(1, 1); is    ($cell,  undef              , 'cell 1.1 is undef');
                 is(scalar @{$gl->{V}->{lines}}, 2, '2 vertical lines');
                 is(scalar @{$gl->{H}->{lines}}, 4, '4 horizontal lines');
my $track_v_02 = $gl->add_vertical_track();
                 isa_ok($track_v_02, 'Grid::Layout::Track', '$track_h_02 is a Grid::Layout::Track');

my $track_h_04 = $gl->add_horizontal_track();
                 isa_ok($track_h_04, 'Grid::Layout::Track', '$track_h_04 is a Grid::Layout::Track');
my $track_v_03 = $gl->add_vertical_track();
                 isa_ok($track_v_03, 'Grid::Layout::Track', '$track_h_03 is a Grid::Layout::Track');
                 @size = $gl->size(); is_deeply(\@size, [3, 4], 'Size is 3 (vertical) x 4 (horizontal) tracks');

is($gl->size_x, 3, 'Horizontal size is 4');
is($gl->size_y, 4, 'Vertical size is 3');


# Add another 6 horizontal and 5 vertical tracks;

my $track_h_05 = $gl->add_horizontal_track();
my $track_h_06 = $gl->add_horizontal_track();
my $track_h_07 = $gl->add_horizontal_track();
my $track_h_08 = $gl->add_horizontal_track();
my $track_h_09 = $gl->add_horizontal_track();
my $track_h_10 = $gl->add_horizontal_track();

my $track_v_04 = $gl->add_vertical_track();
my $track_v_05 = $gl->add_vertical_track();
my $track_v_06 = $gl->add_vertical_track();
my $track_v_07 = $gl->add_vertical_track();
my $track_v_08 = $gl->add_vertical_track();

is($gl->size_x,  8, 'size_x =  8');
is($gl->size_y, 10, 'size_y = 10');

is(scalar @{$gl->{V}->{lines}}, 9, '9 vertical lines');
is(scalar @{$gl->{H}->{lines}},11, '11 horizontal lines');

# my $area_1 = $gl->area(0, 7, 2, 7); # x-from, y-from, x-to, y-to

#          0      1      2      3      4      5      6      7
#
#      +------+------+------+------+------+------+------+------+
#  0   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  1   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  2   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  3   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  4   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  5   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  6   |      |      |      |      |      |      |      |      |
#      +--------------------+------+------+------+------+------+
#  7   |    Area 1          |      |      |      |      |      |
#      +--------------------+------+------+------+------+------+
#  8   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#  9   |      |      |      |      |      |      |      |      |
#      +------+------+------+------+------+------+------+------+
#



