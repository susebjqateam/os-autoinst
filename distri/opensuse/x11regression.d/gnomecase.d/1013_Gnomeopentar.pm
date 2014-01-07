use base "basetest";
use bmwqemu;
use autotest;

##testcase 4158 1249087 open tar
sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}

##this part contains the steps to run this test
sub run()
{


    #mkdir a directory /tmp/test to save the testing tar file
    my $self=shift;
    x11_start_program("gnome-terminal");
    script_run("/usr/bin/mkdir -p  /tmp/test",3);
    script_run("cd /tmp/test",3);
    script_run("wget http://upload.kruton.de/files/1381905043/e1000e-2.4.14.tar.gz",3);
    sendkey "alt-f4";sleep 2;
    sendkey "alt-f2";sleep 2;


    sendautotype("nautilus /tmp/test");sleep 2;
    sendkey "ret";sleep 2;
    for $i (1..3) { sendkey "tab";sleep 2;}
    sendkey "right";sleep 2;
    sendkey "ret";sleep 2;
    $self->check_screen;sleep 2;
    sendkey "alt-f4";sleep 2;
    sendkey "alt-f4";sleep 2;
    
    #clean up
    x11_start_program("gnome-terminal");
    script_run("/usr/bin/rm -rf /tmp/test",3);sleep 2;
    sendkey "alt-f4";sleep 2;
    sendkey "ret";sleep 2;
}

1;
