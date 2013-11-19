use base "basetest";
use bmwqemu;

##testcase 4158 1249072 gnome:nautilus displays icon for all items

sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}


##this part contains the steps to run this test
sub run()
{
    my $self=shift;
    x11_start_program("nautilus"); sleep 2;  ##launch nautilus application
    $self->check_screen;sleep 2; ##make sure the application launched
    sendkey "alt-f10";sleep 2;
    sendkey "ctrl-h";sleep 4;  ##display all the files
    $self->check_screen;sleep 2; ##make sure all the files displayed
    sendkey "alt-f4"; sleep 2; ##close the application 
    
    
    
}

1;
