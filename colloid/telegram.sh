#!/bin/sh 
telegram_chat_id=*** 
telegram_bot_token=*** 

curl -s -X POST \ https://api.telegram.org/bot"${telegram_bot_token}"/sendPhoto \ -F chat_id=${telegram_chat_id} -F photo="@gnuout.png" \
-F caption="Caption to Photo"
