#!/bin/sh

[ "${S3_S3V4}" = "yes" ] && aws configure set default.s3.signature_version s3v4

if [ "${SCHEDULE}" = "**None**" ]; then
  sh backup.sh
else
  echo "$SCHEDULE /bin/sh /backup.sh" > /etc/crontabs/root
  exec crond -d 8 -f
fi