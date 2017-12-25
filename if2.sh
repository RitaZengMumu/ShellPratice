#!/bin/bash

if [ -e /scripts/if3.sh ]
	then 
    echo the if3.sh is \ `cat /scripts/if3.sh`
else
	echo abc123>if3.sh;
echo "if3.sh has already been created" 
fi
