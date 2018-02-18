import shutil


input_data = "D:\\huck_data\\"
output_data = "D:\\test_data\\"
def add_huck_test_in_all_test(conn, hid, pid):
    sql = "SELECT test_number FROM problem_information_3 WHERE pro_id=%d" % pid
    cursor = conn.cursor()
    cursor.execute(sql)
    for row in cursor.fetchall():
        tid = row[0]
        input_data_dir = input_data + "%d" % hid
        output_data_dir = output_data + "%d" % pid
        shutil.copy(input_data_dir+"\\huck.in",output_data_dir+"\\%d.in" % tid)
        shutil.copy(input_data_dir + "\\huck.out", output_data_dir + "\\%d.out" % tid)
        sql = "UPDATE problem_information_3 SET test_number = test_number + 1 WHERE pro_id = %d" % pid
        cursor.execute(sql)
