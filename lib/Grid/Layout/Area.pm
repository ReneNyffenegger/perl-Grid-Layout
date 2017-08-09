#_{ Encoding and name
=encoding utf8
=head1 NAME

Grid::Layout::Area

=cut
#_}
package Grid::Layout::Area;
#_{ use …
use warnings;
use strict;
use utf8;

use Carp;
 #_}
our $VERSION = 0.01;
#_{ Synopsis

=head1 SYNOPSIS
=cut
#_}
#_{ Description

=head1 DESCRIPTION

A C<< Grid::Layout::Area >> is bound by 2 different horizontal L<< Grid::Layout::Line >>s and
2 different vertical L<< Grid::Layout::Line >>s.

Thus, it's I<logical size> is at least one L<< Grid::Layout::Cell >> and an exact integer multiple
of L<< Grid::Layout::Cell >>s.

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


=cut
#_}

  my $class        = shift;
  my $track_v_from = shift;
  my $track_h_from = shift;
  my $track_v_to   = shift;
  my $track_h_to   = shift;

  croak 'track_v_from is not a Grid::Layout::Track' unless $track_v_from->isa('Grid::Layout::Track');
  croak 'track_v_to   is not a Grid::Layout::Track' unless $track_v_to  ->isa('Grid::Layout::Track');
  croak 'track_h_from is not a Grid::Layout::Track' unless $track_h_from->isa('Grid::Layout::Track');
  croak 'track_h_to   is not a Grid::Layout::Track' unless $track_h_to  ->isa('Grid::Layout::Track');

  croak 'track_v_from is not a vertical' unless $track_v_from->{V_or_H} eq 'V';
  croak 'track_v_to   is not a vertical' unless $track_v_to  ->{V_or_H} eq 'V';
  croak 'track_h_from is not a vertical' unless $track_h_from->{V_or_H} eq 'H';
  croak 'track_h_to   is not a vertical' unless $track_h_to  ->{V_or_H} eq 'H';

  my $self  = {};

  bless $self, $class;


  return $self;

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


