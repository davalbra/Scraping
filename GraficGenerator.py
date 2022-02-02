import csv
from builtins import str, max

from matplotlib import pyplot as plt
from matplotlib.pyplot import figure
import numpy as np
rows=[]
top=5
cantidad=0
with open('busqueda.csv', newline='') as File:
    reader = csv.reader(File)
    headers = next(reader)
    for row in reader:
        cantidad+=1
        #if(int(str(row).split(",")[1][2:-1])<=cantidad):
        rows.append(tuple(str(row)[2:-2].split("', '")))

ordenados = sorted(rows, key=lambda lengua : lengua[1])


tiempo=[]
dinero=[]
encuestas=[]
nombres=[]
indice = np.arange(len(nombres))
for i in range(cantidad):
    tiempo.append(int(float(ordenados[i][3])))
    dinero.append(int(float(ordenados[i][2])))
    encuestas.append(int(ordenados[i][4]))
    nombres.append(ordenados[i][0])
tiempoConver=[]
dineroConver=[]
maxTiempo=max(tiempo)
maxDinero=max(dinero)
for i in range(cantidad):
    tiempoConver.append(tiempo[i]/maxTiempo)
    dineroConver.append((dinero[i]/maxDinero))
indice = np.arange(len(nombres[:top]))

def add_value_label(x_list,y_list,y_list2):
    for i in range(0, len(x_list)):
        valor=round(y_list[i-1],2)
        h1=y_list[i-1]/2
        valor2=round(y_list2[i],2)
        plt.text(i,h1,f"{valor}%", ha="center")
        plt.text(i,h1*2+ y_list2[i ] / 2, f"{valor2}%", ha="center")
## Se crean las primeras barras
plt.bar(indice, tiempoConver[:top], label=f"Umbral-Tiempo  : {maxTiempo} años")

## Se crean las segundas barras y se apilan sobre las primeras
plt.bar(indice, dineroConver[:top], label=f"Umbral-Dinero: {maxDinero}$", bottom=tiempoConver[:top])
add_value_label(indice,tiempoConver,dineroConver)

plt.xticks(indice, nombres[:top])
plt.ylabel("Tiempo - Dienro")
plt.xlabel("Top Lenguajes")
plt.title("Comparativa entre lenguajes los lenguajes presentes de stackoverflow")
plt.legend()
plt.show()