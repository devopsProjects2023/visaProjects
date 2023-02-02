#!/bin/bash

<<Guide

"Below is Shell Scripting for crontabs

Invoke a function and use it as needed

You require Sudo access to run Script

Run this script only in Linux Server"

Guide

echo "Enter your Github Personal Access Token"

read patToken

#echo $patToken > token.txt

#cat token.txt

cat ~/.ssh/id_rsa

# if the last command executed properly then proceed with conditions

if [ $? -eq 0 ]

then

echo "SSH key has already been assigned..."

else

echo "SSH keys have not been created... Please create sshkey using ssh-keygen cmd"

ssh-keygen -t rsa

echo "ssh Key successfully generated"

fi

sshKey=`cat ~/.ssh/id_rsa.pub`
#just to checl if it captures the expected file
cat ~/.ssh/id_rsa.pubKey

if [ $? -eq 0 ]

then

echo "Copying the key to Github Account"

curl -X POST -H "Content-type: application/json" -d "{\"title\": \"SSHKEY\",\"key\": \"${sshKey}\"}"

if [$? -eq 0 ]

then

echo "Successfully copied the token to Github"

exit 0

else

echo "Failed"

exit 1

fi

else

echo "Failure in generating the ssh Key"

exit 1

fi
