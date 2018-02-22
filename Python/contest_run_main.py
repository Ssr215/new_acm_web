import subprocess
import psutil
import time
import logging
import os
import pymysql


work_dir = "word_dir"
output_data = "word_dir"
input_data = "D:\\contest_data\\"
true_output_data = "D:\\contest_data\\"
program_info = {
    'take_time': 0,
    'take_memory': 0,
    'result': 7,
    'end_id': 0,
    'score': 0}
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
    'running': 9,
    'Passed pretests': 11}


def query_limit(cid, pid):
    connect = -1
    # print("你好！,在次连接成功")
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
    sql = "SELECT problem_id,score FROM contest_information_2 WHERE contest_id=%d" % cid
    sql += " AND order_number = %d" % pid
    pro_id = 1000
    # print(sql)
    cursor.execute(sql)
    for row in cursor.fetchall():
        pro_id = row[0]
        program_info['score'] = row[1]
    sql = "SELECT time_limit,memory_limit FROM problem_information_1 WHERE pro_id = %d" % pro_id
    # print(sql)
    cursor.execute(sql)
    # print("here you are")
    for row in cursor.fetchall():
        # print(row)
        # print(result_limit)
        result_limit["time_limit"] = row[0]
        # print(result_limit)
        result_limit["memory_limit"] = row[1]
        # print(result_limit)
    sql = "SELECT test_number FROM contest_information_2 WHERE contest_id = %d" % cid
    sql += " AND order_number = %d" % pid
    # print(sql)
    cursor.execute(sql)
    for row in cursor.fetchall():
        result_limit["data_count"] = row[0]
    return result_limit


def run(cid, pid):
    max_rss = 0
    max_vss = 0
    total_time = 0
    qq = query_limit(cid, pid)
    data_count = qq["data_count"]
    time_limit = qq["time_limit"] / 1000
    mem_limit = qq["memory_limit"] * 1024 * 1024
    # print(qq)
    for i in range(data_count):
        # print("i = %d" % i)
        input_data_build = input_data + "%d" % cid + "\\%d" % pid
        input_data_dir = input_data_build + "\\%d.in" % i
        print(input_data_dir)
        p = subprocess.Popen(["E:\\C++\\Python\\Second\\word_dir\\main.exe",
                              "<%s>" % input_data_dir,
                              "E:\\C++\\Python\\Second\\word_dir\\st.out"], shell=True)
        print("come here")
        # print("come here")
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
        true_output_data_dir = true_output_data + "%d" % cid + "\\%d" % pid
        correct_result = os.path.join(output_data, "st.out")
        user_result = os.path.join(input_data_build, "%d.out" % i)

        # print("here is run_main line141")

        def read_file(path):
            with open(path, 'r+', encoding='UTF-8') as f:
                str_re = f.read()
            return str_re.strip().replace('\ufeff', '')

        try:
            correct = read_file(correct_result)
            print("here is run_main line150")
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
    print(max_vss)
    print(max_rss)
    program_info['take_time'] = time_to_now * 1000
    program_info['take_memory'] = max_rss / 1024.0
    program_info['result'] = result_code["Passed pretests"]
    return program_info
