import time
import pymysql.cursors
import clr_make
import build_code
import os
import run_main
import huck

while True:
    connect = -1
    # print("你好！")
    try:
        connect = pymysql.Connect(
            host='localhost',
            port=3306,
            user='Evaluation_machine',
            passwd='hsxi134719.',
            db='acm_sever_1',
            # charset='usf8'
        )
        # print("connect database is success")
    except (IOError, ZeroDivisionError) as x:
        print(x)

    cursor = connect.cursor()
    sql = "SELECT * FROM pro_submit WHERE result=0 or result > 9000"
    cursor.execute(sql)
    for row in cursor.fetchall():
        # print(row)
        ans = clr_make.clr_make(row[9], row[2])
        # print(ans)
        if ans:
            sql = "UPDATE pro_submit SET result = 9001 WHERE id = %d" % row[0]
            try:
                cursor.execute(sql)
                ans = build_code.compile_code(row[2])
                if ans:
                    print("compile is success!")
                    j_result = run_main.run(row[1])
                    print(j_result)
                    put_result = 0
                    if j_result["result"] == 1:
                        put_result = 1
                    else:
                        put_result = j_result["result"] * 1000 + j_result["end_id"] + 1
                    sql = "UPDATE pro_submit SET result = %d" % put_result
                    sql += ",u_time = %d" % j_result["take_time"]
                    sql += ",u_memory = %d" % j_result["take_memory"]
                    sql += " WHERE id = %d" % row[0]
                    try:
                        cursor.execute(sql)
                    except Exception as e:
                        connect.rollback()
                        print('have result but can\'t update now', e)
                    if j_result["result"] == 1:
                        sql = "UPDATE problem_information_1 SET AC = AC+1 WHERE pro_id = %d" % row[1]
                        try:
                            cursor.execute(sql)
                        except Exception as e:
                            connect.rollback()
                            print('it is ac but can\'t update ac number now', e)
                    # if write_test_file.get_test_file(cursor, row[1]):
                    #     print("get test file is success!")
                    # else:
                    #     print("ERROR: get test file is file")
                else:
                    err_txt_path = os.path.join('word_dir', 'error.txt')
                    er = build_code.read_file(err_txt_path)
                    er = pymysql.escape_string(er)
                    print(er)
                    sql = "UPDATE pro_submit SET compile='\%s',result=8 WHERE id = %d" % (er, row[0])
                    try:
                        cursor.execute(sql)
                    except Exception as e:
                        connect.rollback()
                        print('compile error but can\'t update now', e)
            except Exception as e:
                connect.rollback()
                print('can\'t update now line 78', e)
    sql = "SELECT * FROM huck_submit WHERE result=0 OR result=4"
    cursor.execute(sql)
    for row in cursor.fetchall():
        print(row)
        huck.new_huck(connect,row[0],row[1])
    try:
        connect.close()
        # print("connect close is success")
    except (IOError, ZeroDivisionError) as x:
        print(x)
    time.sleep(1)
    # break
