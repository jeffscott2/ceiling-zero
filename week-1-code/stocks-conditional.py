
import csv

input_file='stocks.csv'

csv_file = open(input_file)
csv_row_reader = csv.reader(csv_file, delimiter=',' )
next(csv_row_reader)

for row in csv_row_reader:
    
    stock_ticker = row[0]
    price = float(row[2])
    quantity = float(row[3])
    total = price * quantity

    output_str = f"{stock_ticker}: ${price} * {quantity} shares = ${total} Total Value"
    if total >= 1000:
        output_str = "* " + output_str
    print(output_str)
