package Dotf::Command::rm;

# ABSTRACT: Remove a managed dotfile

use Dotf -command;
use IO::Prompt;

use Moo;
use namespace::clean;

with qw(Dotf::Role::Remove);

=head1 SYNOPSIS

Add dotfile to manage

    $ dotf rm ~/.zshrc

=head1 DESCRIPTION

Removes dotfiles managed by dotf

=cut

sub abstract {'Remove a managed dotfile'}

sub usage_desc { '%c %o rm -d <file path>' }

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error("needs one or more files to unmanage") unless @$args >= 1;
}

sub execute {
    my ($self, $opt, $args) = @_;
    my $ans =
      prompt(sprintf("Remove (%s)? [y/n] ", join(',', @$args)), -tyn);
    if ($ans) {
        $self->rm_dotfile($args);
    }
    else {
        printf("Please re-run with at least 1 file.\n");
        exit 1;
    }
}

1;
