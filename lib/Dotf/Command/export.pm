package Dotf::Command::export;

# ABSTRACT: Export to json/yaml
use Dotf -command;

use Moo;
use namespace::clean;

with qw(Dotf::Role::Export);

=head1 SYNOPSIS

    $ dotf export -f|--format yaml

=head1 DESCRIPTION

Exports managed dotfiles for easy backup

=cut

sub abstract {'Export'}

sub usage_desc {'%c %o --format [yaml|json]'}

sub opt_spec {
    return (['format|f=s', 'Export as yaml/json']);
}

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error("Only YAML or JSON supported")
      unless $opt->{format} =~ /yaml|json/i;
}

sub execute {
    my ($self, $opt, $arg) = @_;
    $self->print_yaml if $opt->{format} =~ /yaml/i;
    $self->print_json if $opt->{format} =~ /json/i;
}


1;
