#!/bin/bash

echo "=== Verificando Plan de ZAP AF ==="

docker run --rm \
  -v $(pwd):/zap/wrk/:rw \
  -t zaproxy/zap-stable \
  zap.sh \
  -cmd \
  -autorun /zap/wrk/.zap/zap-plan.yml
