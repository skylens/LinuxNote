# https://www.jianshu.com/p/359b935aee10
# python -m compileall getfilelist.py 

'''
python -O -m py_compile getfilelist.py
python getfilelist.pyo
'''

import os

g = os.walk(os.getcwd())
for path,d,filelist in g:
  for filename in filelist:
    if filename.endswith('mon.html'):
      print (os.path.join(path, filename))
