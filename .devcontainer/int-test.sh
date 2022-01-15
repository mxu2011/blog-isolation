#! /bin/bash
# echo "$1"

if [ "$1" == "help" ]; then
	echo "syntax: int-test <stage>"
	echo "<stage>: sandbox | mxu3"
	exit 0
fi

eval `aws-auth-helper viewlinc-sandbox` TARGET_ENV="$1" TARGET_REGION=us-west-2 npm run test:int