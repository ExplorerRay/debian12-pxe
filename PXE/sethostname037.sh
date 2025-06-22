#!/bin/bash

nis=$(ip addr | awk '/^2\:/{print substr($2,0,length($2) - 1)}')
read -r newip classroom id<<<$(ip -o -4 addr list $nis | awk '
                {
                        n = split($4, arr, "/");
                        ip = arr[1];
                        n = split(ip, arr, ".");
                        classroom = substr(arr[3], 2, length(arr[3]));
                        # classroom = arr[3];
                        id = arr[4];
                        printf("%s ", ip);
                        printf("3%s ", classroom);
                        printf("%03d", id);
                }
')

classroom="037"
hostname="ec$classroom$id"

sed -i "s/install/$hostname/g" /etc/hostname
sed -i "s/install/$hostname/g" /etc/hosts
sed -i "s/127.0.1.1/$newip/g" /etc/hosts
