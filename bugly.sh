#!/bin/sh

BUGLY_ID="***"
BUGLY_KEY="***"
BUNDLE_ID="com.example.enterprise"
CHANNEL="enterprise"

FILE_PATH=$1
FILE_NAME=$(basename $FILE_PATH)

curl -k "https://api.bugly.qq.com/openapi/file/upload/symbol?app_key=$BUGLY_KEY&app_id=$BUGLY_ID" --form "api_version=1" --form "app_id=$BUGLY_ID" --form "app_key=$BUGLY_KEY" --form "symbolType=2"  --form "bundleId=$BUNDLE_ID" --form "productVersion=1.0" --form "channel=$CHANNEL" --form "fileName=$FILE_NAME" --form "file=@$FILE_PATH"