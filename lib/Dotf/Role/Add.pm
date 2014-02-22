package Dotf::Role::Add;
# ABSTRACT: Add role

use Moo::Role;
use namespace::clean;
use Dotf::Model;
use Path::Tiny;

has model => (
    is  => 'ro',
    default => sub { Dotf::Model->new }
);

has meta => (
    is      => 'rw',
    default => sub {
        {   src_path => '',
            dst_path => '',
            symlink  => 1
        };
    }
);

sub add_dotfile {
    my $self = shift;
    $self->model->add($self->meta);
}

sub do_link {
    my $self = shift;
    symlink(
        path($self->meta->{src_path})->absolute,
        path($self->meta->{dst_path})->absolute
    ) unless path($self->meta->{dst_path})->exists;
}


1;
