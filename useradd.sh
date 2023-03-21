#!/bin/bash
read -p "Please enter username: " username
read -p "Please enter fullname: " fullname
read -p "Please enter shell: " shell
echo "setting up acount for $username"
uid=`cat /etc/passwd | cut -d : -f3 | sort -n | tail -2 | head -1`
uid=$[ $uid + 1 ]
echo "$username:x:$uid:$uid:$fullname:/home/$username:$shell" >> /etc/passwd
echo "$username:x:$uid:" >> /etc/group
mkdir /home/$username
for i in `ls -a /etc/skel`
do
cp $i /home/$username/$i
done
passwd $username


=====

