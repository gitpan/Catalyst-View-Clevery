package Catalyst::View::Clevery;
BEGIN {
  $Catalyst::View::Clevery::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Catalyst::View::Clevery::VERSION = '0.001';
}
# ABSTRACT: Clevery view for Catalyst (Smarty syntax)

use Moose;
extends 'Catalyst::View::Xslate';

use Text::Clevery;

has '+xslate' => (
    isa => 'Text::Clevery',
);

sub _get_xslate {
    my ($self, %args) = @_;
    Text::Clevery->new(%args);
}

1;

__END__
=pod

=head1 NAME

Catalyst::View::Clevery - Clevery view for Catalyst (Smarty syntax)

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

