import pandas as pd

# Leer el archivo Excel
df = pd.read_excel('datos.xlsx')

# Convertir columnas numéricas a int (evitando np.int64)
columnas_numericas = ["ID_POSTULANTE", "Año_Ingreso", "ID_Universidad"]
df[columnas_numericas] = df[columnas_numericas].astype(int)

# Convertir DataFrame a lista de tuplas (valores nativos de Python)
lista_de_tuplas = [tuple(x) for x in df.itertuples(index=False, name=None)]

# Imprimir cada tupla en una línea separada
print("Lista de tuplas:")
for tupla in lista_de_tuplas:
    print(f"{tupla},")  # La coma al final permite copiar y pegar directamente en una lista

# Opcional: Guardar en un archivo .txt con formato de líneas separadas
with open('tuplas_formateadas.txt', 'w', encoding='utf-8') as f:
    for tupla in lista_de_tuplas:
        f.write(f"{tupla},\n")

print("\n¡Tuplas impresas una por línea y guardadas en 'tuplas_formateadas.txt'!")