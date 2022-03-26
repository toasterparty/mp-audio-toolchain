import sys
import os
import tempfile
import shutil
import random

CHAOTIC_MUSIC_FILENAMES = [
    'int_introcinemaL.dsp',
    'int_introcinemaR.dsp',
    'over-craterrevealL.dsp',
    'over-craterrevealR.dsp',
    'over-ridleydeathL.dsp',
    'over-ridleydeathR.dsp',
    'int_toujouL.dsp',
    'int_toujouR.dsp',
    'END-escapeL.dsp',
    'END-escapeR.dsp',
    'rid_r_death_01.dsp',
    'jin_itemattain.dsp',
    'evt_x_event_00.dsp',
    'tha_r_death_00.dsp',
    'CraterReveal2.dsp',
    'sam_samusappear.dsp',
    'itm_x_short_02.dsp',
    'tha_b_enraged_00.dsp',
    'pvm01.dsp',
    'jin_artifact.dsp',
]

# Parse input
dir = sys.argv[1]
seed = int(sys.argv[2])
percentage = float(sys.argv[3]) / 10.0
all_audio_files = percentage > 1.00001
stereo_shuffle = percentage > 1.10001
if percentage > 1.0:
    percentage = 1.0
if percentage < 0.0:
    percentage = 0.0
audio_grp = dir.endswith("AudioGrp\\")

print("Shuffling files in '%s' using seed '%d'..." % (dir, seed))

def path_to_filename(filepath):
    return filepath.split("\\")[-1]

with tempfile.TemporaryDirectory() as tempdir:
    loopdir = os.path.join(tempdir, "loop")
    nonloopdir = os.path.join(tempdir, "nonloopdir")

    os.mkdir(loopdir)
    os.mkdir(nonloopdir)

    loopfilepaths = []
    oneshotfilepaths = []

    def get_filepaths():
        filepaths = list()
        for (dirpath, dirnames, filenames) in os.walk(dir):
            if len(dirnames) > 1:
                continue # top level

            for filename in filenames:
                if not filename.endswith(".dsp"):
                    continue
                filepaths.append(os.path.join(dirpath, filename))
        return filepaths
        
    start_count = len(get_filepaths())

    loop_id_to_filename = dict()
    oneshot_id_to_filename = dict()
    loop_filepath_to_id = dict()
    oneshot_filepath_to_id = dict()

    random.seed(seed)

    def find_partner(filepath, pathlist):
        for partner_filepath in pathlist:
            if partner_filepath != filepath and partner_filepath.replace("R.dsp", "").replace("L.dsp", "") == filepath.replace("R.dsp", "").replace("L.dsp", ""):
                return partner_filepath
        raise Exception("Failed to find partner for '%s'" % filepath)

    for filepath in get_filepaths():
        filename = path_to_filename(filepath)

        if percentage <= random.random():
            if filename.endswith("L.dsp") or filename.endswith("R.dsp"):
                if random.random() > 0.5:
                    continue
            else:
                continue

        if (not all_audio_files and filename in CHAOTIC_MUSIC_FILENAMES):
            continue

        with open(filepath, "rb") as file:
            header = file.read(14)
            is_loop = header[12] != 0 or header[13] != 0

        if is_loop:
            id = len(loopfilepaths)
            shutil.copy(filepath, os.path.join(loopdir, str(id)))
            loopfilepaths.append(filepath)
            loop_id_to_filename[id] = filename
            loop_filepath_to_id[filepath] = id
        else:
            id = len(oneshotfilepaths)
            shutil.copy(filepath, os.path.join(nonloopdir, str(id)))
            oneshotfilepaths.append(filepath)
            oneshot_id_to_filename[id] = filename
            oneshot_filepath_to_id[filepath] = id

    for (pathlist, id_to_filename, filepath_to_id, tempdir) in [(loopfilepaths, loop_id_to_filename, loop_filepath_to_id, loopdir), (oneshotfilepaths, oneshot_id_to_filename, oneshot_filepath_to_id, nonloopdir)]:
        pathlist.sort()

        for _ in range(0,5):
            for filepath in pathlist.copy():
                if filepath.endswith("L.dsp") or filepath.endswith("R.dsp"):
                    try:
                        find_partner(filepath, pathlist)
                    except:
                        pathlist.remove(filepath)
                        # print("removing %s as it won't have a partner" % filepath)

        # for filepath in pathlist:
        #     os.remove(filepath)

        src_pathlist = []
        dst_pathlist = []

        for x in pathlist:
            src_pathlist.append(x)
            dst_pathlist.append(x)

        while len(dst_pathlist) != 0:
            dst_filepath = random.choice(dst_pathlist)

            # assert dst_filepath not in get_filepaths()

            dst_filename = path_to_filename(dst_filepath)

            if stereo_shuffle:
                src_filepath = src_pathlist.pop()
                src_filename = path_to_filename(src_filepath)
                src_id = filepath_to_id[src_filepath]
                shutil.copy(os.path.join(tempdir, str(src_id)), dst_filepath)
                dst_pathlist.remove(dst_filepath)
                # print("%s -> %s" % (src_filename, dst_filename))
            elif dst_filename.endswith("L.dsp") or dst_filename.endswith("R.dsp"):
                def find_src_with_ending(ending):
                    for filepath in src_pathlist:
                        if filepath.endswith(ending):
                            return filepath
                    raise Exception("Failed to find file ending in '%s'" % ending)

                try:
                    if dst_filename.endswith("L.dsp"):
                        dst_filepath_l = dst_filepath
                        dst_filename_l = dst_filename

                        dst_filepath_r = find_partner(dst_filepath_l, dst_pathlist)
                        dst_filename_r = path_to_filename(dst_filepath_r)
                    else:
                        dst_filepath_r = dst_filepath
                        dst_filename_r = dst_filename

                        dst_filepath_l = find_partner(dst_filepath_r, dst_pathlist)
                        dst_filename_l = path_to_filename(dst_filepath_l)
                except:
                    src_filepath = dst_filepath
                    src_id = filepath_to_id[src_filepath]
                    shutil.copy(os.path.join(tempdir, str(src_id)), dst_filepath)
                    src_pathlist.remove(src_filepath)
                    dst_pathlist.remove(dst_filepath)
                    continue

                src_filepath_l = find_src_with_ending("L.dsp")
                src_filename_l = path_to_filename(src_filepath_l)

                src_filepath_r = find_partner(src_filepath_l, src_pathlist)
                src_filename_r = path_to_filename(src_filepath_r)

                src_id_l = filepath_to_id[src_filepath_l]
                src_id_r = filepath_to_id[src_filepath_r]

                shutil.copy(os.path.join(tempdir, str(src_id_l)), dst_filepath_l)
                shutil.copy(os.path.join(tempdir, str(src_id_r)), dst_filepath_r)

                src_pathlist.remove(src_filepath_l)
                src_pathlist.remove(src_filepath_r)
                dst_pathlist.remove(dst_filepath_l)
                dst_pathlist.remove(dst_filepath_r)

                # print("%s -> %s" % (src_filename_l, dst_filename_l))
            else:
                def get_next_non_stereo():
                    for filepath in src_pathlist:
                        if filepath.endswith("L.dsp") or filepath.endswith("R.dsp"):
                            continue
                        return filepath
                    raise Exception("Failed to find non-stero source")

                src_filepath = get_next_non_stereo()
                src_filename = path_to_filename(src_filepath)
                src_id = filepath_to_id[src_filepath]
                shutil.copy(os.path.join(tempdir, str(src_id)), dst_filepath)
                dst_pathlist.remove(dst_filepath)
                src_pathlist.remove(src_filepath)
                # print("%s -> %s" % (src_filename, dst_filename))
    assert start_count == len(get_filepaths())
    assert start_count != 0
