#!/bin/bash

#This script creates new local user accounts
if [[ “${UID}” -ne 0 ]]
Then
echo ‘Please append sudo to this comment or run as root user’
exit 1
fi

# Create a username
read -p ‘Enter a username: ‘ USERNAME

# Enter full name
read -p ‘Enter users full name: ‘ REALNAME

# Enter the creation date of this user account
read -p ‘Enter today’s date: ‘ DATE 

# Create a password minimum of 6 characters
read -p ‘Enter a password of at least 6 characters: ‘ PASSWORD

#Configure account

useradd -c “${REALNAME}” -m ${USERNAME}

#Set users password
Echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Expire one time use password
Passwd -e ${USERNAME}
