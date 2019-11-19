import matplotlib.pyplot as plt
# First install
# $ python3 -m pip install matplotlib


# 
# https://matplotlib.org/3.1.1/tutorials/introductory/pyplot.html



## Line Chart
x_vals = [1,2,3,4,5,6]
y_vals = [6,3,8,2,1,3]

plt.plot(x_vals, y_vals)
plt.title("As a line chart")
plt.show()

## Bar Chart
# categories = ['IN','IL','OH']
# y_vals = [8,3,4]
# plt.bar(categories, y_vals)
# plt.title("Or a bar chart")
# plt.show()



## Many charts at once
# names = ['group_a', 'group_b', 'group_c']
# values = [1, 10, 100]

# plt.figure(figsize=(9, 3))

# plt.subplot(131)
# plt.bar(names, values)
# plt.subplot(132)
# plt.scatter(names, values)
# plt.subplot(133)
# plt.plot(names, values)
# plt.suptitle('Categorical Plotting')

# plt.show()
# # OR
# # plt.savefig('foo.png')