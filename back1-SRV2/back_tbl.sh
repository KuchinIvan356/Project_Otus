TABLES=$(mysql -uroot -poTus2024 -N -B -e "SHOW TABLES FROM BASE_OTUS")
mkdir -p BACKUP_BASE_2024
for TABLE in $TABLES; do
    mysqldump -uroot -poTus2024 --set-gtid-purged=OFF --source-data=1 --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers BASE_OTUS $TABLE > BACKUP_BASE_2024/$TABLE.sql;
done
