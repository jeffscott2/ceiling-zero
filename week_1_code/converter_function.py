
def get_inputs():
    meter_input = float(input("Enter a distance in meters: "))
    requested_format = input("Enter the unit you'd like to convert to (ft, in, mi, cm, km): ")
    return meter_input, requested_format

def generate_result(value, target_unit):

    result_str = ""

    m_to_feet = 3.28084
    m_to_in = m_to_feet * 12

    if target_unit == "ft":
        feet = meter_input * m_to_feet
        result_str = "That is equal to " + str(feet) +" feet"
    elif target_unit == "in":
        inches = meter_input * m_to_in
        result_str = "That is equal to " + str(inches) +" inches"
    else:
        raise RuntimeError(f"Unknown format requested: {target_unit}")

    return result_str

def display_result(result_str): 
    print(result_str)


meter_input, requested_format = get_inputs()
result = generate_result(meter_input, requested_format)
display_result(result)

