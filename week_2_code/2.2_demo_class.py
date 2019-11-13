# Git
# class-2.2-git-fan.png

# Classes

## Motor Warehouse
#     - Motor
#     - MotorWarehouse
#     - MotorLocator    (if you had warehouses of motors, you might have a class responsible for finding the row and bin any motor is in)
#     - MotorSubstituter - Take a motor, return all the ones that could replace it

class Motor:
    def __init__(self, part_name, part_num, horse_power):
        self.part_num = self.part_num
        self.horse_power = self.horse_power

class Warehouse:
    def __init__(self, name):
        self.name = name

class MotorLocator:
    def find_motor(self, motor):
        # <query database>
        w = Warehouse("123 Sample Street")
        return w

class MotorSubstituter():
    def find_motor_substitutes(self, motor):
        ok_substitutes = []

        if motor.horse_power < 10:
            ok_substitutes.add(Motor("Motor XYZ", 12))
        
        if motor.horse_power < 20:
            ok_substitutes.add(Motor("Motor ABC ", 25))
        
        return ok_substitutes


# - SalesforceDatabaseConnect 
#     - If you have a SF database, a class can do the work to connect to it and allow you to query
# - Health: keep track of all the data in an EHR
#     - HealthRecord: stores the data
#     - HealthRecordVerifier: takes a HealthRecord input, and makes sure it's ok
# - ConnectFour
#     - An object for the board, each piece that's played would be an object



# Dictionaries
# - First way to use it is to store the information in a real dictionary.  To map a word to the definitions.
# - to make colors easier to work with, you can map the names of colors to the usable RGB codes
# - To track the ETAs of flights, you could map the flight number to the time it's expected to arrice

