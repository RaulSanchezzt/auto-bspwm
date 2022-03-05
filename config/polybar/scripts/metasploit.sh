#!/bin/sh

sudo systemctl start postgresql
sudo msfdb init
sudo msfconsole
