use base "basetest";
use bmwqemu;
use autotest;

##testcase 4158 1249070 change permission


sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}

##this part contains the steps to run this test
sub run()
{
    my $self=shift;
    mouse_hide(1);
    x11_start_program("gnome-terminal");

    script_run("/usr/bin/mkdir -p  /tmp/test",3);
    script_run("cd /tmp/test",3);
    script_run("wget http://upload.kruton.de/files/1384738098/permisson",3);
    script_run("/usr/bin/chown $username permisson");
    sendkey "alt-f4";sleep 2;
    sendkey "ret";sleep 2;
    sendkey "alt-f2";sleep 2;
    sendautotype("nautilus /tmp/test");sleep 2;
    sendkey "ret";sleep 2;
    for $i (1..3) { sendkey "tab";sleep 2;}

    sendkey "right";sleep 2;
    sendkey "shift-f10";sleep 2;
    sendkey "up";sleep 2;
    sendkey "ret";sleep 5;
    sendkey "shift-tab";
    sendkey "shift-tab";
    sendkey "right";sleep 2;
    $self->check_screen;sleep 2;
    sendkey "down";sleep 1;
    sendkey "down";sleep 1;
    sendkey "ret";sleep 1;
    sendkey "down";sleep 1;
    sendkey "ret";sleep 1;
    sendkey "alt-f4";sleep 2;
    sendkey "alt-f4";sleep 2;
    mouse_hide(1);
    x11_start_program("gnome-terminal");
    script_run("ls -al /tmp/test/permisson");sleep 2;
    $self->check_screen;
    script_run("/usr/bin/rm -rf /tmp/test",3);sleep 2;
    sendkey "alt-f4";sleep 2;
}

1;
