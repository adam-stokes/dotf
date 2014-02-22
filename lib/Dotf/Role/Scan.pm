package Dotf::Role::Scan;
# ABSTRACT: Scan role

use Dotf::Model;
use Path::Tiny;
use IO::Prompt;
use Text::Table;
use DDP;

use Moo::Role;

has model => (
    is      => 'ro',
    default => sub { Dotf::Model->new }
);

has exclude => (is => 'rw', default => sub { });

has cache => (
    is      => 'rw',
    default => sub { [] },
);


=method scan($dir)

C<dir> - Directory to scan

=cut

sub scan {
    my ($self, $dir) = @_;
    my $iter = path($dir)->iterator;
    my $str  = '';
    while (my $next = $iter->()) {
        if (-l $next) {
            if ($self->model->get($next)) {
                $str .= sprintf("%-15s %-40s -> %s\n",
                    "(dotf)", $next, readlink($next));
            }
            else {
                $str .= sprintf("%-15s %-40s -> %s\n",
                    "(unmanaged)", $next, readlink($next));
            }
        }
    }
    print $str;
    # $self->model->add($self->meta);
}

1;
