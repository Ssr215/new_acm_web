import subprocess
import psutil
import time
import logging
import os
import pymysql


work_dir = "word_dir"
output_data = "word_dir"
input_data = "D:\\huck_data\\"
true_output_data = "D:\\huck_data\\true_data"
program_info = {
    'take_time': 0,
    'take_memory': 0,
    'result': 7,
    'end_id': 0}
result_code = {
    'in queue': 0,
    'Accepted': 1,
    'Presentation Error': 2,
    'Output Limit': 3,
    'Runtime Error': 4,
    'Memory Limit Exceeded': 5,
    'Time Limit Exceeded': 6,
    'Wrong Answer': 7,
    'Compile Error': 8,
    'running': 9}


def get_max_mem(pid):
    glan = psutil.Process(pid)
    max1 = 0
    while True:
        try:
            rss, vms = glan.memory_info()
            if rss > max1:
                max1 = rss
        except:
            print("max rss = %d" % max1)
            return max1

def run_data(id):
    max_rss = 0
    max_vss = 0
    total_time = 0
    data_count = 1
    time_limit = 10
    mem_limit = 512 * 1024 * 1024
    for i in range(data_count):
        # print("i = %d" % i)
        input_data_build = input_data + "%d" % id
        input_data_dir = input_data_build + "\\huck.in"
        print(input_data_dir)
        p = subprocess.Popen(["E:\\C++\\Python\\Second\\word_dir\\main.exe",
                              "<%s>" % input_data_dir,
                              "E:\\C++\\Python\\Second\\word_dir\\st.out"], shell=True)
        print("come here")
        start = time.time()
        pid = p.pid
        gland_1 = psutil.Process(pid)
        while True:
            time_to_now = time.time() - start + total_time
            if psutil.pid_exists(pid) is False:
                # program_info['take_time'] = time_to_now * 1000
                # program_info['take_memory'] = max_rss / 1024.0
                # program_info['result'] = result_code["Runtime Error"]
                # return program_info

                break
            try:
                result_all = gland_1.memory_info()
            except:
                logging.debug("can't find exist")
                break
            if p.poll() == 0:
                end = time.time()
                break
            if max_vss < result_all.vms:
                max_vss = result_all.vms
                # print("max_vss = %d" % max_vss)
            if max_rss < result_all.rss:
                max_rss = result_all.rss
                # print("max_rss = %d" % max_rss)
            if time_to_now > time_limit:
                program_info['take_time'] = time_to_now * 1000
                program_info['take_memory'] = max_rss / 1024.0
                program_info['result'] = result_code["Time Limit Exceeded"]
                program_info['end_id'] = i
                gland_1.terminate()
                return program_info
            if max_rss > mem_limit:
                program_info['take_time'] = time_to_now * 1000
                program_info['take_memory'] = max_rss / 1024.0
                program_info['result'] = result_code["Memory Limit Exceeded"]
                program_info['end_id'] = i
                gland_1.terminate()
                return program_info
        logging.debug("max_rss = %d" % max_rss)
        logging.debug("max_vms = %d" % max_vss)
        logging.debug("Judging result")
        # print("here is run_main line137")
        true_output_data_dir = true_output_data
        correct_result = os.path.join(output_data, "st.out")
        user_result = os.path.join(true_output_data_dir, "all.out")
        # print("here is run_main line141")

        def read_file(path):
            with open(path, 'r+', encoding='UTF-8') as f:
                str_re = f.read()
            return str_re.strip().replace('\ufeff', '')

        try:
            correct = read_file(correct_result)
            # print("here is run_main line150")
            user = read_file(user_result)
        except:
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = max_rss / 1024.0
            program_info['result'] = result_code["Wrong Answer"]
            program_info['end_id'] = i
            print("here is come")
            return program_info
        # print(correct)
        # print(user)
        # print("here is run_main line159")
        if correct == user:
            # print("AC test %d" % i)
            continue
        if correct.split() == user.split():
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = max_rss / 1024.0
            program_info['result'] = result_code["Presentation Error"]
            program_info['end_id'] = i
            # print("PE")
            return program_info
        if correct in user:
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = max_rss / 1024.0
            program_info['result'] = result_code["Output Limit"]
            program_info['end_id'] = i
            # print("OUT LIM")
            return program_info
        program_info['take_time'] = time_to_now * 1000
        program_info['take_memory'] = max_rss / 1024.0
        program_info['result'] = result_code["Wrong Answer"]
        program_info['end_id'] = i
        # print("WA")
        return program_info
    program_info['take_time'] = time_to_now * 1000
    program_info['take_memory'] = max_rss / 1024.0
    program_info['result'] = result_code["Accepted"]
    return program_info

def get_true_data(id):
    input_data_build = input_data + "%d" % id
    input_data_dir = input_data_build + "\\huck.in"
    output_data_dir = input_data_build + "\\huck.out"
    print(input_data_dir)
    p = subprocess.Popen(["E:\\C++\\Python\\Second\\word_dir\\main.exe",
                          "<%s>" % input_data_dir,
                          output_data_dir], shell=True)
    print("come here")
    start = time.time()
    pid = p.pid
    gland_1 = psutil.Process(pid)
    total_time = 0
    time_limit = 10
    while True:
        time_to_now = time.time() - start + total_time
        if psutil.pid_exists(pid) is False:
            # program_info['take_time'] = time_to_now * 1000
            # program_info['take_memory'] = max_rss / 1024.0
            # program_info['result'] = result_code["Runtime Error"]
            # return program_info
            break
        if p.poll() == 0:
            end = time.time()
            break
        if time_to_now > time_limit:
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = 0
            program_info['result'] = result_code["Time Limit Exceeded"]
            program_info['end_id'] = 0
            gland_1.terminate()
            return program_info
    program_info['take_time'] = time_to_now * 1000
    program_info['take_memory'] = 0
    program_info['result'] = result_code["Accepted"]
    return program_info


def query_limit(pro_id):
    connect = -1
    print("你好！,在次连接成功")
    try:
        connect = pymysql.Connect(
            host='localhost',
            port=3306,
            user='Evaluation_machine',
            passwd='hsxi134719.',
            db='acm_sever_1',
            # charset='usf8'
        )
        print("connect database is success")
    except (IOError, ZeroDivisionError) as x:
        print(x)
    result_limit = {
        "time_limit": 1,
        "memory_limit": 5,
        "data_count": 1
    }
    cursor = connect.cursor()
    sql = "SELECT time_limit,memory_limit FROM problem_information_1 WHERE pro_id = %d" % pro_id
    cursor.execute(sql)
    for row in cursor.fetchall():
        result_limit["time_limit"] = row[0]
        result_limit["memory_limit"] = row[1]
    sql = "SELECT test_number FROM problem_information_3 WHERE pro_id = %d" % pro_id
    cursor.execute(sql)
    for row in cursor.fetchall():
        result_limit["data_count"] = row[0]
    return result_limit

def hacking_attempt(id, pro_id):
    max_rss = 0
    max_vss = 0
    total_time = 0
    qq = query_limit(pro_id)
    data_count = qq["data_count"]
    time_limit = qq["time_limit"] / 1000
    mem_limit = qq["memory_limit"] * 1024 * 1024
    print(qq)
    for i in range(data_count):
        # print("i = %d" % i)
        input_data_build = input_data + "%d" % id
        input_data_dir = input_data_build + "\\huck.in"
        print(input_data_dir)
        p = subprocess.Popen(["E:\\C++\\Python\\Second\\word_dir\\main.exe",
                              "<%s>" % input_data_dir,
                              "E:\\C++\\Python\\Second\\word_dir\\st.out"], shell=True)
        print("come here")
        start = time.time()
        pid = p.pid
        gland_1 = psutil.Process(pid)
        while True:
            time_to_now = time.time() - start + total_time
            if psutil.pid_exists(pid) is False:
                # program_info['take_time'] = time_to_now * 1000
                # program_info['take_memory'] = max_rss / 1024.0
                # program_info['result'] = result_code["Runtime Error"]
                # return program_info

                break
            try:
                result_all = gland_1.memory_info()
            except:
                logging.debug("can't find exist")
                break
            if p.poll() == 0:
                end = time.time()
                break
            if max_vss < result_all.vms:
                max_vss = result_all.vms
                # print("max_vss = %d" % max_vss)
            if max_rss < result_all.rss:
                max_rss = result_all.rss
                # print("max_rss = %d" % max_rss)
            if time_to_now > time_limit:
                program_info['take_time'] = time_to_now * 1000
                program_info['take_memory'] = max_rss / 1024.0
                program_info['result'] = result_code["Time Limit Exceeded"]
                program_info['end_id'] = i
                gland_1.terminate()
                return program_info
            if max_rss > mem_limit:
                program_info['take_time'] = time_to_now * 1000
                program_info['take_memory'] = max_rss / 1024.0
                program_info['result'] = result_code["Memory Limit Exceeded"]
                program_info['end_id'] = i
                gland_1.terminate()
                return program_info
        logging.debug("max_rss = %d" % max_rss)
        logging.debug("max_vms = %d" % max_vss)
        logging.debug("Judging result")
        # print("here is run_main line137")
        correct_result = os.path.join(output_data, "st.out")
        user_result = os.path.join(input_data_build, "huck.out")

        # print("here is run_main line141")

        def read_file(path):
            with open(path, 'r+', encoding='UTF-8') as f:
                str_re = f.read()
            return str_re.strip().replace('\ufeff', '')

        try:
            correct = read_file(correct_result)
            # print("here is run_main line150")
            user = read_file(user_result)
        except:
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = max_rss / 1024.0
            program_info['result'] = result_code["Wrong Answer"]
            program_info['end_id'] = i
            # print("here is come")
            return program_info
        # print(correct)
        # print(user)
        # print("here is run_main line159")
        if correct == user:
            # print("AC test %d" % i)
            continue
        if correct.split() == user.split():
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = max_rss / 1024.0
            program_info['result'] = result_code["Presentation Error"]
            program_info['end_id'] = i
            # print("PE")
            return program_info
        if correct in user:
            program_info['take_time'] = time_to_now * 1000
            program_info['take_memory'] = max_rss / 1024.0
            program_info['result'] = result_code["Output Limit"]
            program_info['end_id'] = i
            # print("OUT LIM")
            return program_info
        program_info['take_time'] = time_to_now * 1000
        program_info['take_memory'] = max_rss / 1024.0
        program_info['result'] = result_code["Wrong Answer"]
        program_info['end_id'] = i
        # print("WA")
        return program_info
    program_info['take_time'] = time_to_now * 1000
    program_info['take_memory'] = max_rss / 1024.0
    program_info['result'] = result_code["Accepted"]
    return program_info
# run(1001)
# print(program_info)
