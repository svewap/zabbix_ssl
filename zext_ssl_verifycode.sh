#! /bin/sh
SERVER=$1
SNI=$3
if [ -z "$2" ]
then
PORT=443;
else
PORT=$2;
fi
EXEC=`openssl s_client -connect $SERVER:$PORT -servername $SNI -verify_hostname $SNI 2>&1 < /dev/null | grep "Verify return code:" | cut -d: -f2 | awk '{$1=$1};1'`

echo ${EXEC}
