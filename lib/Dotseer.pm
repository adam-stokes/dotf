use strict;
use warnings;

package Dotseer;
# ABSTRACT: dotfile manager

use App::Cmd::Setup -app;

sub global_opt_spec {
  return(["verbose|v:S@", "verbosity"]);
}

1;
