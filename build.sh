#!/bin/bash
START_DIR=$PWD

git clone https://github.com/praetorian-code/Hob0Rules.git
cd ./Hob0Rules/wordlists
gunzip *.gz

cd $START_DIR
git clone https://github.com/danielmiessler/SecLists.git
cd $START_DIR/SecLists/Passwords
rm -f ./Leaked-Databases/rockyou*
rm -f ./*/*withcount*
rm -f ./Leaked-Databases/phpbb-cleaned-up.txt
rm -f ./Leaked-Databases/youporn2012-raw.txt
cd /tmp
tar xvf $START_DIR/SecLists/Passwords/SCRABBLE-hackerhouse.tgz
mv /tmp/SCRABBLE/Merriam-Webster-SCRABBLE-4thEdition.txt $START_DIR/SecLists/Passwords/
cd $START_DIR/SecLists/Passwords
cp $START_DIR/Hob0Rules/wordlists/rockyou.txt ./Leaked-Databases/rockyou.txt
cp $START_DIR/Hob0Rules/wordlists/english.txt ./english.txt

# Need to keep the ./SecLists/Passwords/ dir struct in the final repo so that we can calculate stats properly
# Need to add COMBINED-PASS.txt to the root of the repo
cat $(find . -iname "*.txt") | uniq -u > $START_DIR/SecListsCombined/COMBINED-PASS.txt
mv $START_DIR/SecLists/Passwords/ $START_DIR/SecListsCombined/

# At this point SecListsCombined should have the cleaned up info for stat calcs as well as the COMBINED-PASS list
cat $START_DIR/SecListsCombined/COMBINED-PASS.txt | strings | sort | uniq > $START_DIR/SecListsCombined/COMBINED-PASS.txt.uniq
# We're being extra sure to be uniq here...
mv $START_DIR/SecListsCombined/COMBINED-PASS.txt.uniq $START_DIR/SecListsCombined/COMBINED-PASS.txt
cd $START_DIR/SecListsCombined