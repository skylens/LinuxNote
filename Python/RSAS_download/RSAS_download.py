# encoding=utf-8


# http://update.nsfocus.com/update/listAurora/v/5
from bs4 import BeautifulSoup
import urllib.request
import re
# 二进制下载
from urllib.request import urlretrieve
import os
import hashlib
# 关闭 https 证书验证
import ssl
ssl._create_default_https_context = ssl._create_unverified_context



# url = "http://update.nsfocus.com/update/listAurora/v/5"
# headers = {'User-Agent' : 'Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 4 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19'}
# r = requests.post(url, headers=headers)
# print(r.request)
# soup = BeautifulSoup("<html>A Html Text</html>", "html.parser")

url = r'http://update.nsfocus.com/update/listAurora/v/5'
downloadurl = r'http://update.nsfocus.com'
# res = urllib.request.urlopen(url)
headers ={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'}
req = urllib.request.Request(url=url,headers=headers)
res = urllib.request.urlopen(req)
html = res.read().decode('utf-8')
# print(html)
soup = BeautifulSoup(html, 'html.parser')
# soup = BeautifulSoup(html, 'lxml')
# print(soup.find('table'))
# print(soup.find_all('table'))
# print(soup.find('dvi', class="column_right"))
# print(soup.find("div", class_='column_right'))
# for tag in (soup.find_all('tr')):
# #     print(tag.tr.td)
#     # url && 文件名
#     if (tag.get_text()) == '名称':
#         print(tag.get_text())
#         # print(tag.a['href'])
#         print(1)
#     # for tds in tag.tr.td:
#     #     print(tds.span)
#     # print(tag.a.)
def get_files(url, filename):
    urlretrieve(url, filename)
    print(filename+"\n")

for tag01 in (soup.find("div", class_='column_right').find_all('a')):
    # print(downloadurl + tag01['href'])
    print(tag01.get_text())
    # get_files((downloadurl + tag01['href']),tag01.get_text())
# regis_info = []
# regis_info01 = []
# regis_info02 = []

# for tag02 in (soup.find("div", class_='column_right').find_all('td')):
    # print(str(tag02.get_text().strip()))
    # print(re.findall(r'(^aurora*)'))
    # print("+++++++++")
    # regis_info.append(tag02.get_text())
    # regis_info01.append(str(tag02.get_text()).strip().replace(" ", ""))
    # regis_info02.append(re.sub('\r', "" , (re.sub('\n', " ", tag02.get_text()).strip().replace(" ", "").replace("名称：", "").replace("MD5：",""))))
    # print(re.sub('\r', "" , (re.sub('\n', " ", tag02.get_text()).strip().replace(" ", ""))))
    # print(re.findall(r'MD5："(.+?)"', re.sub('\r', "" , (re.sub('\n', " ", tag02.get_text()).strip().replace(" ", "")))))
    # print(re.findall('^a*',re.sub('\n', " ", tag02.get_text()).strip().replace(" ", "").replace("名称：", "").replace("MD5：","")))
    #print(re.findall('MD5："(.+?)"', tag02.get_text()))

    # print(regis_info)
# print(regis_info)
# print(regis_info01)
# print(regis_info02)
# print(type(regis_info02))
#
# for a in regis_info02:
#     # matchObj = re.match('^aurora+?', a)
#     matchObj = re.match('[0-9a-z]{30}', a)
#     if matchObj:
#        print(str(a))
#     else :
#         continue

    # if re.findall()

def get_files(url, filename):
    urlretrieve(url, filename)
    print(filename+"\n")

# 名称： aurora-051851.dat	大小：430.0K	MD5：10a3e10ba7936a434cad04a4f208bbda
# get_files("http://update.nsfocus.com/update/downloads/id/29969","aurora-051851.dat")

# def get_file_md5(file_path):
#     with open(file_path, 'rb') as f:
#         md5obj = hashlib.md5()
#         md5obj.update(f.read())
#         _hash = md5obj.hexdigest()
#     return str(_hash)
#
# filename_path = 'aurora-051851.dat'
# print(get_file_md5(filename_path))
