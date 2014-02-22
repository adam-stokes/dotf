package Dotf::Command::list;

# ABSTRACT: List managed dotfiles

use Dotf -command;

use Moo;
use namespace::clean;

with qw(Dotf::Role::List);

=head1 SYNOPSIS

    dotf list

=cut

sub abstract {'List managed dotfiles'}

sub usage_desc {'%c %o'}

sub execute {
    my ($self, $opt, $arg) = @_;
    $self->list_dotfiles;
}

1;