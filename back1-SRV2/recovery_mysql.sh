#!/bin/bash
mysql -uroot -poTus2024 -e "create database BASE_OTUS;"
mysql -uroot -poTus2024 BASE_OTUS < /root/BACKUP_BASE_2024/test_tbl.sql
