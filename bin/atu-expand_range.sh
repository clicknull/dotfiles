#!/bin/bash    
    if [[ -z $1 ]]; then
    	cat <<USAGE
$(basename ${0})
Expands nmap compatible ranges to list of individual IPs

Usage: $(basename ${0}) <NetworkRange>

Example:
  $(basename ${0}) 10.0.0-255.1-254
  $(basename ${0}) 1.1.1.1/24
  $(basename ${0}) subnets.txt
USAGE
    elif [[ -f "$1" ]]; then
      nmap -sL -n -iL ${1} | grep 'Nmap scan' | cut -d ' ' -f 5
    else
      nmap -sL -n ${1} | grep 'Nmap scan' | cut -d ' ' -f 5
    fi;
