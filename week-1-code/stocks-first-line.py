
input_line = "BRKB,10/15/2019,213,10"
line_parts = input_line.split(",")

stock_ticker = line_parts[0]

price = line_parts[2]
price = float(price)

quantity = line_parts[3]
quantity = float(quantity)

output_str = f"{stock_ticker}: ${price} * {quantity} shares = ${price*quantity} Total Value"
print(output_str)

