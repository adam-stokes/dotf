package Dotf::Role::Add;
# ABSTRACT: Add role

use Dotf::Model;
use Path::Tiny;

use Moo::Role;

has model => (
    is      => 'ro',
    default => sub { Dotf::Model->new }
);

sub add_dotfile {
    my ($self, $src, $dst) = @_;
    $src = path($src);
    $dst = path($dst);
    $self->model->add({src => $src->stringify, dst => $dst->stringify});
    symlink($src, $dst) unless $dst->exists;
}


1;
