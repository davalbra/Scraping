from matplotlib import pyplot as plt
from matplotlib.pyplot import figure
import numpy as np
import math
lenguajes =("Python","C","java","go","javascript")
slices=(100,130,90,80,128)
colores =('red','blue','green','#DD98AA','#18492D')
plt.pie(slices,colors=colores)


valores=[1,2,3,4,5,6,7]
n=len(valores)
angulos=[i/n * 2 * np.pi for i in range(n)]

valores+=valores[:1]
angulos +=angulos[:1]

figure (figsize=(10,8),dpi=80)
plt.polar(angulos,valores,c='g')
plt.show()