# setelah break

# di misatou

iptables -t nat -A POSTROUTING -s 192.233.4.64/29 ! -d 192.233.0.0/16 -o eth0 -j SNAT --to-source 172.31.99.1


# di gendou

iptables -t nat -I POSTROUTING 1 -s 192.233.4.64/29 -o eth0 -j RETURN



# perbaikan di misatou

iptables -t nat -D POSTROUTING -s 192.233.4.64/29 ! -d 192.233.0.0/16 -o eth0 -j SNAT --to-source 172.31.99.1



# perbaikan di gendou

iptables -t nat -D POSTROUTING -s 192.233.4.64/29 -o eth0 -j RETURN


