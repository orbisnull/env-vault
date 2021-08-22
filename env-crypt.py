#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""This is a python script for encrypted environment vars file
for store in external (http) path"""

import argparse
import os
import fs
from fs import open_fs
import gnupg
from getpass import getpass

parser = argparse.ArgumentParser(add_help=True)

parser.add_argument('file', type=str, help='File for encrypt')

args = parser.parse_args()

file = args.file

gpg = gnupg.GPG()


password = getpass('Password:')

with open(file, "rb") as f:
    status = gpg.encrypt_file(f, passphrase=password,
                              symmetric='AES256', output=file + ".gpg", recipients=None)

print ("Encrypted done with password: "+ password)
