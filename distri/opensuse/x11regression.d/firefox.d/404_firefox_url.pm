#!/usr/bin/perl -w

###########################################################
# Test Case:	1248946
# Case Summary: Firefox: Open common URL's in Firefox
# Written by:	wnereiz@github
###########################################################

# Needle Tags:
# firefox-open
# test-firefox_url-novell-1, test-firefox_url-novell-2
# test-firefox_url-wikipedia-1, test-firefox_url-wikipedia-2 
# test-firefox_url-googlemaps-1, test-firefox_url-googlemaps-2

use strict;
use base "basetest";
use bmwqemu;

sub run()
{
    my $self=shift;
    mouse_hide();
    x11_start_program("firefox");
    waitforneedle("start-firefox",5);
    if($ENV{UPGRADE}) { sendkey("alt-d");waitidle; } # Don't check for updated plugins
    if($ENV{DESKTOP}=~/xfce|lxde/i) {
        sendkey "ret"; # Confirm default browser setting popup
        waitidle;
    }
    sendkey "alt-f10"; # Maximize

    # Open the following URL's in firefox and navigate a few links on each site.

    # http://www.novell.com
    sendkey "alt-d"; sleep 1;
    sendautotype "https://www.novell.com\n"; sleep 25;
    checkneedle("test-firefox_url-novell-1",5);

    # Switch to communities and enter the link
    sendkey "apostrophe"; sleep 1; #open quick find (links only)
    sendautotype "communities\n"; sleep 10;
    checkneedle("test-firefox_url-novell-2",5);

    # http://www.wikipedia.org
    sendkey "alt-d"; sleep 1;
    sendautotype "www.wikipedia.org\n"; sleep 10;
    checkneedle("test-firefox_url-wikipedia-1",5);

    # Switch to "Deutsch", enter the link
    sendkey "tab";
    sendkey "tab"; #remove the focus from input box
    sendkey "apostrophe"; sleep 2; #open quick find (links only)
    sendautotype "Deutsch\n";sleep 7;
    checkneedle("test-firefox_url-wikipedia-2",5);

    # http://maps.google.com
    sendkey "alt-d"; sleep 1;
    sendautotype "maps.google.com\n"; sleep 15;
    sendkey "tab"; #remove the focus from input box
    checkneedle("test-firefox_url-googlemaps-1",5); sleep 2;

    # Switch to "SIGN IN", enter the link
    sendkey "apostrophe"; sleep 2;#open quick find (links only)
    sendautotype "sign in\n"; sleep 7;
    checkneedle("test-firefox_url-googlemaps-2",5);

    # Restore and close firefox
    sendkey "alt-f4"; sleep 1; # Exit firefox
    sendkey "ret"; # Confirm "save&quit"
    x11_start_program("rm -rf .mozilla"); # Clear profile directory
    sleep 2;

}

1;
