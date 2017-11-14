import glob
import os
import re

re.match

root = "O:\\__ SORT PLEASE __\\backups\\rym"
files = {}

def parseFolder(path) :
        ls = glob.glob(path + "\\*")
        for f in ls :
                if os.path.isdir(f) :
                        parseFolder(f)

                if os.path.isfile(f) :
                        if re.match('.*$', f) :
                                k = '%s|%d' % (os.path.basename(f), os.path.getsize(f))

                                if not files.has_key(k) :
                                        files[k] = []
                                files[k].append(f)
                        

        


parseFolder(root)

removed = 0

for f in files :
        if len(files[f]) > 1 :
                for i in files[f][:-1] :
                        if os.access(i, os.W_OK) :
                                os.unlink(i)
                                removed += 1
                        
                print removed

                
