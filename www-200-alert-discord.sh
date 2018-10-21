#!/bin/sh

WEBHOOK=https://discordapp.com/api/webhooks/474223357550788618/X8p8rR2pnoMA0oZkkAG3Oj272lzIn7ScNHmzIGBgdvi8C0ir2KasZXwmQhp-0SShlTn6

send_curl()
{
  curl --silent -X POST   $WEBHOOK   -H 'Content-Type: application/json'      -H 'cache-control: no-cache'   -d '{
    "content": "ALERT",
    "embeds": [
        {
            "description": "Problem found on https://mammaskallare.se \n200 OK was not returned",
            "color": 16750950
        }
    ]
}'
}

if curl --silent --head https://mammaskallare.se | grep -q "200 OK"
then
  echo -e "$(date '+%F')\tFOUND 200 OK"
  $(send_curl)
else
  echo -e "$(date '+%F')\tNO 200 OK FOUND"
fi
