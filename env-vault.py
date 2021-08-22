#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""This is a python script for get encrypted environment vars
from external (http) path"""

import sys
import pycurl
from io import BytesIO
import argparse
import gnupg
import yaml
from pprint import pprint
from inspect import getmembers

parser = argparse.ArgumentParser(add_help=True)

parser.add_argument("url", type=str, help="Url for vault")

parser.add_argument("-p", "--password", dest="password",
                    type=str, help="Password for decrypt vault")

args = parser.parse_args()

url = args.url

password = args.password


b_obj = BytesIO()

crl = pycurl.Curl()
# Set URL value

crl.setopt(crl.URL, url)

# Write bytes that are utf-8 encoded
crl.setopt(crl.WRITEDATA, b_obj)

# Perform a file transfer
crl.perform()

http_code = crl.getinfo(pycurl.HTTP_CODE)
if http_code != 200:
    sys.stderr.write("Load Error:" + str(http_code) + "\n")
    sys.exit(2)

# End curl session
crl.close()

# Get the content stored in the BytesIO object (in byte characters)
# Decode the bytes stored in get_body to HTML and print the result

raw_data = b_obj.getvalue().decode("utf8")

gpg = gnupg.GPG()

decrypted_data = gpg.decrypt(raw_data, passphrase=password)

# pprint(getmembers(data))

if decrypted_data.ok == False:
    sys.stderr.write("Error in data decription. Message: " +
                     decrypted_data.stderr)
    sys.exit(3)


env_data = yaml.safe_load(decrypted_data.data)


str_list = []
for var in env_data["vars"]:
    # string = '"' + var["name"] + '"' + " " + '"' + var["value"] + '"'
    # string = var["name"] + "," + var["value"]
    string = "export " + '"' + var["name"] + '"="' + var["value"] + '"; '
    str_list.append(string)

print(' '.join(str_list))
