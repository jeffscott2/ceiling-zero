import pymysql

conn = pymysql.connect(host='127.0.0.1', user='root', passwd=None, db='sakila')
cur = conn.cursor()


cur.execute("SELECT * FROM film where film_id = 3")
for row in cur:
    print(row)
    print(row[0])
    print()

# print(type)

#  row = {}
#     row['film_id'] = response[0]
#     row['title'] = response[1]
#     row['description'] = response[2]
#     row['release_year'] = response[3]
#     row['language_id'] = response[4]
#     row['original_language_id'] = response[5]
    
cur.close()
conn.close()