# !/bin/bash

# Define the varibles
BUCKET_NAME=$1
ACCESS_KEY=$2
SECRET_KEY=$3
MYSQL_DB_USER=$4
MYSQL_DB_PASSWORD=$5
BUCKET_HOST=$6
MYSQL_DB_HOST=$7
DB_NAME=$8

# Configure the MinIO client
mc alias set myminio http://$BUCKET_HOST:9000 $ACCESS_KEY $SECRET_KEY

# Create the bucket if it doesn't exist
mc mb --ignore-existing myminio/$BUCKET_NAME

# Make the mysql backup
echo "Generating the backup of the MySQL database..."
backup_file_name=mysql_db_$(date --iso-8601=hours).sql
mysqldump -h $MYSQL_DB_HOST -u $MYSQL_DB_USER -p$MYSQL_DB_PASSWORD $DB_NAME > /tmp/$backup_file_name

# Upload the backup file to the MinIO bucket
mc mv /tmp/$backup_file_name myminio/$BUCKET_NAME/
echo "The backup and upload processes have been executed successfully!"