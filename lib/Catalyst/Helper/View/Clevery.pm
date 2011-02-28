package Catalyst::Helper::View::Clevery;
BEGIN {
  $Catalyst::Helper::View::Clevery::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Catalyst::Helper::View::Clevery::VERSION = '0.002';
}
# ABSTRACT: Helper class for Catalyst::View::Clevery

use strict;


sub mk_compclass {
    my ( $self, $helper ) = @_;

	my %args = ();

    my $file = $helper->{file};
    (my $template = do { local $/; <DATA> }) =~ s/^\s\s//g;
    $helper->render_file_contents($template, $file);
	
    $helper->render_file('modelclass', $helper->{file}, \%args);
    return 1;
}


1;



=pod

=head1 NAME

Catalyst::Helper::View::Clevery - Helper class for Catalyst::View::Clevery

=head1 VERSION

version 0.002

=head1 SYNOPSIS

    script/create.pl view HTML Clevery

=head1 DESCRIPTION

This is a helper module for Clevery Views. It is not meant to be used
directly. Instead, you should use your Catalyst app's "create" script
(see the SYNOPSIS for syntax).

=head2 Arguments

As any other view helper, the first argument is your View's name. In the
synopsys example we used "HTML", and it's usually a good name :)

The Clevery helper accepts the same construction arguments as
L<Text::Clevery itself|Text::Clevery>. Its based on L<Text::Xslate>, so most
parameters you will find in this documentation instead.

List arguments can be separated by comma:

    script/create.pl view HTML Clevery cache=2 header=foo.tpl,bar.tpl suffix=.tpl

=head2 METHODS

=head3 mk_compclass

This method is used by the Catalyst helper engine to generate files properly.

=head1 NAME

Catalyst::Helper::View::Clevery - Helper for Clevery Views

=head1 SEE ALSO

L<Catalyst::View::Clevery>, L<Catalyst::Manual>, L<Catalyst::Helper>,
L<Text::Clevery>, L<Text::Xslate>.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__

=begin pod_to_ignore

__compclass__
package [% class %];

use Moose;
extends 'Catalyst::View::Clevery';

__PACKAGE__->config(
    template_extension => '.tpl',
);

1;

=head1 NAME

[% class %] - Clevery View for [% app %]

=head1 DESCRIPTION

Clevery View for [% app %].

=cut
