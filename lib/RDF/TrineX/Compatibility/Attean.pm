use 5.010001;
use strict;
use warnings;

package RDF::TrineX::Compatibility::Attean;

our $AUTHORITY = 'cpan:KJETILK';
our $VERSION   = '0.001';

use Attean;

package Attean::IRI {
	sub uri { return $_[0]->abs }
}

package Attean::Blank {
  sub blank_identifier { return $_[0]->value }
}

package Attean::Literal {
	sub has_datatype { return 1 }

	sub literal_value { return $_[0]->value }

	sub literal_value_language { return $_[0]->language }

	sub literal_datatype { return $_[0]->datatype->as_string }
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

RDF::TrineX::Compatibility::Attean - Compatibility layer between Attean and RDF::Trine

=head1 SYNOPSIS

In modules that have new L<Attean> methods, but otherwise uses L<RDF::Trine>, just go:

  use RDF::TrineX::Compatibility::Attean;


=head1 DESCRIPTION

For now, only certain methods of L<Attean> nodes are supported. They
are added to the respective L<RDF::Trine> nodes by this module. They
are:

=over

=item * C<Attean::Blank::blank_identifier>

=item * C<Attean::IRI::uri>

=item * C<Attean::Literal::literal_value>

=item * C<Attean::Literal::literal_value_language>

=item * C<Attean::Literal::has_datatype>

=item * C<Attean::Literal::literal_datatype>

=back

=head1 BUGS

Please report any bugs or things you miss from L<Attean> here:
L<https://github.com/kjetilk/p5-rdf-trinex-compatibility-attean/issues>.

=head1 SEE ALSO

=head1 AUTHOR

Kjetil Kjernsmo E<lt>kjetilk@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2017 by Kjetil Kjernsmo.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.


=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
