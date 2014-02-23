use strict;
use warnings;

package Dotf;
# ABSTRACT: dotfile manager

use App::Cmd::Setup -app;

sub global_opt_spec {
  return(["verbose|v:s@", "verbosity"]);
}

1;

__END__

=head2 Running

=head3 Adding files to dotf

$ dotf add -s ~/CFG/zshrc -d ~/.zshrc

This adds the destination B<~/.zshrc> to dotf to be managed and symlinked.

=head3 Scanning

$ dotf scan -d $HOME

This scan all known symlinks and reports on which ones are managed by dotf

=head3 Exporting

$ dotf export -f json

Exports all managed dotfiles to json for use in other applications/workflows.

=head3 Removing

$ dotf rm ~/.zshrc

Unmanages and unlinks the destination from dotf and the filesystem.

=head2 What's Next

=over 8

=item Add support for exporting to ansible playbooks, puppet modules, and rex.

=item Support merging, updating, and revisions via git.

=item A rex plugin for easily keeping your dotfiles insync across multiple systems.

=back

=cut
