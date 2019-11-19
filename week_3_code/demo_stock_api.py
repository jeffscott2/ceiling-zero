import urllib.request
import json
import matplotlib.pyplot as plt
from json_io import write_dict_to_json_file, read_json_file_as_dict


# Data is from: https://www.worldtradingdata.com/home
# Graphing Examples: https://matplotlib.org/3.1.1/tutorials/introductory/pyplot.html

token = "<get from slack>"

def download_json_from_url(stock):
    date_from="2017-01-01"
    url = f"https://api.worldtradingdata.com/api/v1/history?symbol={stock}&date_from={date_from}&sort=newest&api_token={token}"

    response = urllib.request.urlopen(url)
    resp_string = response.read().decode('utf-8')
    json_obj = json.loads(resp_string)
    return json_obj['history']

def calculate_x_and_y_values(all_time):
    x_vals = []
    y_vals = []
    for day, days_dict in sorted(all_time.items(), key=lambda item: item[0]):
        price = days_dict['volume']
        price = float(price)
        x_vals.append(day)
        y_vals.append(price)
    return x_vals, y_vals

def plot_stock(stock, x_vals, y_vals):
    plt.plot(x_vals, y_vals)
    plt.title(stock)
    plt.show()



stock = 'AAPL'
dict = download_json_from_url(stock)
x_vals, y_vals = calculate_x_and_y_values(dict)
plot_stock(stock, x_vals, y_vals)




