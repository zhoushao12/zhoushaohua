for i in `cat /etc/hosts|awk '{print $2}'`;do scp /etc/hosts $i:/etc/;done
zzz
