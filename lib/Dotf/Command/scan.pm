package Dotf::Command::scan;

# ABSTRACT: Scan $HOME for any existing dotfiles to manage

use Dotf -command;

use Moo;
use namespace::clean;

with qw(Dotf::Role::Scan);

=head1 SYNOPSIS

$ dotf scan -d ~/ --exclude "ecryptfs"

=head1 DESCRIPTION

Scans directory (by default $HOME) for symlinked dotfiles that are
managed or unmanaged by dotf

=cut

sub abstract {'Scan for existing dotfiles to manage'}

sub usage_desc {'%c %o scan <path/to/home>'}

sub opt_spec {
    return (
        ['dir|d=s',     'directory to scan (optional, defaults to $HOME'],
        ['exclude|e=s', 'pattern to exclude (optional)'],
    );
}

sub execute {
    my ($self, $opt, $arg) = @_;
    $opt->{dir} = "~/" unless defined($opt->{dir});
    $self->scan($opt->{dir}, $opt->{exclude});
}

1;

