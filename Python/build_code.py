import subprocess
import os
import codecs


def compile_code(language):
    build_cmd = {
        1: "gcc main.c -o main -Wall -lm -O2 -std=c99 --static -DONLINE_JUDGE",
        2: "g++ main.cpp -O2 -Wall -lm --static -DONLINE_JUDGE -o main",
        3: "g++ main.cpp -O2 -Wall -lm --static -std=c++11 -DONLINE_JUDGE -o main",
        4: "javac Main.java"
    }
    if language not in build_cmd.keys():
        return False
    dir_word = "word_dir"
    p = subprocess.Popen(
        build_cmd[language],
        shell=True,
        cwd=dir_word,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    out, err = p.communicate()
    er = str(out + err, encoding="GBK")
    print(er)
    err_txt_path = os.path.join(dir_word, 'error.txt')
    f = codecs.open(err_txt_path, 'w')
    f.write(er)
    # f.write(err)
    f.close()
    if p.returncode == 0:
        return True
    return False


def read_file(path):
    with codecs.open(path, 'r+', encoding='UTF-8') as f:
        str = f.read()
    return str.strip().replace('\ufeff', '')
