package Dotseer::Command::list;

# ABSTRACT: List managed dotfiles

use Moo;
use namespace::clean;

use Dotseer -command;
with qw(Dotseer::Role::List);

=head1 SYNOPSIS

    dotseer list

=cut

sub abstract {'List managed dotfiles'}

sub usage_desc {'%c %o'}

sub execute {
    my ($self, $opt, $arg) = @_;
    $self->list_dotfiles;
}

1;
