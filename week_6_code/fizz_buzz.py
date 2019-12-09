

def generate_input_list(num):
    return range(1,num+1)

def is_divisible(top, bottom):
    return top % bottom == 0

def number_to_text(num):
    if is_divisible(num, 3):
        return "Fizz"
    if is_divisible(num, 5):
        return "Fuzz"
    if is_divisible(num, 3) and is_divisible(num, 5):
        return "FizzBuzz"
    return str(num)

def main():
    count = 50
    inputs = generate_input_list(count)

if __name__ == '__main__':
    main()
