use strict;
use warnings;
package Dotf::Command;

# ABSTRACT: base for Dotf commands

use App::Cmd::Setup -command;

=method log

log method

=cut
sub log {
    my ($self, $msg) = @_;
    printf("[log] %s\n", $msg);
}

1;
