#!/bin/bash

check_hashes() {
    echo "Hash for the password you entered"
	echo $password
	echo
	echo "Hash that was stored in the program"
	echo $storedPassword
  if [ "$password" == "$storedPassword" ] 
  then
    funcResult="0"
  else
    funcResult="1"
  fi
  
}

echo "SHA256 account system example"

while true
do  
  # (1) prompt user, and read command line argument
  echo
  read -p "Type [login] or [signup] to continue: " answer

  # (2) handle the input we were given
  case $answer in
   login ) echo "Please enter your username and password to continue."
	   read -p "Username: " username
	   read -p "Password: " password 
	   password=$( echo $password | sha256sum )
	   match="0"
	   clear
	   check_hashes
	   echo
	   if [ "$match" == "$funcResult" ]
	   then
	     echo "Hashes match"
       else
  	     echo "Hashes don't match!"
	   fi 
           break;;

   signup )echo "Please enter your new username and password to continue."
	   read -p "Username: " username
	   read -p "Password: " password 
	   storedPassword=$( echo $password | sha256sum )
	   echo "Your hashed password is: " 
	   echo $storedPassword
	   ;;

   * )     echo "Dude, just enter [login] or [signup], please.";;
  esac
done

