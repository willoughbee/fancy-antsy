#!/bin/bash

#Pull Kerbrute Binary
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
chmod +x kerbrute_linux_amd64
mv kerbrute_linux_amd64 /opt/kerbrute
ln -s kerbrute /opt/kerbrute

#Pull wordlist
git clone https://github.com/insidetrust/statistically-likely-usernames /opt/statistically-likely-usernames
