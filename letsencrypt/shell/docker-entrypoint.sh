#!/bin/bash

ACTION=$1

function splitStr()
{
    OLD_IFS=${IFS}
    IFS=$2,
    arr=($1)
    IFS=${OLD_IFS}
}

function acmeDomain()
{
    acme.sh --issue --dns ${DNS_PARAM_NAME} -d $1 -d *.$1 --post-hook "/root/shell/exportCert.sh $1" --renew-hook "/root/shell/exportCert.sh $1"
}

case ${DNS_API} in
"aliyun")
    KEY_NAME='Ali_Key'
    SECRET_NAME='Ali_Secret'
    DNS_PARAM_NAME='dns_ali'
    ;;
esac

export ${KEY_NAME}=${API_KEY}
export ${SECRET_NAME}=${API_SECRET}

splitStr ${DOMAINS} ','

for domain in ${arr[*]}
do
    acmeDomain ${domain}
done

# 启用定时任务
crond

if [ ${ACTION} -a ${ACTION} = "start" ]
then
   tail -f /dev/null
fi
