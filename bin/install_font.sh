#!/bin/bash

COLREDB="\e[31;1m"
COLBLEB="\e[34;1m"
COLNML="\e[m"
INFO="${COLBLEB}[[INFO]] ${COLNML}"
WARN="${COLREDB}[[WARN]] ${COLNML}"

FONTSDIR=${HOME}/.local/share/fonts
TEMPDIR=${HOME}/.cache/fonts
FONTLIST=()
FONTLIST+=("Myrica" "https://github.com/tomokuni/Myrica/raw/master/product/Myrica.zip")
FONTLIST+=("Mechsuit" "https://dl.dafont.com/dl/?f=mechsuit")

make_dir() {
    echo -e "${INFO}$1 not found."
    echo -e "${INFO}Creating $1 ..."
    mkdir -p $1
    echo -e "${INFO}$1 was created."
}

if [[ ! -d ${FONTSDIR} ]]; then
    make_dir ${FONTSDIR}
fi
if [[ ! -d ${TEMPDIR} ]]; then
    make_dir ${TEMPDIR}
fi

for ((i = 0; i < ${#FONTLIST[@]}; i = i + 2)); do
    DLDIR=${TEMPDIR}/${FONTLIST[i]}
    if [[ ! -d ${DLDIR} ]]; then
        make_dir ${DLDIR}
    fi
    FONTFILE=`ls ${DLDIR} | sed -rn "s:(${FONTLIST[i]})\.([^zip]+)$:\1.\2:p"`
    if [[ ! -f ${FONTSDIR}/${FONTFILE} ]]; then
        echo -e "${INFO}Downloading ${FONTDIR} ..."
        wget -q -O ${DLDIR}/${FONTLIST[i]}.zip ${FONTLIST[i+1]}
        unzip -o ${DLDIR}/${FONTLIST[i]}.zip -d ${DLDIR}
        FONTFILE=`ls ${DLDIR} | sed -rn "s:(${FONTLIST[i]})\.([^zip]+)$:\1.\2:p"`
        mv ${DLDIR}/${FONTFILE} ${FONTSDIR}/${FONTFILE}
        echo -e "${INFO}${FONTFILE} was downloaded"
        echo -e "${INFO}Removing ${DLDIR} ..."
        rm -rf ${DLDIR}
        sleep 1
        echo -e "${INFO}DONE."
        sleep 2
    else
        echo -e "${WARN}${FONTFILE} is already installed."
    fi
done
