Absolutely! Here's a handy list of common Bash test operators used with if [[ ... ]] to check strings, files, directories, and more — especially useful for DevOps scripting like you're doing.

✅ String Operators
Operator	Meaning	Example
-z	True if string is empty	[[ -z "$name" ]]
-n	True if string is not empty	[[ -n "$name" ]]
"$a" == "$b"	True if strings are equal	[[ "$a" == "$b" ]]
"$a" != "$b"	True if strings are not equal	[[ "$a" != "$b" ]]

📁 File Operators
Operator	Meaning	Example
-f	True if it is a regular file	[[ -f file.txt ]]
-d	True if it is a directory	[[ -d /var/log ]]
-e	True if file or directory exists	[[ -e /etc/passwd ]]
-r	True if file is readable	[[ -r file.txt ]]
-w	True if file is writable	[[ -w file.txt ]]
-x	True if file is executable	[[ -x script.sh ]]
-s	True if file is not empty (has size > 0)	[[ -s file.txt ]]
!	Negation (not)	[[ ! -f file.txt ]] means file doesn't exist

🔢 Number Comparison Operators
Operator	Meaning	Example
-eq	Equal to	[[ $a -eq 5 ]]
-ne	Not equal to	[[ $a -ne 5 ]]
-lt	Less than	[[ $a -lt 10 ]]
-le	Less than or equal to	[[ $a -le 10 ]]
-gt	Greater than	[[ $a -gt 10 ]]
-ge	Greater than or equal to	[[ $a -ge 10 ]]

🧠 Useful Combo Examples

if [[ -f "$file" && -r "$file" ]]; then
    echo "File exists and is readable"
fi

if [[ -z "$username" || -z "$password" ]]; then
    echo "Missing user or password"
fi

if [[ ! -d "/opt/scripts" ]]; then
    mkdir /opt/scripts
fi
