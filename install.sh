#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    bash boostrap/macos.sh
elif command -v apt > /dev/null 2>&1; then
    bash bootstrap/debian.sh
elif command -v microdnf > /dev/null 2>&1; then
    bash bootstrap/rhel.sh
else
    echo "Unsupported system"
    return -1
fi