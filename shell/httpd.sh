#!/bin/bash

set -e

#############################################
# 1) 패키지 설치 - httpd, mod_ssl
# 2) 웹서비스 설정 - /var/www/html/index.html
# 3) 웹서비스 기동 - httpd.service
# 4) 방화벽에 등록 - http, https
#############################################

#
# The file(funtions.sh) load
#
. /root/shell/functions.sh

#
# Main function
#

# 1) 패키지 설치 - httpd, mod_ssl
echo ; echo "[Phase 01] 패키지 설치"
PkgInstall httpd mod_ssl

# 2) 웹서비스 설정 - /var/www/html/index.html
echo ; echo "[Phase 02] 웹서비스 설정"
RandomIndex "/var/www/html/index.html" "My HTTPS Web Server"
echo "[  OK  ] 랜덤 웹페이지가 정상적으로 생성되었습니다."

# 3) 웹서비스 기동 - httpd.service
echo ; echo "[Phase 03] 웹서비스 기동"
ServiceStart httpd.service

# 4) 방화벽에 등록 - http, https
echo ; echo "[Phase 04] 방화벽 등록"
FWRule http https
