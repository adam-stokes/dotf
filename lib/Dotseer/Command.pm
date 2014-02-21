use strict;
use warnings;
package Dotseer::Command;

# ABSTRACT: base for dotseer commands

use App::Cmd::Setup -command;

=method log

log method

=cut
sub log {
    my ($self, $msg) = @_;
    printf("[log] %s\n", $msg);
}

1;
