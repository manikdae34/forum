#!/bin/sh

ssh dae@100.42.73.236 <<EOF
  cd forum
  git pull
  source /opt/envs/forum/bin/activate
  pip install -r requirements.txt
  ./manage.py makemigrations
  ./manage.py migrate  --run-syncdb
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
