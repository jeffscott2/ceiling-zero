
def main():
    for i in generate_numbers():
        display_str = handle_number_fizz(i)
        # display_str = handle_number_nice(i)
        print(display_str)
        
def generate_numbers():
    return range(1,101)

def handle_number_nice(input):
    if is_divisible(input,3 ) and is_divisible(input,5):
        return "3&5*"
    elif is_divisible(input,3):
        return "3*"
    elif is_divisible(input,5):
        return "5*"
    else:
        return str(input)

def handle_number_fizz(input):
    if is_divisible(input,3 ) and is_divisible(input,5):
        return "FizzBuzz"
    elif is_divisible(input,3):
        return "Fizz"
    elif is_divisible(input,5):
        return "Buzz"
    else:
        return str(input)

def is_divisible(numerator, denominator):
    return numerator % denominator == 0

main()