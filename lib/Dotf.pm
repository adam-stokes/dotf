use strict;
use warnings;

package Dotf;
# ABSTRACT: dotfile manager

use App::Cmd::Setup -app;

sub global_opt_spec {
  return(["verbose|v:s@", "verbosity"]);
}

1;
