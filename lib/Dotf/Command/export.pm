package Dotf::Command::export;

# ABSTRACT: Export to a rex/ansible deployer
use Dotf -command;

use Moo;
use namespace::clean;

with qw(Dotf::Role::Export);

=head1 SYNOPSIS

    dotf export ansible
    > Ansible playbook.yml created.

    dotf export rex
    > Rexfile generated.

=cut

sub abstract {'Export to a rex/ansible deployer'}

sub usage_desc {'%c %o <rex|ansible>'}

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error('Dotf export <rex|ansible> only.') if @$args != 1;
    $self->usage_error('Dotf supports rex and ansible only.')
      if $args->[0] !~ /rex|ansible/;
}

sub execute {
    my ($self, $opt, $arg) = @_;
    printf("Exporting to: %s.\n", $arg->[0]);
}


1;
