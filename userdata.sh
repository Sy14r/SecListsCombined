#! /bin/bash
apt update && apt upgrade -y && apt install -y binutils
git clone https://github.com/Sy14r/SecListsCombined.git
rm -f SecListsCombined/COMBINED-PASS.txt
chmod +x ./SecListsCombined/build.sh
./SecListsCombined/build.sh