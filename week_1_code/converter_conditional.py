
meter_input = float(input("Enter a distance in meters: "))
requested_format = input("Enter the unit you'd like to convert to (ft, in, mi, cm, km): ")

result_str = ""

m_to_feet = 3.28084
m_to_in = m_to_feet * 12

if requested_format == "ft":
    feet = meter_input * m_to_feet
    result_str = "That is equal to " + str(feet) +" feet"
elif requested_format == "in":
    inches = meter_input * m_to_in
    result_str = "That is equal to " + str(inches) +" inches"
else:
    print(f"Unknown format requested: {requested_format}")
    exit

print(result_str)


