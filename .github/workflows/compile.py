import sys
import os

INPUT_DIRECTORY = "src"
OUTPUT_DIRECTORY = "."
ONLY_COMPILE_US = False

FILE_LIST = []
ONLY_COMPILE_US_LIST = []

for path, subdirs, files in os.walk(INPUT_DIRECTORY):
    for name in files:
        file_name = os.path.join(path, name)

        if not os.path.isfile(file_name):
            continue

        splitted_path = os.path.normpath(file_name).split(os.sep)

        if splitted_path[1] == "templates" or splitted_path[1] == "packages":
            continue

        output_name = name

        splitted_file = os.path.splitext((os.sep).join([OUTPUT_DIRECTORY] + splitted_path[1:-1] + [output_name]))

        if splitted_file[1] != ".typ":
            continue

        with open(file_name, "r") as f:
            for line in list(map(lambda n: n.strip(), f.readlines())):
                if line.startswith("//#COMPILE_NAME:"):
                    output_name = line.replace("//#COMPILE_NAME:", "").strip()

        splitted_file = os.path.splitext((os.sep).join([OUTPUT_DIRECTORY] + splitted_path[1:-1] + [output_name]))

        new_path = splitted_file[0] + ".pdf"

        with open(file_name, "r") as f:
            if "//#ONLY_COMPILE_US" in list(map(lambda n: n.strip(), f.readlines())):
                ONLY_COMPILE_US = True
                ONLY_COMPILE_US_LIST.append((file_name, new_path))
                break

        FILE_LIST.append((file_name, new_path))

if ONLY_COMPILE_US:
    FILE_LIST = ONLY_COMPILE_US_LIST

for entry in FILE_LIST:
    splitted_path = os.path.normpath(entry[0]).split(os.sep)
    new_path_parent = (os.sep).join([OUTPUT_DIRECTORY] + splitted_path[1:-1])

    if not os.path.exists(new_path_parent):
        os.makedirs(new_path_parent, exist_ok=True)

    print("Compiling... ", entry[0], " -> ", entry[1])

    try:
        with open(entry[0], "r") as f:
            if "//#DONT_COMPILE_TO_PDF" in list(map(lambda n: n.strip(), f.readlines())):
                print("Skipping file doesn't need to be compiled.")
                continue
    except IOError:
        print("Skipping because of error.")
        continue

    if os.system(f"typst compile --root . --font-path fonts/ {entry[0]} {entry[1]}") != 0:
        sys.exit(1)