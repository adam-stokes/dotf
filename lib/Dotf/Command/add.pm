package Dotf::Command::add;

# ABSTRACT: Add dotfile to manage

use Dotf -command;
use IO::Prompt;

use Moo;
use namespace::clean;

with qw(Dotf::Role::Add);

=head1 SYNOPSIS

Add dotfile to manage

    $ dotf add -s ~/dotfiles/zshrc -d ~/.zshrc

=cut

sub abstract {'Add dotfile to manage'}

sub usage_desc { '%c %o -s <src path> -d <destination path>' }

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error("needs -s and -d") unless $opt->{src} and $opt->{dst};
}

sub opt_spec {
    return (
        ["src|s=s", "source path of dotfile"],
        ["dst|d=s", "destination path of dotfile"],
    );
}


sub execute {
    my ($self, $opt, $arg) = @_;
    my $ans =
      prompt(sprintf("Is (%s -> %s) correct? [y/n] ", $opt->{src}, $opt->{dst}), -tyn);
    if ($ans) {
        $self->add_dotfile($opt->{src}, $opt->{dst}, 1);
    }
    else {
        printf("Please re-run with correct paths\n.");
        exit 1;
    }
}

1;
