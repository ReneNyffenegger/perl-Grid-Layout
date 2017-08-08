#_{ Encoding and name
=encoding utf8
=head1 NAME
Grid::Layout::Track
=cut
#_}
package Grid::Layout::Track;
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

a C<< Grid::Layout::Track >> is the space between to adjacent L<< Grid::Layout::Line >>s.

Usually, a horizontal track is referred to as a row, a vertical track as a column.

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

  my $class       = shift;
  my $grid_layout = shift;

  my $self        = {};

  croak 'Grid::Layout expected' unless $grid_layout->isa('Grid::Layout');

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



