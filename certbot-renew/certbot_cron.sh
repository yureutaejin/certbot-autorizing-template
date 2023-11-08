#!/bin/bash
#######################
# certbot renew cron with force option
# author : yureutae
#######################
# Initialize an empty array to hold the certificate names
declare -a cert_names

# Run certbot certificates and process the output
while IFS= read -r line; do
    # Look for lines containing "Certificate Name"
    if [[ $line == *"Certificate Name:"* ]]; then
        # Extract the certificate name using cut
        name=$(echo "$line" | cut -d ':' -f 2 | xargs)
        # Add the trimmed certificate name to the array
        cert_names+=("$name")
    fi
done < <(sudo certbot certificates)

# Print all certificate names
echo "Certificate Names:"
printf "%s\n" "${cert_names[@]}"

nowdate=$(date +"%Y-%m-%d %H:%M:%S")
sudo certbot renew --cert-name ${cert_names[@]} --force-renewal
echo "${nowdate} try certbot force renewal:" >> certbot_cron_log.log