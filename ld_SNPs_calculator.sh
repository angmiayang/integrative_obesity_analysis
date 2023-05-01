### ### ### ### ### ### ### ### ### ### 
# This Bash script calculates LD (linkage disequilibrium) SNPs from a list of input SNPs.
# It reads each SNP ID from the snpList.txt file.
# For each SNP ID, it uses the wget command to download the JSON data containing LD information.
# The downloaded data is saved as snpID.json, where snpID is the corresponding ID for each SNP.
# Make sure to have a file named snpList.txt in the same directory as the script.
# Ensure that snpList.txt contains one SNP ID per line.
# The script iterates through each line of snpList.txt.
# For each SNP ID, it constructs the appropriate URL.
# The script then downloads the JSON data using wget.
# The JSON data is downloaded for further analysis of LD SNPs.
### ### ### ### ### ### ### ### ### ### 


#!/bin/bash

while IFS= read -r snpID
do
    url="https://grch37.rest.ensembl.org/ld/human/$snpID/1000GENOMES:phase_3:CEU?content-type=application/json;window_size=500;r2=0.9;attribs=yes"
    
    wget --header='Content-type:application/json' "$url" -O "$snpID.json"
done < snpList.txt
