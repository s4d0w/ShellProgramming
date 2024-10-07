
PkgInstall() {
    PKGLIST="$*"
    yum -q -y install $PKGLIST
    [ $? -eq 0 ] \
        && echo "[  OK  ] $PKGLIST 설치 완료" \
        || echo "[ FAIL ] $PKGLIST 설치 실패"
}

RandomIndex() {
    INDEXFILE="$1"
    MESSAGES="$2"
    FILE1=/root/shell/boxlist2
    MAX=$(wc -l < $FILE1)  # MAX=72

    RANDNUM=$(($RANDOM% $MAX+1))

    BOXSTR=$(sed -n "${RANDNUM}p" "$FILE1")
    cat << EOF > "$INDEXFILE"
<pre>
$(echo "$MESSAGES" | boxes -d "$BOXSTR")
</pre>
EOF
}

ServiceStart() {
    SVC="$1"
    systemctl restart "$SVC" >/dev/null 2>&1
    RET=$(systemctl is-active "$SVC")
    if [ "$RET" = 'active' ]; then
        echo "[  OK  ] 정상적으로 $SVC 서비스 실행"
        systemctl enable "$SVC" >/dev/null 2>&1
    else
        echo "[ FAIL ] $SVC 서비스가 실행 실패"
    fi
}

FWRule() {
    RULES="$*"      # http https -> {http,https}
    FWCMD='firewall-cmd --permanent'
    for i in $RULES
    do
        FWCMD="$FWCMD --add-service=${i}"
    done
    $FWCMD >/dev/null 2>&1
    firewall-cmd --reload >/dev/null 2>&1
    echo "[  OK  ] $* 방화벽에 등록 완료"
}

function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}


