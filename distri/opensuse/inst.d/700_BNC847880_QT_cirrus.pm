use base "installstep";
use bmwqemu;

# Only because of kde/qt has a rendering error on i586 in qemu (bnc#847880).
# Remove after QT fixed the bug

sub is_applicable()
{
    my $self = shift;
    return $self->SUPER::is_applicable && $ENV{DESKTOP} eq "kde" && !$ENV{DUALBOOT};
}

sub run()
{
    my $self=shift;
    x11_start_program("xterm");
    become_root();
    sendautotype("echo QT_GRAPHICSSYSTEM=native >> /etc/environment\n");
    sendautotype("exit\n");
    sendautotype("exit\n");
    $self->take_screenshot();
}

1;
