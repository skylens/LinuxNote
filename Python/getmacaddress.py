# -*- coding: utf-8 -*-

from scapy.all import *
import csv
import optparse
import time
def Ip_Mac(host):
    try:
        ans,unans=srp(Ether(dst="ff:ff:ff:ff:ff:ff")/ARP(pdst=host),timeout=2,verbose=False)  #发送ARP请求包,verbose=False的话，就不显示发包信息
    except Exception as e:
        print("异常对象的类型是:%s"%type(e))
        print("异常对象的内容是：%s"%e)
    else:
        try:
            with open("ip.csv","w",newline="") as f:
                 csv_writer=csv.writer(f)
                 csv_writer.writerow(('IP','MAC'))
                 for send,rec in ans:
                     ip_mac=rec.sprintf("{ARP:%ARP.psrc%-%Ether.src%}")   #将包按照固定的格式打印
                     print(ip_mac)
                     mac=ip_mac.split("-")          #去除中间的 - ，返回元组型数据
                     csv_writer.writerow(mac)       #将元组写入到文件中
        except Exception as e:
             print("异常对象的类型是:%s"%type(e))
             print("异常对象的内容是：%s"%e)
        finally:
            f.close()
def main():
    usage="python %proc -H 192.168.10.10 / 192.168.10.0/24"
    parser=optparse.OptionParser(usage)
    parser.add_option('-H',dest='Hosts',type='string',help='target hosts')
    (options,args)=parser.parse_args()
    Hosts=options.Hosts
    if Hosts==None:
        print(parser.usage)
        exit(0)
    else:
        Ip_Mac(Hosts)
main()
