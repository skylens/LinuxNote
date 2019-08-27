import os

g = os.walk(os.getcwd())
for path,d,filelist in g:
  for filename in filelist:
    if filename.endswith('mon.html'):
      print (os.path.join(path, filename))
