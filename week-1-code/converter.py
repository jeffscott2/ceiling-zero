
meter_input = float(input("Enter a distance in meters: "))

converter = 3.28084

feet = meter_input * converter

result_str = "That is equal to " + str(feet) +" feet"
print(result_str)


