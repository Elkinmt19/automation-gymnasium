# !/bin/bash

# Define some important variables
MYSQL_DB_USER=$1
MYSQL_DB_PASSWORD=$2
MYSQL_DB_HOST=$3
DB_NAME=$4

counter=0
data_dir="/tmp/assets"

# Create the register table
mysql -h $MYSQL_DB_HOST -u $MYSQL_DB_USER -p$MYSQL_DB_PASSWORD $DB_NAME \
    -e "CREATE TABLE IF NOT EXISTS register (id INT(3) PRIMARY KEY, name VARCHAR(50), lastname VARCHAR(50), age INT(3));"


while [ $counter -lt 50 ]; do 
    let counter=counter+1

    name=$(nl $data_dir/names.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
    lastname=$(nl $data_dir/names.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
    age=$(shuf -i 20-25 -n 1)

    mysql -h $MYSQL_DB_HOST -u $MYSQL_DB_USER -p$MYSQL_DB_PASSWORD $DB_NAME \
        -e "INSERT INTO register values ($counter, '$name','$lastname',$age)"
    
    echo "$counter, $name $lastname, $age was correctly imported!"
done