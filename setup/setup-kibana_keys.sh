#!/bin/bash

GENERATED_KEYSTORE=/usr/share/kibana/config/kibana.keystore
OUTPUT_KEYSTORE=/secrets/keystore/kibana.keystore

# Tạo Keystore
printf "========== Creating Kibana Keystore ==========\n"
printf "=====================================================\n"

rm /usr/share/kibana/config/kibana.keystore || true

kibana-keystore create >> /dev/null

echo "Setting elasticsearch.serviceAccountToken..."
(echo $KIBANA_SERVICE_ACCOUNT_TOKEN | /kibana-keystore add -x elasticsearch.serviceAccountToken)

mv $GENERATED_KEYSTORE $OUTPUT_KEYSTORE
