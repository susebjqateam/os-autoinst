use base "basetest";
use bmwqemu;
use autotest;

#testcase 4158-1249068 copy file with nautilus copy

sub is_applicable
{
     return($ENV{DESKTOP} eq "gnome");
}

#this part contains the steps to run this test
sub run()
{
    #create a temporary /tmp/openqatest dir 
    my $self=shift;
    x11_start_program("nautilus");
    sendkey "ctrl-l";sleep 2;
    sendautotype("/tmp");sleep 2;
    sendkey "ret";sleep 2;
    sendkey "shift-f10";sleep 5;
    sendkey "w";sleep 2;
    sendkey "f";sleep 2;
    sendautotype("openqatest");sleep 2;
    sendkey "ret";
    sendkey "ret";
    
    #create a,b dir 
    sendkey "shift-f10";sleep 5;
    sendkey "w";sleep 2;
    sendkey "f";sleep 2;
    sendautotype("a");sleep 2;
    sendkey "ret";sleep 2;
    sendkey "ctrl-shift-i";sleep 2;
    sendkey "shift-f10";sleep 5;
    sendkey "w";sleep 2;
    sendkey "f";sleep 2;
    sendautotype("b");sleep 2;
    sendkey "ret";sleep 2;
    sendkey "ret";sleep 2;
    
    #under b dir,create a test file "file1" 
    x11_start_program("gnome-terminal");
    script_run("cd /tmp/openqatest/b;/usr/bin/touch file1;/usr/bin/chmod 777 file1");sleep 2;
    sendkey "alt-f4";sleep 2;

    #copy b/file1 to a/file1
    sendkey "down";sleep 2;
    sendkey "ctrl-c";sleep 2;
    sendkey "alt-left";sleep 2;
    sendkey "left";sleep 2;
    sendkey "ret";sleep 2;
    sendkey "ctrl-v";sleep 2;
    $self->check_screen;   #to make sure file1 was alredy copy to a dir
    sendkey"alt-f4";sleep 2;
    
    #clean up    
    x11_start_program("gnome-terminal");
    script_run("/usr/bin/rm -rf /tmp/openqatest",3);sleep 2;
    sendkey "alt-f4";sleep 2;
  
}
 
1;
