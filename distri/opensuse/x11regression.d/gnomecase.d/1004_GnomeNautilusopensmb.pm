use base "basetest";
use bmwqemu;

##testcase 4158 1249073 gnome:nautilus open window shares smb
##this function decides if the test shall run

sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}

##this part contains the steps to run this test
sub run()
{
    my $self=shift;
    #my $server="smb://147.2.207.135",you can change it to your local server,first,make sure your lan is connected
    x11_start_program("nautilus");
    sendkey "ctrl-l";sleep 2;
    sendautotype("smb://147.2.207.135");
    sendkey "ret";sleep 10;
    $self->check_screen;sleep 2;
    for $i (1..3) { sendkey "tab" ;sleep 2;
     }
     
    sendkey "right";sleep 2;
    sendkey "ret";sleep 10;
    $self->check_screen;sleep 2;
    sendkey "shift-f10";
    sendkey "up";
    sendkey "up";
    sendkey "ret"; sleep 2;
    sendkey "alt-f4"; sleep 2;

    
    
}

1;
