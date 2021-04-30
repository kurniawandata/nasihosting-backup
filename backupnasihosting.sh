#!/bin/bash
#Progammer : Kurniawan. kurniawan@xcodetraining.com. xcode.or.id.
#Program ini dapat digunakan untuk personal ataupun komersial.
#X-code Media - xcode.or.id / xcodetraining.com
again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "=================================================================";
echo " Nasihosting backup                                              ";
echo " Progammer : Kurniawan. xcode.or.id                              ";
echo " Version 1.0 Beta 1 - 30/04/2021                                        ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Instalasi                                                       ";
echo " [1]  Backup semua file pengguna nasihosting                     ";
echo " [2]  Backup semua database pengguna nasihosting                 ";
echo " [3]  Backup semua pengguna nasihosting                          ";
echo " [4]  Backup semua file vhost pengguna nasihosting               ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [5] Exit                                                        ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 5] : " choice;
echo "";
case $choice in

1)  echo -n "Masukkan nama file backup semua pengguna yang diinginkan"
    read namafile
    tanggal=$(date +%d-%m-%Y)
    if [ -z "$(ls -A /home/*)" ]; then
    echo "tar -zcvf $namafile.$tanggal.tar.gz /home"
    else
    echo "Folder /home tidak ada"
    fi
    ;;   

2)  echo -n "Masukkan nama file backup database yang diinginkan"
    read namadatabase
    tanggal=$(date +%d-%m-%Y)
    mysqldump -u root -ppasswordroot --all-databases > namadatabase.$tanggal.sql
    ;;   

3)  echo -n "Masukkan nama file backup pengguna database yang diinginkan"
    read namapengguna
    tanggal=$(date +%d-%m-%Y)
    mysqldump -u root -ppasswordroot mysql > pengguna.$tanggal.sql
    ;;   

4)  echo -n "Masukkan nama file backup semua vhost nasihosting"
    read namavhost
    tanggal=$(date +%d-%m-%Y)
    echo "tar -zcvf $namavhost.$tanggal.tar.gz /etc/apache2/sites-available/"
    ;;   

5) exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Nasihosting backup (Ubuntu Server)"
echo "Oleh Kurniawan. xcode.or.id. E-mail : kurniawanajazenfone@gmail.com"
echo ""
echo -n "Kembali ke menu? [y/n]: ";
read again;
while [[ $again != 'Y' ]] && [[ $again != 'y' ]] && [[ $again != 'N' ]] && [[ $again != 'n' ]];
do
echo "Masukkan yang anda pilih tidak ada di menu";
echo -n "Kembali ke menu? [y/n]: ";
read again;
done
done
