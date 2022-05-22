#!/usr/bin/python3
import os
import requests
import sys
import urllib.parse

req = requests.session()
common_req = ["1+1", "2-2", "3*2"]
common_res = ["2", "0", "6"]
attack_req = ["system(\"whoami\")"]
attack_res = ["www-data\nwww-data"]

#COMMON_REQUESTS
for _ in range(len(common_req)):
	res = req.get("http://0.0.0.0/index.php?exp=" + urllib.parse.quote(common_req[_]))
	if urllib.parse.quote(common_res[_]) != urllib.parse.quote(res.text):
		print("HTTP Response Code: " + str(res.status_code))
		print("Request Data: " + urllib.parse.quote(common_req[_]))
		print("Expected Response: " +  urllib.parse.quote(common_res[_]))
		print("Actual Response: " + urllib.parse.quote(res.text))
		exit()

#ATTACK_REQUESTS
for _ in range(len(attack_req)):
	res = req.get("http://0.0.0.0/index.php?exp=" + urllib.parse.quote(attack_req[_]))
	if urllib.parse.quote(attack_res[_]) == urllib.parse.quote(res.text):
		print("HTTP Response Code: " + str(res.status_code))
		print("Request Data: " + urllib.parse.quote(attack_req[_]))
		print("Expected Non-Response: " +  urllib.parse.quote(attack_res[_]))
		print("Actual Response: " + urllib.parse.quote(res.text))
		exit()

os.setuid(0)
flag = open("/flag", "r").read()
print(flag)