#!/bin/bash

# Script for mass creating mailboxes in ISP Manager
# syntax to run ./add_box.sh mailboxes.txt
# 
# mailboxes.txt syntax:
# 	
# username@domainname.tld somepassword
#

{ while IFS=' ' read  mailbox password ; do
	
	domainname=${mailbox##*@} 
	username=${mailbox%@*} 

  /usr/local/mgr5/sbin/mgrctl\
  -m ispmgr email.edit\
  domainname=$domainname\
  greylist=on hidegreylist=on\
  passwd=$password name=$username\
  sok=ok

done ; } < $1
