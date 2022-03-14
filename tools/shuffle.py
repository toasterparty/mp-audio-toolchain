import sys
import os
import tempfile
import shutil
import random

dir = sys.argv[1]
seed = int(sys.argv[2])
percentage = float(sys.argv[3]) / 10.0

print("Shuffling files in '%s' using seed '%d'..." % (dir, seed))

with tempfile.TemporaryDirectory() as tempdir:
    loopdir = os.path.join(tempdir, "loop")
    nonloopdir = os.path.join(tempdir, "nonloopdir")

    os.mkdir(loopdir)
    os.mkdir(nonloopdir)

    loopfilepaths = []
    oneshotfilepaths = []

    for (dirpath, dirnames, filenames) in os.walk(dir):
        if len(dirnames) > 1:
            continue # top level

        for filename in filenames:
            if not filename.endswith(".dsp"):
                continue

            filepath = os.path.join(dirpath, filename)

            with open(filepath, "rb") as file:
                header = file.read(14)
                is_loop = header[12] != 0 or header[13] != 0

            if is_loop:
                shutil.copy(filepath, os.path.join(loopdir, str(len(loopfilepaths))))
                loopfilepaths.append(filepath)
            else:
                shutil.copy(filepath, os.path.join(nonloopdir, str(len(oneshotfilepaths))))
                oneshotfilepaths.append(filepath)

    loopfilepaths.sort()
    oneshotfilepaths.sort()

    random.seed(seed)
    random.shuffle(loopfilepaths)
    random.shuffle(oneshotfilepaths)

    for i in range(0,len(loopfilepaths)):
        if random.random() > percentage:
            continue
        shutil.copy(os.path.join(loopdir, str(i)), loopfilepaths[i])

    for i in range(0,len(oneshotfilepaths)):
        if random.random() > percentage:
            continue
        shutil.copy(os.path.join(nonloopdir, str(i)), oneshotfilepaths[i])
