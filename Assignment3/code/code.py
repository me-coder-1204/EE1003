import numpy as np
import matplotlib.pyplot as plt
import cvxpy as cv


def func(x):
    return (x-1)**2 + 3

def diff(x):
    return 2 * (x-1)

x = np.linspace(-3, 1, 1000)

x_init = -1.5
x_curr = x_init
step  = 0.0001
c = 0

x_1 = cv.Variable()
x_2 = cv.Variable()

constraints = [x_1<=1, x_1 >= -3]

objective_1 = cv.Minimize((x_1-1)**2 + 3)
prob_1 = cv.Problem(objective_1, constraints)
prob_1.solve()

# objective_2 = cv.Maximize((x_2)**2 + 3)
# prob_2 = cv.Problem(objective_2, constraints)
# prob_2.solve()
while(np.abs(diff(x_curr))>1.0e-10):
    print(c)
    c+=1
    x_curr = x_curr - diff(x_curr) * step


while(x_init > -3):
    x_init = x_init + diff(x_init) * step
    print(x_init)

plt.plot(x, func(x), label = "function")
plt.scatter(x_1.value, func(x_1.value))
plt.scatter(x_init, func(x_init))
print(x_1.value)
# plt.scatter(x_2.value, func(x_2.value))
plt.savefig("../figs/fig2.png")
plt.show()