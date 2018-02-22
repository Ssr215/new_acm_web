import os
import pymysql.cursors
import clr_make
import build_code
import contest_run_main
import contest_pac_deal

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
    sql = "SELECT id,contest_id,problem_id,competitor,language,code,submit_time,user_id FROM contest_pro_submit " \
          "WHERE result=0 or result > 9000"
    cursor.execute(sql)
    for row in cursor.fetchall():
        # print(row)
        ans = clr_make.clr_make(row[5], row[4])
        if ans:
            sql = "UPDATE contest_pro_submit SET result = 9001 WHERE id = %d" % row[0]
            try:
                cursor.execute(sql)
                ans = build_code.compile_code(row[4])
                if ans:
                    print("compile is success!")
                    j_result = contest_run_main.run(row[1], row[2])
                    print(j_result)
                    put_result = 0
                    if j_result["result"] == 11:
                        put_result = 11
                    else:
                        put_result = j_result["result"] * 1000 + j_result["end_id"] + 1
                    sql = "UPDATE contest_pro_submit SET result = %d" % put_result
                    sql += ",u_time = %d" % j_result["take_time"]
                    sql += ",u_memory = %d" % j_result["take_memory"]
                    sql += " WHERE id = %d" % row[0]
                    try:
                        cursor.execute(sql)
                    except Exception as e:
                        connect.rollback()
                        print('have result but can\'t update now', e)
                    if j_result["result"] == 11:
                        sql = "UPDATE contest_information_2 SET pass_number = pass_number+1 WHERE " \
                              "contest_id = %d" % row[1] + " AND order_number = %d" % row[2]
                        try:
                            cursor.execute(sql)
                        except Exception as e:
                            connect.rollback()
                            print('it is ac but can\'t update ac number now', e)
                        contest_pac_deal.add_rank_score(cursor, row[7], row[1], row[2], j_result['score'], row[6])
                        # sql = "UPDATE problem_information_1 SET AC = AC+1 WHERE pro_id = %d" % row[1]
                        # try:
                        #     cursor.execute(sql)
                        # except Exception as e:
                        #     connect.rollback()
                        #     print('it is ac but can\'t update ac number now', e)
                    # if write_test_file.get_test_file(cursor, row[1]):
                    #     print("get test file is success!")
                    # else:
                    #     print("ERROR: get test file is file")
                else:
                    err_txt_path = os.path.join('word_dir', 'error.txt')
                    er = build_code.read_file(err_txt_path)
                    er = pymysql.escape_string(er)
                    print(er)
                    sql = "UPDATE contest_pro_submit SET compile='\%s',result=8 WHERE id = %d" % (er, row[0])
                    try:
                        cursor.execute(sql)
                    except Exception as e:
                        connect.rollback()
                        print('compile error but can\'t update now', e)
            except Exception as e:
                connect.rollback()
                print('can\'t update now line XXY', e)
    break
