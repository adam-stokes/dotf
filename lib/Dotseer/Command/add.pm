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

sub usage_desc { '%c %o -s <src path> -d <destination path> -l' }

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error("needs -s and -d") if !$opt->{src} or !$opt->{dst};
}

sub opt_spec {
    return (
        ["src|s=s", "source path of dotfile"],
        ["dst|d=s", "destination path of dotfile"],
        [   "nolink|n",
            "do not make this symlink, default is to symlink all dotfiles"
        ]
    );
}


sub execute {
    my ($self, $opt, $arg) = @_;
    $self->meta->{src_path} = $opt->{src};
    $self->meta->{dst_path} = $opt->{dst};
    $self->meta->{symlink}  = 0 if $opt->{nolink};

    $self->add_dotfile;

    $self->do_link;
}


1;
