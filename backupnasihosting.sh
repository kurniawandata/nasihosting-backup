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
echo " Version 1.0 Beta 2 - 27/08/2021                                 ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Instalasi                                                       ";
echo " [1]  Backup semua file pengguna nasihosting                     ";
echo " [2]  Backup semua database pengguna nasihosting                 ";
echo " [3]  Backup semua pengguna nasihosting                          ";
echo " [4]  Backup semua file vhost pengguna nasihosting               ";
echo " [5]  Backup semua /var/www/html                                 ";
echo " [6]  Backup semua /etc/apache2/ssl                              ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [7] Exit                                                        ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 7] : " choice;
echo "";
case $choice in

1)  echo -n "Masukkan nama file backup semua pengguna yang diinginkan : "
    read namafile
    tanggal=$(date +%d-%m-%Y)
    tar -zcvf $namafile.$tanggal.tar.gz /home
    ;;   

2)  echo -n "Masukkan nama file backup database yang diinginkan : "
    read namadatabase
    echo -n "Masukkan password root : "
    read passdb
    tanggal=$(date +%d-%m-%Y)
    mysqldump -u root -p$passdb --all-databases > namadatabase.$tanggal.sql
    ;;   

3)  echo -n "Masukkan nama file backup pengguna database yang diinginkan : "
    read namapengguna
    echo -n "Masukkan password root : "
    read passdb
    tanggal=$(date +%d-%m-%Y)
    mysqldump -u root -p$passdb mysql > pengguna.$tanggal.sql
    ;;   

4)  echo -n "Masukkan nama file backup semua vhost nasihosting : "
    read namavhost
    tanggal=$(date +%d-%m-%Y)
    tar -zcvf $namavhost.$tanggal.tar.gz /etc/apache2/sites-available/
    ;;   

5)  echo -n "Masukkan nama file backup semua file /var/www/html : "
    read namafileutama
    tanggal=$(date +%d-%m-%Y)
    tar -zcvf $namafileutama.$tanggal.tar.gz /var/www/html/
    ;;   
 
6)  echo -n "Masukkan nama file backup semua file SSL /etc/apache2/ssl : "
    read namafilessl
    tanggal=$(date +%d-%m-%Y)
    tar -zcvf $namafilessl.$tanggal.tar.gz /etc/apache2/ssl/
    ;;   

7) exit
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
