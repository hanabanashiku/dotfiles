#!/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    bash "$(dirname "$0")/boostrap/macos.sh"
elif command -v apt > /dev/null 2>&1; then
    bash "$(dirname "$0")/bootstrap/debian.sh"
elif command -v microdnf > /dev/null 2>&1; then
    bash "$(dirname "$0")/bootstrap/rhel.sh"
else
    echo "Unsupported system"
    return -1
fi