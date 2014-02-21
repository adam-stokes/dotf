package Dotseer::Command::add;

# ABSTRACT: Add dotfile to manage

use Moo;
use namespace::clean;

use Dotseer -command;
with qw(Dotseer::Role::Add);

=head1 SYNOPSIS

Add dotfile to manage

    dotseer add git-repo/dotfiles/zshrc

=cut

sub abstract {'Add dotfile to manage'}

sub usage_desc { '%c %o <dotfile>' }

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error('dotseer add <file> only.') if @$args != 1;
  }

sub execute {
    my ($self, $opt, $arg) = @_;
    printf("Now managing: %s.\n", $arg->[0]);
  }


1;
