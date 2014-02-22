package Dotf::Role::List;
# ABSTRACT: List role

use Moo::Role;
use namespace::clean;
use Dotf::Model;
use Text::Table;

has model => (
    is      => 'ro',
    default => sub { Dotf::Model->new }
);

sub list_dotfiles {
    my $self = shift;
    my @cols = qw(src dst created);
    my $tb = Text::Table->new(@cols);
    foreach my $k (@{$self->model->all}) {
      $tb->load([$k->{src_path}, $k->{dst_path}, $k->{created}]);
    }
    print $tb;

}

1;
