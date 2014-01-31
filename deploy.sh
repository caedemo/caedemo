#!/bin/bash

# add all files
echo "Staging all changes"
git add . &> ../deploy.log

# commit
echo "Creating an auto commit"
git commit -m 'auto commit' &> ../deploy.log

# push
echo "Pushing to GitHub"
git push origin master &> ../deploy.log

# wait a few seconds for 
echo "Sleeping for 5 seconds to wait for changes to be available on GitHub"
sleep 5

echo "Pulling changes to AWS"

# pull changes to aws
# and restart nginx
ssh ubuntu@54.84.82.146 "cd ~/sites/caedemo; git pull origin master" &> ../deploy.log

echo "Restarting nginx on AWS"

ssh ubuntu@54.84.82.146 "sudo service nginx restart" &> ../deploy.log

echo "Done!"