#!/bin/sh

#The following is a program to replace pacman syntax with that of Fedora's package manager, DNF.
#This is to help save people from having to memorize pacman's complex syntax, and instead learn one that is far easier to understand and remember.
#This was made using the pacman/Rosetta page on the Arch Wiki.  It can be found at https://wiki.archlinux.org/index.php/Pacman/Rosetta
#Apologies if the code is messy.  I am new to shell scripting.  Feel free to improve on it.

case $1 in
    "install")
        pacman -S $2
        ;;
    "remove")
        pacman -Rs $2
        ;;
    "update")
        pacman -Syu
        ;;
    "upgrade")
        pacman -Syu
        ;;
    "distro-sync")
        pacman -Syu
        ;;
    "search")
        pacman -Ss $2
        ;;
    "changelog")
	pacman -Qc $2
	;;
    "clean")
        case $2 in
            "all")
                pacman -Sc
                ;;
            "expire-cache")
                pacman -Sy
                ;;
        esac
        ;;
    "autoremove")
        pacman -Qdtq | pacman -Rs -
        ;;
    "mark")
        case $2 in
            "install")
                pacman -D --asexplicit $2
                ;;
            "remove")
                pacman -S --asdeps $2
                ;;
        esac
        ;;
    "download")
        pacman -Sw $2
        ;;
    "history")
        cat /var/log/pacman.log
        ;;
    
    
    *)
        echo "Sorry, but that feature hasn't been implemented in pnf yet!"
        echo "Check out https://wiki.archlinux.org/index.php/Pacman/Rosetta to find the thing you need."
        ;;
esac
