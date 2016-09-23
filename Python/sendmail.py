#############################################################################
# File Name: sendmail.py
#=============================================================================
#!/usr/bin/env python
#coding=utf-8

import smtplib
import string

HOST = "smtp.qq.com"
SUBJECT = "Test email from Python"
TO = "receiveaccount@qq.com"
FROM = "sendaccount@qq.com"
text = "Python rules them all!"
BODY = String.join((
	"From: %s" % FROM,
	"To: %s" % TO,
	"Subject: %s" % SUBJECT,
	"",
	text
	), "\r\n")
server = smtplib.SMTP()
server.connect(HOST,"25")
server.starttls()
server.login("sendaccount@qq.com","password")
server.sendmail(FROM, [TO], BODY)
server.quit

