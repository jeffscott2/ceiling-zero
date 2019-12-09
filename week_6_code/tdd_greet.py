
# req 1
# def greet(name):
#     return f"Hello, {name}."

# req 2
# def greet(name):
#     if name == None:
#         return f"Hello, my friend."
#     return f"Hello, {name}."


# # req 3
# def greet(name):
#     if name == None:
#         return f"Hello, my friend."
    
#     greeting = f"Hello, {name}."

#     if name == name.upper():
#         greeting = greeting.upper()

#     return greeting


# req 5
# def greet(name):
#     if name == None:
#         return f"Hello, my friend."
    
#     if isinstance(name, str):
#         greeting = f"Hello, {name}."
#         if name == name.upper():
#             greeting = greeting.upper()

#     elif isinstance(name, list) and len(name) == 2:
#         greeting = f"Hello, {name[0]} and {name[1]}."
        
#     elif isinstance(name, list) and len(name) > 2:
#         greeting = "Hello"

#         for i in range(0, len(name)):
#             if i == len(name) - 1:
#                 separator = ", and "
#             else:
#                 separator = ", "
#             greeting += separator + name[i]
#         greeting += "."

        
#     else:
#         greeting = ""

#     return greeting



# req 5 cleaner

def greet(name):
    if name == None:
        return f"Hello, my friend."

    if isinstance(name, str):
        greeting = f"Hello, {name}."
        if is_shout(name):
            greeting = greeting.upper()
    elif isinstance(name, list) and len(name) == 2:
        greeting = f"Hello, {name[0]} and {name[1]}."    
    elif isinstance(name, list) and len(name) > 2:
        greeting = greet_list(name)
    else:
        greeting = ""

    return greeting

def is_shout(name):
    return name == name.upper()

def is_last_element(names, idx):
    return idx == len(names) - 1

def greet_list(names):
    greeting = "Hello"

    for i in range(0, len(names)):
        if is_last_element(names, i) and len(names) == 2:
            greeting += " and  " + names[i]
        elif is_last_element(names, i):
            greeting += ", and " + names[i]
        else:
                greeting += ", " + names[i]
    greeting += "."
    return greeting