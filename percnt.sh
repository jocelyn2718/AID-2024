#! /bin/bash
file=cpu.log

cd /home/kali
if !(find $file)
then
touch $file
fi
echo -e "$(date +%d/%m/%Y-%H:%M:%S)\t$(hostname -A)\t$(free -m -t | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')" >> $file
 
# awk: concatena comandos
 

