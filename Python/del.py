#!/usr/bin/env python 
#coding:utf-8
import sys
import os
import time
from threading import Thread
if len(sys.argv) !=2:
        print 'format error! Example:python del.py test.txt'
        sys.exit()
def dellines(lis):
        os.remove(lis)
def main():
    try:
        filename=str(sys.argv[1].strip())
        f=open(filename,"r")
        for i in f.readlines():
                lis=i.strip()
                print lis
                if os.path.exists(lis):
                    t=Thread(target=dellines,args=(lis,))
                    t.start()
                else:
                    print "file not exists"
        f.close()
    except:
        pass
if __name__=="__main__":
        start = time.time()
        main()
        end = time.time()
        print end-start
