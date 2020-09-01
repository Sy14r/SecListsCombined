#! /bin/bash
apt update && apt upgrade -y
git clone https://github.com/Sy14r/SecListsCombined.git
chmod +x ./SecListsCombined/build.sh
./SecListsCombined/build.sh