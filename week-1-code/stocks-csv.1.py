
import csv

input_file='week-1-code/stocks.csv'

csv_file = open(input_file)
csv_row_reader = csv.reader(csv_file, delimiter=',' )
for row_index, row in enumerate(csv_row_reader):
    
    row_string = "In Row #" + str(row_index)    
    print(row_string)

    print(row)
    
    if (row_index == 0):
        continue

    stock_ticker = row[0]
    price = row[2]
    print(type(price))
    price = float(price)
    print(type(price))
    quantity = float(row[3])
    continue
    print(f"{price} * {quantity} = {price*quantity}")
    print(stock_ticker)
    print ("")

