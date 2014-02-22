package Dotf::Command::scan;

# ABSTRACT: Scan $HOME for any existing dotfiles to manage

use Moo;
use namespace::clean;
use Dotf -command;
with qw(Dotf::Role::Scan);

=head1 SYNOPSYS

    dotf scan ~/

=cut

sub abstract {'Scan for existing dotfiles to manage'}

sub usage_desc {'%c %o scan <path/to/home>'}

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error("Need to provide a home directory to scan")
      if @$args != 1;
}

sub execute {
    my ($self, $opt, $arg) = @_;
    $self->scan($arg->[0]);
}

1;

