package Dotf::Role::List;
# ABSTRACT: List role

use Dotf::Model;
use Text::Table;
use DateTime::Format::RFC3339;

use Moo::Role;

has model => (
    is      => 'ro',
    default => sub { Dotf::Model->new }
);

has dt => (
    is      => 'ro',
    default => sub { DateTime::Format::RFC3339->new }
);

sub list_dotfiles {
    my $self = shift;
    my @cols = qw(src dst created);
    my $tb   = Text::Table->new(@cols);
    foreach my $k (@{$self->model->all}) {
        $tb->load(
            [   $k->{src}, $k->{dst},
                $self->dt->parse_datetime($k->{created})->strftime("%F")
            ]
        );
    }
    print $tb;

}

1;
