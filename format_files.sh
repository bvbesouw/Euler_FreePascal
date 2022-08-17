#!/bin/bash

clear
for file in *.pp; do
    echo $file
    ptop -l 255 -c "ptop.cfg" $file $file
#    ptop.exe -l 255 -c "%~dp0\ptop.cfg" "%~dp0\1.pas" "%~dp0\2.pas"
done
