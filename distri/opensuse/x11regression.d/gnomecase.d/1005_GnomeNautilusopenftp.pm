use base "basetest";
use bmwqemu;

##testcase 4158 1249074 gnome:nautilus opens ftp
##this function decides if the test shall run

sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}

##this part contains the steps to run this test
sub run()
{
    my $self=shift;
    #my $sever=ftp://147.2.207.135,you can change it to your local ftp server,anonymous ,first,make sure your lan is connected
    x11_start_program("nautilus");
    sendkey "ctrl-l";sleep 2;
    sendautotype("ftp://147.2.207.135");
    sendkey "ret";sleep 2;
    $self->check_screen;sleep 2; #anonymous window pops up
    sendkey $cmd{next};sleep 2;
    $self->check_screen;sleep 2;
    sendkey "shift-f10";
    sendkey "up";
    sendkey "up";
    sendkey "ret"; sleep 2;
    sendkey "alt-f4"; sleep 2;
  
    
    
}


1;
