package Dotf::Role::Export;
# ABSTRACT: Export role

use Dotf::Model;
use YAML qw(Dump Load);
use JSON -convert_blessed_universally;
use Moo::Role;

has model => (
    is      => 'ro',
    default => sub { Dotf::Model->new }
);

sub print_yaml {
    my $self = shift;
    print Dump(@{$self->model->all});
}

sub print_json {
    my $self = shift;
    my $json = JSON->new->allow_nonref->allow_blessed->convert_blessed;
    print $json->pretty->encode($self->model->all);
}

1;
