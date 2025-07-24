#!/bin/bash

#Variables
#create users.csv file & add some usernames & password before using this script -- tested & successfully
file="users.csv"

#check the given file is existing or not
if [[ -f "$file" ]]
then
echo "given file: $file is exists, will start creating users"
else
echo "given file: $file doesn't exist, Please check the location of the file"
fi

#check the given file is existing or not
if [[ ! -f "$file" ]]
then
echo "$file doesn't exist, please check the correct location or spellings"
exit 1
fi

# Initialize counters
total_users=0
existing_users=0
new_users=0

# Skip the header and read CSV line by line
tail -n +2 "$file" | while IFS=',' read -r username password
do
((total_users++))
# Check if user already exists
if id "$username" &>/dev/null 
then
echo "$username is already exist"
((existing_users++))
else
#create user
useradd "$username"
((new_users++))
#set password
echo "$username:$password" | chpasswd
#Message
echo "$username is created successfully"
fi
done

# Summary Output
echo "-----------------------------------------"
echo "📊 User Creation Summary:"
echo "👥 Total usernames processed: $total_users"
echo "🧑‍💻 Existing users skipped:   $existing_users"
echo "🆕 New users created:         $new_users"
echo "-----------------------------------------"
