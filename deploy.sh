#! /bin/sh

JSON="{\"cluster\":\"$CI_BRANCH\",\"service\":\"$CI_REPO_NAME\",\"image_tag\":\"$CI_COMMIT_ID.$CI_TIMESTAMP\"}"
RESULT=$(aws lambda invoke --function-name tk-ecs-deployment --log-type Tail output --payload $JSON)

STATUS=$(cat output | jq 'keys[0]')

if [ $STATUS = '"successMessage"' ]; then
  echo "Successful deployment"
  exit 0
elif [ $STATUS = '"errorMessage"' ]; then
  echo "Aborting deployment"
  exit 1
else
  echo "Abort!"
  exit 1
fi

