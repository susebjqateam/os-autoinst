use base "basetest";
use bmwqemu;
use autotest;

##testcase 4158 1249071 gnome: application can be added via seahorse and can be launched automitcally after login(better run this case as the last one,because it will pop up a totem window )
##this function decides if the test shall run

sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}

##this part contains the steps to run this test
sub run()
{
    my $self=shift;
    x11_start_program("gnome-session-properties");
    for $i (1..2) { sendkey "tab";sleep 2;}
    sendkey "ret";sleep 2;
    $self->check_screen;sleep 2;
    sendautotype("banshee");sleep 2;
    sendkey "tab";sleep 2;
    sendautotype("/usr/bin/totem");sleep 2;
    sendkey "ret";sleep 2;
    sendkey "alt-f4";sleep 2;
    sendkey "ctrl-alt-backspace";
    sendkey "ctrl-alt-backspace";
    waitidle;
    sendkey "ret";sleep 2;
    sendautotype "$password";sleep 2;
    sendkey "ret"; sleep 15;
    waitidle;
    $self->check_screen;sleep 2;
    sendkey "alt-f6";sleep 2;
    sendkey "alt-f4";sleep 2;
    
    
    
      
 
}

1;
