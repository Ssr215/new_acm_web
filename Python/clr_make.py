import codecs
import shutil
import os
import logging


def clr_make(code, language):
    word_path = os.path.join('word_dir')
    shutil.rmtree(word_path)
    os.mkdir(word_path)
    # print(code)
    # print(language)
    file_name = {
        1: "main.c",
        2: "main.cpp",
        3: "main.cpp",
        4: "main.cpp",
        5: "main.java"
    }
    try:
        real_path = os.path.join(word_path, file_name[language])
    except KeyError as e:
        logging.error(e)
        return False
    try:
        f = codecs.open(real_path, 'w')
        try:
            # print(code)
            f.write(code)
        except OSError as e:
            logging.error(e)
            print("it can't write code to file")
            f.close()
            return False
        f.close()
    except OSError as e:
        logging.error(e)
        return False
    return True
