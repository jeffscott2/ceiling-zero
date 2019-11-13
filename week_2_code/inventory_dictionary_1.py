# In this map the key is the building identifier, and the value is the current stock of printers
inventory = {}

# We can set inventory levels
inventory[1] = 30
inventory[3] = 10
inventory[55] = 3

# 1) print the entire inventory.  Add this to the bottom of the script as well to check
#    your results from the next steps

# 2) print the stock of printers in store 3


# Changing the stock level is also easy:
inventory[3] = 20

# But it's a little harder to "subtract one"
default = 0
inventory[3] = inventory.get(3, default) - 1

# 3) store 1 just sold 5 printers, adjust the inventory level.

# 4) store 55 just had 20 new printers delivered, adjust the inventory level as above

# 5) store 71 had no printers before, but got 15 delivered, adjust the inventory level as above

# 6) The Company just realized they can store printers anywhere, not just in buildings
#    try storing another 5 printers into the store "the shed out back"