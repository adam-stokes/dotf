package Dotf::Role::Remove;
# ABSTRACT: Remove role

use Dotf::Model;
use Path::Tiny;

use Moo::Role;

has model => (
    is      => 'ro',
    default => sub { Dotf::Model->new }
);

sub rm_dotfile {
    my ($self, $files) = @_;
    foreach (@$files) {
        my $path = path($_);
        $path->remove;
        $self->model->remove($path);
    }
    printf("Removed: [%s] dotfile(s).\n", join(',', @$files));
}


1;
