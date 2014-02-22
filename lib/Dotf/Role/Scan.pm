package Dotf::Role::Scan;
# ABSTRACT: Scan role

use Moo::Role;
use namespace::clean;
use Dotf::Model;
use Path::Tiny;
use IO::Prompt;

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

sub scan {
    my ($self, $dir) = @_;
    my $iter = path($dir)->iterator();
    while ( my $path = $iter->() ) {
      if (-l $path) {
	printf("%s->%s\n", readlink($path), $path);
      }
    }
    # $self->model->add($self->meta);
}

1;
