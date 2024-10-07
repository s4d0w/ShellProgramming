#!/bin/bash

ApacheWebServer() {
    systemctl disable --now nginx >/dev/null 2>&1
    /root/shell/httpd.sh
}

NginxWebServer() {
    systemctl disable --now httpd >/dev/null 2>&1
    /root/shell/nginx.sh
}

Usage() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <httpd|nginx>"
        exit 1
    fi
}

case "$1" in
    'httpd') ApacheWebServer ;;
    'nginx') NginxWebServer  ;;
    *)       Usage           ;;
esac
