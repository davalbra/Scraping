##Ejemplo de graficos de barras
import pandas as pd
import matplotlib.pyplot as plt
import csv


f= open("datos.csv")
datos="datos.csv"
df=pd.read_csv(datos)
contador=0
listaCategoria=[]
posicion=df['posicion'].tolist()
curso=df['curso'].tolist()
valoraciones=df['valoraciones'].tolist()
categoria= df['categoria'].tolist()
lista_lenguajes=["Python", "Google Cloud Platform", "Programación R", "MATLAB", "SQL", "Javascript", "CSS", "Scala"]
m1=list(map(lambda x: "Python" in x, curso))
m2=list(map(lambda x: "Google Cloud Platform" in x, curso))
m3=list(map(lambda x: "Programación R" in x, curso))
m4=list(map(lambda x: "SQL" in x, curso))
m5=list(map(lambda x: "Javascript" in x, curso))
m6=list(map(lambda x: "CSS" in x, curso))
m7=list(map(lambda x: "Scala" in x, curso))
numeroPython=m1.count(True)
numeroGCP=m2.count(True)
numeroR=m3.count(True)
numeroSQL=m4.count(True)
numeroJvs=m5.count(True)
numeroCSS=m6.count(True)
numeroScala=m7.count(True)
listaY=[numeroPython, numeroGCP, numeroR, numeroSQL, numeroJvs, numeroCSS, numeroScala]
print(listaY)

## Declaramos valores para el eje x
eje_x = ["Python", "Google Cloud Platform", "Programación R", "MATLAB", "SQL", "Javascript", "CSS", "Scala"]

## Declaramos valores para el eje y
eje_y = [numeroPython, numeroGCP, numeroR, numeroSQL, numeroJvs, numeroCSS, numeroScala]

## Creamos Gráfica
plt.bar(eje_x, eje_y)

## Legenda en el eje y
plt.ylabel('Cantidades')

## Legenda en el eje x
plt.xlabel('Lenguajes de programación')

## Título de Gráfica
plt.title('Lenguajes de programación mas aprendidos')

## Mostramos Gráfica
plt.show()




