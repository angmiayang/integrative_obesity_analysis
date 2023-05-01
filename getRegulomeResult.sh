######################################################################
# This is a Bash script to download JSON data for SNP regions from a list of SNPs.
# It reads each line from the snps.list file, which contains SNP ID, chromosome (chr),
# start position, and stop position values separated by tab.
# For each set of values, it constructs the URL to download JSON data for the corresponding SNP region.
# The downloaded JSON data is saved as snpID.json, where snpID is the corresponding SNP ID.
######################################################################


#!/bin/bash

while IFS= read -r line
do
    snpID=$(echo "$line" | awk '{print $1}')
    chr=$(echo "$line" | awk '{print $2}')
    start=$(echo "$line" | awk '{print $3}')
    stop=$(echo "$line" | awk '{print $4}')
    
    url="https://regulomedb.org/regulome-search/?regions=$chr:$start-$stop&genome=GRCh37&format=json"
    
    wget --header='Content-type:application/json' "$url" -O "$snpID.json"
done < snps.list
