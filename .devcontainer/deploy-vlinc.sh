#! /bin/bash
# echo "$1"

if [ "$1" == "help" ]; then
	echo "syntax: deploy-vlinc <svc> <stage>"
	echo "<svc>: all | sns | lambda | email | user | tenant | reg" 	
	echo "<stage>: sandbox | mxu2"
	exit 0
fi

svc="$1"
# echo "svc = $svc"

if [ "$1" == "all" ] || [ "$1" == "config" ]; then
	echo "Deploying /resources/app-config"
	cd /workspaces/vlncc-backend/resources/app-config
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
fi

if [ "$1" == "all" ] || [ "$1" == "kms" ]; then
	echo "Deploying /resources/kms"
	cd /workspaces/vlncc-backend/resources/kms
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
fi

if [ "$1" == "all" ] || [ "$1" == "iam" ]; then
	echo "Deploying /resources/iam"
	cd /workspaces/vlncc-backend/resources/iam
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
fi

if [ "$1" == "all" ] || [ "$1" == "sns" ]; then
	echo "Deploying /resources/sns"
	cd /workspaces/vlncc-backend/resources/sns
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
fi

if [ "$1" == "all" ] || [ "$1" == "lambda" ]; then
	echo "Deploying /resources/lambda"
	cd /workspaces/vlncc-backend/resources/lambda
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
fi

if [ "$1" == "all" ] || [ "$1" == "email" ]; then
	echo "Deploying email-service"
	cd /workspaces/vlncc-backend/services/email-service
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
fi

if [ "$1" == "all" ] || [ "$1" == "user" ]; then
	echo "Deploying user-mgmt-service"
	cd /workspaces/vlncc-backend/services/user-mgmt-service
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
	cd /workspaces/vlncc-backend/scripts
	# ./deploy-swagger.sh
fi

if [ "$1" == "all" ] || [ "$1" == "tenant" ]; then
	echo "Deploying tenant-mgmt-service"
	cd /workspaces/vlncc-backend/services/tenant-mgmt-service
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
	cd /workspaces/vlncc-backend/scripts
	# ./deploy-swagger.sh
fi

if [ "$1" == "all" ] || [ "$1" == "site" ]; then
	echo "Deploying site-mgmt-service"
	cd /workspaces/vlncc-backend/services/site-mgmt-service
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
	cd /workspaces/vlncc-backend/scripts
	# ./deploy-swagger.sh
fi

if [ "$1" == "all" ] || [ "$1" == "reg" ]; then
	echo "Deploying tenant-registration-service"
	cd /workspaces/vlncc-backend/services/tenant-registration-service
	sls deploy -v --profile viewlinc-sandbox --stage "$2"
	cd /workspaces/vlncc-backend/scripts
	# ./deploy-swagger.sh
fi

cd ~
