import datetime


def get_wab_information(conn, wid):
    sql = "SELECT next_numbers FROM web_number_information WHERE id = %d" % wid
    conn.execute(sql)
    ans = 1
    for row in conn.fetchall():
        ans = row[0]
    sql = "UPDATE web_number_information SET next_numbers = next_numbers + 1 WHERE id = %d" % wid
    conn.execute(sql)
    return ans


def query_error_record(conn, cid, pid, uid, hid):
    sql = "SELECT COUNT(1) FROM contest_pro_submit WHERE contest_id = '%d' " % cid
    sql += "AND problem_id = '%d'" % pid + "AND user_id = '%d' " % uid
    sql += "AND result <> '11' AND result <> '8' AND id < %d" % hid
    # print(sql)
    conn.execute(sql)
    for row in conn.fetchall():
        return row[0]
    return 0


def update_total_score(conn, cid, uid):
    ans = 0
    sql = "SELECT add_score FROM contest_ranks_information_1 WHERE user_id = %d AND contest_id = %d" % (uid, cid)
    conn.execute(sql)
    for row in conn.fetchall():
        ans += row[0]
    sql = "SELECT COUNT(1) FROM contest_ranks_information_2 WHERE user_id = %d AND contest_id = %d" % (uid, cid)
    conn.execute(sql)
    q = 0
    for row in conn.fetchall():
        q = row[0]
    if q == 0:
        wid = get_wab_information(conn, 11)
        print("here you are")
        sql = "INSERT INTO contest_ranks_information_2 (id,user_id,contest_id,total_score,end_ranks,previous_ranting," \
              "add_rating) VALUES (%d,%d,%d,%d,0,0,0)" % (wid, uid, cid, ans)
    else:
        sql = "UPDATE contest_ranks_information_2 SET total_score = %d" % ans
        sql += " WHERE user_id = %d AND contest_id = %d" % (uid, cid)
    conn.execute(sql)


def query_begin_time(conn, cid):
    sql = "SELECT begin_time FROM contest_information_1 WHERE contest_id = %d" % cid
    conn.execute(sql)
    for row in conn.fetchall():
        return row[0]
    return datetime.datetime.now()


def calculate_score(score, pass_time_minute, count_error):
    pass_time_minute = int(pass_time_minute/60)
    delect = score / 250 * pass_time_minute
    count_error *= 50
    if score * 0.3 > score - delect - count_error:
        return score * 0.3
    return score - delect - count_error


def add_rank_score(conn, uid, cid, pid, score, su_time):
    begin_time = query_begin_time(conn, cid)
    pass_time = (su_time - begin_time)
    # print(begin_time)
    # print(su_time)
    # print(pass_time)
    # print(pass_time.seconds)
    sql = "SELECT COUNT(1) FROM contest_ranks_information_1 WHERE user_id=%d" % uid
    sql += " AND contest_id = %d" % cid + " AND pass_problem_id = %d" % pid
    # print(sql)
    conn.execute(sql)
    # print(sql)
    ans = 0
    for row in conn.fetchall():
        ans = row[0]
    print(ans)
    if ans > 0:
        eid = query_error_record(conn, cid, pid, uid, 1000)
        score = calculate_score(score, pass_time.seconds, eid)
        dt = pass_time.seconds
        ds = "%d" % int(dt / 3600)
        ds += ":%d" % int((dt % 3600) / 60)
        ds += ":%d" % (dt % 60)
        sql = "UPDATE contest_ranks_information_1 SET add_score='%d'" % score + ",pass_time = '" + ds + "'"
        # print(sql)
        sql += " ,error_record = '%d'" % eid + " WHERE user_id = '%d'" % uid + " AND contest_id = '%d'" % cid
        # print(sql)
        sql += " AND pass_problem_id = '%d'" % pid
        # print(sql)
        conn.execute(sql)
    else:
        wid = get_wab_information(conn, 10)
        # print(wid)
        eid = query_error_record(conn, cid, pid, uid, 1000)
        # print(eid)
        score = calculate_score(score, pass_time.seconds, eid)
        # print(score)
        dt = pass_time.seconds
        ds = "%d" % int(dt/3600)
        ds += ":%d" % int((dt%3600)/60)
        ds += ":%d" % (dt%60)
        # print(ds)
        sql = "INSERT INTO contest_ranks_information_1 (id,user_id,contest_id,pass_time,pass_problem_id,add_score," \
              "error_record,lock_problem) VALUES ("
        sql += "'%d'," % wid + "'%d'," % uid + "'%d'" % cid
        # print(sql)
        sql += ",'%s'" % ds
        # print(sql)
        sql += ",'%d'," % pid + "'%d'," % score + "'%d'," %eid + "'0')"
        # print(sql)
        conn.execute(sql)
    # print(sql)
    update_total_score(conn, cid, uid)
