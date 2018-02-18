import build_code
import clr_make
import huck_run_main
import add_test


def new_huck(conn, id, sid):
    cursor = conn.cursor()
    sql = "SELECT pro_id,code,language FROM pro_submit WHERE id=%d" % sid
    cursor.execute(sql)
    for row in cursor.fetchall():
        ans = row[0]
        sql = "SELECT data_monitoring FROM problem_information_4 WHERE pro_id = %d" % ans
        cursor.execute(sql)
        for row1 in cursor.fetchall():
            ans = clr_make.clr_make(row1[0], 3)
            if ans:
                ans = build_code.compile_code(3)
                if ans:
                    print("compile is success!")
                    j_result = huck_run_main.run_data(id)
                    print(j_result)
                    if j_result["result"] == 1:
                        sql = "UPDATE huck_submit SET result='4'"
                    else:
                        sql = "UPDATE huck_submit SET result='3'"
                    try:
                        print(sql)
                        cursor.execute(sql)
                    except Exception as e:
                        conn.rollback()
                        print('have result but can\'t update now', e)
                    if j_result["result"] == 1:
                        sql = "SELECT true_code FROM problem_information_4 WHERE pro_id = %d" % row[0]
                        cursor.execute(sql)
                        for row2 in cursor.fetchall():
                            ans = clr_make.clr_make(row2[0], 3)
                            if ans:
                                ans = build_code.compile_code(3)
                                if ans:
                                    print("compile is success!")
                                    j_result = huck_run_main.get_true_data(id)
                                    print(j_result)
                                    if j_result["result"] == 1:
                                        print(row)
                                        ans = clr_make.clr_make(row[1], row[2])
                                        if ans:
                                            ans = build_code.compile_code(row[2])
                                            if ans:
                                                print("compile is success!")
                                                j_result = huck_run_main.hacking_attempt(id, row[0])
                                                print(j_result)
                                                if j_result["result"] == 1:
                                                    sql = "UPDATE huck_submit SET result = 2 WHERE id=%d" % id
                                                else:
                                                    add_test.add_huck_test_in_all_test(conn, id, row[0])
                                                    sql = "UPDATE pro_submit SET result = -1 , "
                                                    sql += "u_time = %d , " % j_result["take_time"]
                                                    sql += "u_memory = %d " % j_result["take_memory"]
                                                    sql += " WHERE id = %d" % sid
                                                    try:
                                                        cursor.execute(sql)
                                                        sql = "UPDATE problem_information_1 SET AC = 0 WHERE " \
                                                              "pro_id=%d" % row[0]
                                                        try:
                                                            cursor.execute(sql)
                                                            sql = "UPDATE pro_submit SET result = 0 WHERE " \
                                                                  "pro_id=%d AND result=1" % row[0]
                                                            try:
                                                                cursor.execute(sql)
                                                            except Exception as e:
                                                                conn.rollback()
                                                                print('have result but can\'t update now', e)
                                                        except Exception as e:
                                                            conn.rollback()
                                                            print('have result but can\'t update now', e)
                                                    except Exception as e:
                                                        conn.rollback()
                                                        print('have result but can\'t update now', e)
                                                    sql = "UPDATE huck_submit SET result = 1 WHERE id= %d" % id
                                    else:
                                        sql = "UPDATE huck_submit SET result = '-2' WHERE id=%d" % id
                                    try:
                                        cursor.execute(sql)
                                    except Exception as e:
                                        conn.rollback()
                                        print('have result but can\'t update now', e)
