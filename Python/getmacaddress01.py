# -*- coding: utf-8 -*-

##列出给定网段的主机的MAC地址表
import nmap
import optparse
import time
import csv


def ListMac(hosts):
    nm = nmap.PortScanner()
    nm.scan(hosts)
    targets = []
    for t in nm.all_hosts():
        if nm[t]['status']['state'] == "up":
            mac = nm[t]['addresses']['mac']
            print("ip: %s  mac: %s" % (t, mac))
            targets.append((t, mac))
        else:
            pass
    return targets


def main():
    usage = "python %proc -H 192.168.10.10-20"
    parser = optparse.OptionParser(usage)
    parser.add_option('-H', dest='Hosts', type='string', help='target hosts')
    (options, args) = parser.parse_args()
    Hosts = options.Hosts
    if Hosts == None:
        print(parser.usage)
        exit(0)
    else:
        target = ListMac(Hosts)
        try:
            with open("ip.csv", "w", newline="") as f:
                csv_writer = csv.writer(f)
                csv_writer.writerow(('IP', 'MAC'))
                for i in target:
                    csv_writer.writerow(i)
        except Exception as e:
            print("异常对象的类型是:%s" % type(e))
            print("异常对象的内容是：%s" % e)
        finally:
            f.close()


if __name__ == '__main__':
    main()
