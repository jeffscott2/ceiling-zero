
import csv

input_file='stocks.csv'

csv_file = open(input_file)
csv_row_reader = csv.reader(csv_file, delimiter=',' )
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
