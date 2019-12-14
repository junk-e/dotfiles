#!/bin/bash

FONTSDIR=${HOME}/.local/share/fonts

if [[ ! -e ${FONTSDIR}/Myrica.TTC ]]; then
    wget -q -O /tmp/Myrica.zip https://github.com/tomokuni/Myrica/raw/master/product/Myrica.zip
    unzip /tmp/Myrica.zip
    mv Myrica.TTC ${FONTSDIR}/Myrica.TTC
    fc-cache -vf
else
    echo '!!! Myrica.TTC is already installed.'
fi
