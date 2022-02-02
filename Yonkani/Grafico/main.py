import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
plt.rcParams['axes.labelsize'] = 9
plt.rcParams['xtick.labelsize'] = 7
#df = pd.read_csv("continentes.csv")
df2 = pd.read_csv("lenguajes.csv")
#df3 = pd.read_csv("mod.csv")

columna_Lenguaje = df2.iloc[0:10,1]
columna_porcentaje = df2.iloc[0:10,2]

plt.bar(columna_Lenguaje,columna_porcentaje)
plt.xlabel("Lenguaje de programacion")
plt.ylabel("Porcentaje de push")
plt.title("Lenguaje mas popular según cantidad de push en Github")
plt.show()