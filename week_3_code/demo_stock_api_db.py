import urllib.request
import json
import mysql.connector

# Data is from: https://www.worldtradingdata.com/home
# Graphing Examples: https://matplotlib.org/3.1.1/tutorials/introductory/pyplot.html

token = "vtmJTs2G0H9iQ5TfnPxCzckiso0oBLgKGMIuqv1iK08IAOKoEAgOQUXgtrkO"

def download_json_from_url(stock):
    date_from="2017-01-01"
    url = f"https://api.worldtradingdata.com/api/v1/history?symbol={stock}&date_from={date_from}&sort=newest&api_token={token}"

    response = urllib.request.urlopen(url)
    resp_string = response.read().decode('utf-8')
    json_obj = json.loads(resp_string)
    return json_obj['history']

# def calculate_x_and_y_values(all_time):
#     x_vals = []
#     y_vals = []
#     for day, days_dict in sorted(all_time.items(), key=lambda item: item[0]):
#         price = days_dict['volume']
#         price = float(price)
#         x_vals.append(day)
#         y_vals.append(price)
#     return x_vals, y_vals

# def plot_stock(stock, x_vals, y_vals):
#     plt.plot(x_vals, y_vals)
#     plt.title(stock)
#     plt.show()


cnx = mysql.connector.connect(user='ceiling_zero',  password='password',
                              host='192.168.1.216', # host='10.95.7.147',
                              database='cz')
cursor = cnx.cursor()

stock = 'MSFT'
dict = download_json_from_url(stock)
# dict = {}
for day, days_dict in sorted(dict.items(), key=lambda item: item[0]):
    open = float(days_dict['open'])
    high = float(days_dict['high'])
    low = float(days_dict['low'])
    close = float(days_dict['close'])

    insert_sql = """
    REPLACE into cz.stock_price (stock, dt, open, high, low, close)
    VALUES(%s, %s, %s, %s, %s, %s)
    """
    cursor.execute(insert_sql, (stock, day, open, high, low, close ))
    cnx.commit()

cursor.close()
cnx.close()






