#!/bin/bash

#注意python环境是否有冲突
#安装oci cli
sudo dnf -y install oraclelinux-developer-release-el8 && sudo dnf -y install python36-oci-cli

#生成oci cli配置文件，首先在oci console上生成api key
sudo mkdir /root/.oci
sudo bash -c 'cat << EOF > /root/.oci/config
[DEFAULT]
user=ocid1.user.oc1..aaaaaaaa46c2mrkhtdj64uwfn6ojw5hc2onod5p4lfzamf7xvdymydd5itqa
fingerprint=f8:92:a0:4e:08:1c:1f:df:0e:32:7c:75:41:03:52:c7
tenancy=ocid1.tenancy.oc1..aaaaaaaaro7aox2fclu4urtpgsbacnrmjv46e7n4fw3sc2wbq24l7dzf3kba
region=us-ashburn-1
key_file=/home/opc/key.pem
EOF'

#生成密钥
cat << EOF > /home/opc/key.pem
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC0ljWlhs76PBXU
Oynutic97ObuON05hB+ZdDehfYzVGNRtRKbi72rut1jhgmTd2lkVI5DPvmB9zOv7
OXCacVLOjqvk2JeK1bwnSqnknFiz2shR8VvcoNPaSBCzwtfnRhAOWOsagrz/Vb/D
+0pDDEHW5DZJLjZGKynW3Uin7rEN646GZJAjmA2YAluPhsgcJl4xhFWF+OyWsxCC
dIBof1aaMgcP+gpAs7GTa8/QTKZ0fd+J/OrP/GMeOK+I9eqkpgYqAezbDtr7+abj
8AFghX82T+uuFxemLF7O10T3dTu/g7bW66szz/YJaAmnAUn5KxLYJiCVMUKkd/5Z
yxBskSMjAgMBAAECggEANfudJ9EnuEgT4nCZNWHAU1OpKNdY0mO7qnzCUIUef2k/
vzZBiR824QtwB2GaU3N9I8OQ+3kWkSSb+mqOTazIqzSdD/jrPDZuW3SHWu6d2Y3y
SgSTiF2PVvYqAAKj1d/s1s0f4rnoU4/HloddCLP2To3D6JZm5QzsIe3eVU0WImmh
/56MZtROPIF+pcP0zxVbUaAzF/27qNUA1cqcL2kFy1vJNzmLpdc4k10X0ZnRL7kH
DfNH7xn5hrC8ublikPUNwEc1Du5Hh+f6Kupz8mrFNIDP3Tr0MJuHxqR+IObsGy36
RiR3XjeR0iQe0AyxxrfKFQDPGdCjmfKDxxnJUYPjwQKBgQDsQbSm9+MLtPZz2RVF
ZVFcTDKR8sUUOB+a5MVpG6KC5JWYWQrhyNtffddPx3Bm4Zrtczlio8j5dy83WRWW
qCIMAqLKy5nzL8sn9URZCDB279K5nbTOs5cxuFIFubGa6MpRX/ga8x1keN1dZo2v
t8+KK9eAzw37kdRFa4/RcdAbIQKBgQDDrYtjPWQOGBpbAFtXUUIjvXh8XoSKNPzJ
HkJ2psndIDtmnN5DidPEjwFLo5gXrCfdeBjgH4bdaAX8+Fopv6dDMfuVIOj5v+D0
Nkis14TnCrTODAI/mOE/nXL7Z3YFnKOo3SP4i9/EhHs9tsFu5+sHFo7jKqQne052
W6zVe95ZwwKBgQDYACK4XP66H1MMC7dE4SMHraq2gSzqFX3f0bUjKd7kqTSUOySV
1Vur7JPEHuWHSlCpM6WNp40Bd5Q1mD8CpOmr7WUE4Cz6iAHHoJhChhg5RX51sdgy
+0MKdCiZj3Lv3FHNIF7n1MpUp6RL1o1H0FfxTbAT1jpEfMmERpkQtmu7wQKBgE3F
7GDFRb9UVSVWPve1lFQgOoM0DfnglZhaLpB6OkFpTjK6ppyxazn0nM8zdn/yLOYZ
lcl+vlvBvJ+PFkcBpblPZG8hZXfei8qEyN3pyykJWFOM8lfUq7JdIhZKSN5yI5o6
StG+xnGVNmaQ/NDX3NI0ZRZlHFmU6NqiFU/Eq9uBAoGBANSkeg3w7n3rLQZKThGd
ynIa6817FFIQHVj3GQMi3+DbxX7KwsGdUupeG73pMIudjvemP2ct3Y02AEE2s9uX
39A1BpjlcTXNKV5SzogmvVdiPWAAfCjleAnVwwBGDUBwNa1fFMkvvtH5ZJ3hsgRP
oUOFSwDcpZNe7Qfbus9qGrVM
-----END PRIVATE KEY-----
EOF

chmod 400 /home/opc/key.pem
