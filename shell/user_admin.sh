#!/bin/bash

# Variable definitions
PASSWD=/etc/passwd


# Function definitions
Menu() {
    cat << EOF

####################################
(관리 목록)
####################################
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
####################################
EOF
}

UserAdd() {
    echo
    echo "(사용자 추가)"
    echo -n "추가할 사용자 이름? : "
    read UNAME

    useradd $UNAME >/dev/null 2>&1
    [ $? -eq 0 ] \
        && echo "[  OK  ] $UNAME 사용자가 정상적으로 추가되었습니다." \
        || echo "[ FAIL ] $UNAME 사용자가 정상적으로 삭제되지 않았습니다."
    echo $UNAME | passwd --stdin $UNAME >/dev/null 2>&1
}

UserVerify() {
    cat << EOF

(사용자 확인)
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' "$PASSWD" | nl)
------------------------------------
EOF
}

UserDel() {
    echo
    echo "(사용자 삭제)"
    echo -n "삭제할 사용자 이름? : "
    read UNAME

    userdel -r $UNAME
    [ $? -eq 0 ] \
        && echo "[  OK  ] $UNAME 사용자가 정상적으로 삭제되었습니다." \
        || echo "[ FAIL ] $UNAME 사용자가 정상적으로 삭제되지 않았습니다."
}

while true
do
    Menu
    echo -n "선택 번호? (1|2|3|4) : "
    read NUM

    case $NUM in
        1) UserAdd    ;;
        2) UserVerify ;;
        3) UserDel    ;;
        4) break      ;;
        *) echo "[ WARN ] 잘못된 번호를 입력 했네용" ;;
    esac
done
