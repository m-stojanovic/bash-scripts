# Version one with plain text as output
#!/bin/bash

output_file="/data/scripts/splunk/web_monitoring.log"
url_list=("https://example1.com" "https://example2.com" "https://example3.com")

for url in "${url_list[@]}"; do
    response=$(curl -I -s -o /dev/null -w "%{http_code}\n" "$url")
    echo "$url    $response" >> "$output_file"
done


# Version two with JSON as output
#!/bin/bash

output_file="/data/scripts/splunk/web_monitoring.json"
url_list=("https://example1.com" "https://example2.com" "https://example3.com")
# Initialize an empty array to hold the JSON data
json_array=()

# Loop through the list of URLs and get their HTTP response codes
for url in "${url_list[@]}"; do
    response=$(curl -I -s -o /dev/null -w "%{http_code}\n" "$url")
    # Create a JSON object for each URL and append it to the array
    json_array+=("{\"Endpoint\":\"$url\", \"Response\":$response}")
done

# Convert the array into JSON array format
json_output="[$(IFS=,; echo "${json_array[*]}")]"

# Write the JSON output to the file
echo "$json_output" >> "$output_file"

# Version three working at the end, a better one, using "" around response code and {},{},{}
#!/bin/bash

output_file="/data/scripts/splunk/web_monitoring.json"
url_list=("https://example1.com" "https://example2.com" "https://example3.com")

# Initialize an empty array to hold the JSON data
json_array=()

# Loop through the list of URLs and get their HTTP response codes
for url in "${url_list[@]}"; do
    response=$(curl -I -s -o /dev/null -w "%{http_code}\n" "$url")
    # Create a JSON object for each URL and append it to the array
    json_array+=("{\"Endpoint\":\"$url\", \"Response\":\"$response\"}")
done

# Convert the array into JSON array format
json_output="[$(IFS=,; echo "${json_array[*]}")]"

# Write the JSON output to the file
echo "$json_output" > "$output_file"