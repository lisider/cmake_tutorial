#########################################################################
# File Name: do.sh
# Author: SuWeishuai
# mail: suwsl@foxmail.com
# Created Time: Mon 16 May 2022 07:14:12 PM CST
# Version : 1.0
# Locate  : git@gitee.com:suweishuai/script4use.git
# Origin Name : command_distribution.sh
#########################################################################
#!/bin/bash

Xxx(){
    echo func  :${FUNCNAME}
    echo argc  :$#
    let i=0
    while [ $# != 0 ]
    do
        echo -e argv[${i}] $1
        let i=i+1
        shift
    done
}

Yyy(){
    echo dump stack :
    echo ${FUNCNAME[@]} | xargs -n 1 | while read line
    do
        echo ${line}
    done
}

Build(){
    [ -e build ] || mkdir build
    cd build
    cmake .. && make
}

Clean(){
    rm build -rf
}



##########################################################
##########################################################


Usage(){
    echo Usage :
    cat ${CURRENT_SCRIPT}               \
        | grep "(){"                    \
        | grep -v "^ "                  \
        | egrep -v  "Usage|Main"        \
        | awk -F "(" '{print $1}'       \
        | while read line
    do
        echo -e '\t' ${CURRENT_SCRIPT} ${line}
    done
    exit -1
}

Main(){

    CURRENT_SCRIPT=$0
    OBJ=$1

    if [ $# == 0 ];then
        Usage
    fi

    [ ${OBJ} == help ] && Usage

    cat ${CURRENT_SCRIPT}               \
        | grep "(){"                    \
        | grep -v "^ "                  \
        | egrep -v  "Usage|Main"        \
        | grep -w ${OBJ} > /dev/null
    if [ $? -eq 0 ];then
        shift
        start_time=$(date +%s)
        ${OBJ} $*
        end_time=$(date +%s)
        cost_time=$[ $end_time-$start_time ]
        echo "cost time is $(($cost_time/60))min $(($cost_time%60))s"
    else
        echo ${OBJ} : NOT DEFINED
        Usage
    fi
}

Main $*
