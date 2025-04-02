#!/bin/bash
set -e
echo "====== Начало скрипта"
echo $ENV
if [ $ENV = "DEV" ]; then
	echo "====== Условие DEV выполнено" 
	exec python "identidock.py"
elif [ $ENV = "UNIT" ]; then
	echo "====== Условие UNIT выполнено" 
	exec python "tests.py"
else
	echo "====== Условие НЕ выполнено"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi
