package Dotf::Model;
# ABSTRACT: Dotf Model class

use Moo;
use Mango;
use DateTime;

has 'mgo' => (
    is => 'ro',
    default =>
      sub { Mango->new('mongodb://localhost:27017/dotf') }
);

sub dotfile {
    my $self = shift;
    $self->mgo->db->collection('dotfiles');
}

sub all {
    my $self = shift;
    $self->dotfile->find->all;
}

sub get {
    my ($self, $dst) = @_;
    $self->dotfile->find_one({dst => $dst});
}

sub add {
    my ($self, $attrs) = @_;
    $attrs->{created} = DateTime->now->strftime('%Y-%m-%dT%H:%M:%SZ')
      unless $attrs->{created};
    $self->dotfile->insert($attrs);
}

sub save {
    my ($self, $attrs) = @_;
    $attrs->{modified} = DateTime->now->strftime('%Y-%m-%dT%H:%M:%SZ');
    $self->dotfile->save($attrs);
}

sub remove {
    my ($self, $path) = @_;
    $self->dotfile->remove({dst => $path});
}


1;
