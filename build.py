import time
import os
import subprocess


source_path = "./src"
build_path = "./build"

def compile(src, dst):
    x = subprocess.run(["fennel", "--compile", src], capture_output=True)
    #print(x)
    if x.stderr:
        raise(SystemError(str(x.stderr)))
    else:
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        with open(dst, "wb") as handle:
            handle.write(x.stdout)


for x, subfolder, files in os.walk(source_path):
    for item in files:
        #print(x)
        #print(item)
        src_filename = os.path.join(x, item)
        dst_filename = src_filename.replace(source_path, build_path, 1).replace('.fnl', '.lua')
        
        compile(src_filename, dst_filename)
