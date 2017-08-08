#_{ Encoding and name
=encoding utf8
=head1 NAME
Grid::Layout - Create grid based layouts.
=cut
#_}
package Grid::Layout;
#_{ use …
use warnings;
use strict;
use utf8;

use Carp;

use Grid::Layout::Cell;
use Grid::Layout::Track;
 #_}
our $VERSION = 0.01;
#_{ Synopsis

=head1 SYNOPSIS

=cut
#_}
#_{ Description

=head1 DESCRIPTION
=cut
#_}
#_{ Methods
#_{ POD
=head1 METHODS
=cut
#_}
sub new { #_{
#_{ POD
=head2 new

    use Grid::Layout;

    my $gl = Grid::Layout->new();

=cut
#_}


  my $class = shift;

  my $self = {};

  bless $self, $class;

  $self->_init_V_or_H('V');
  $self->_init_V_or_H('H');

  $self->{cells} = [];

  return $self;

} #_}
sub _init_V_or_H { #_{
#_{ POD
=head2 _init_V_or_H

    $self->_init_V_or_H('V');
    $self->_init_V_or_H('H');

This method is called by L</new> twice, once for the vertical and once for the horizontal components of the layout.

=cut
#_}
  
  my $self   = shift;
  my $V_or_H = shift;

  $self->{$V_or_H}{tracks} = [];
# $self->{$V_or_H}{lines } = [];

} #_}
sub add_vertical_track { #_{
#_{ POD
=head2 add_vertical_track

=cut
#_}
  my $self = shift;


  my $x = $self->size_x();
  for my $y (0 .. $self->size_y() -1) {
    $self->_add_cell($x, $y);
  }
  
  return $self->_add_track('V');

} #_}
sub add_horizontal_track { #_{
#_{ add_vertical_track
=head2 add_horizontal_track

=cut
#_}
  my $self = shift;

  my $y = $self->size_y;
  for my $x (0 .. $self->size_x()-1) {
    $self->_add_cell($x, $y);
  }

  return $self->_add_track('H');

} #_}
sub _add_track { #_{
  my $self   = shift;
  my $V_or_H = shift;

  my $new_track = Grid::Layout::Track->new($self);

  push @{$self->{$V_or_H}{tracks}}, $new_track;
  return $new_track;

} #_}
sub size_x { #_{
#_{ POD
=head2 size_x

    my $x = $gl->size_x();

Returns the horizontal size (x axis) in logical cell units.

=cut
#_}
  my $self = shift;
  return scalar @{$self->{'V'}{tracks}};
} #_}
sub size_y { #_{
#_{ POD
=head2 size_y

    my $y = $gl->size_y();

Returns the vertical size (y axis) in logical cell units.

=cut
#_}
  my $self = shift;
  return scalar @{$self->{'H'}{tracks}};
} #_}
sub size { #_{
#_{ POD
=head2 size

Returns size of grid (nof vertical tracks x nof horizontal tracks);

    my ($v, $h) = $gl -> size();

=cut
#_}

  my $self = shift;

  return ($self->size_x, $self->size_y);
} #_}
sub _size { #_{
#_{ POD
=head2 _size

Internal use.


=cut
#_}

  my $self   = shift;
  my $V_or_H = shift;

  return scalar @{$self->{$V_or_H}{tracks}},

} #_}
sub cell { #_{
#_{ POD
=head2 cell

    my $cell = $gl->cell($v, $x);

Return the L<< Grid::Layout::Cell >> at horizontal position C<$x> and vertical position C<$y>.

=cut
#_}

  my $self = shift;
  my $x    = shift;
  my $y    = shift;

  return $self->{cells}->[$x][$y];

} #_}
sub _add_cell { #_{
#_{ POD
=head2 _add_cell

Internal use.

=cut
#_}
  
  
  my $self = shift;
  my $x    = shift;
  my $y    = shift;

  $self->{cells}->[$x][$y] = Grid::Layout::Cell->new($self);

} #_}
#_}
#_{ POD: Copyright

=head1 Copyright
Copyright © 2017 René Nyffenegger, Switzerland. All rights reserved.
This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at: L<http://www.perlfoundation.org/artistic_license_2_0>
=cut

#_}

'tq84';
