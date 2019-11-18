import urllib.request
import csv

def main():

    url = "https://docs.google.com/spreadsheets/d/1QEANYPpfeW4fqibet7f4fkZKt5LJl8bqMgwsOPKP0MI/export?gid=0&format=csv"
    response = urllib.request.urlopen(url)
    csv_string = response.read().decode('utf-8')
    csv_lines = csv_string.splitlines()

    csv_row_reader = csv.reader(csv_lines, delimiter=',' )
    next(csv_row_reader)

    for row in csv_row_reader:
        
        print(row)
        
        
        stock_ticker = row[0]
        price = row[2]
        # print(type(price))
        price = float(price)
        # print(type(price))

        quantity = float(row[3])
        
        output_str = f"{stock_ticker}: ${price} * {quantity} shares = ${price*quantity} Total Value"
        print(output_str)



main()
