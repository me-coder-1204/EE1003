import numpy as np
import matplotlib.pyplot as plt

def diff(y):
    if(np.cos(y)<=0): 
        return np.sqrt(-1*np.cos(y))
    else: return -1

x = np.linspace(0, 100, 1000)

y = np.zeros(1000).reshape(-1,1)
y1 = np.zeros(1000).reshape(-1,1)
y2 = np.zeros(1000).reshape(-1,1)

y[0] = 1
y1[0] = 1
y2[0] = 1

Y = np.block([y, y1, y2])

h = 0.001
# print(Y)
for i in range(1, 1000):
    Y[i][2] = Y[i-1][2] + h * diff(Y[i-1][2])
    Y[i][1] = Y[i-1][1] + h * Y[i-1][2]
    Y[i][0] = Y[i-1][0] + h * Y[i-1][1]

y4 = x * np.pi/2
# def lin()

plt.scatter(x, Y[:,0], s=1)
# plt.plot(x, y4, label='balls')
plt.show()
