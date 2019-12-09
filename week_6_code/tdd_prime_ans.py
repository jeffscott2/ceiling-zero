

def is_divisible(top, bottom):
    return top % bottom == 0

def is_prime(num):

    if num <= 1:
        return False

    for i in range (2, num):
        if is_divisible(num, i):
            return False
    return True
    