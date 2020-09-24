#!/bin/sh
set -e

REPO=$(echo ${GITHUB_REPOSITORY} | sed 's|^[^/]*/||')

echo "Setting up s3cmd config..."

sed -e "s|\[\[access_key\]\]|${SPACE_ACCESS_KEY}|" -e "s|\[\[secret_key\]\]|${SPACE_SECRET_KEY}|" -e "s|\[\[region\]\]|${SPACE_REGION}|" /root/.s3cfg.temp > /github/home/.s3cfg
s3cmd sync ${SOURCE_DIR} --delete-removed s3://${SPACE_NAME}/${REPO}/ --progress --no-preserve --acl-public
