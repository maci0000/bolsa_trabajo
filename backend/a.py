
import pandas as pd

with open('perro.txt', 'r', encoding='utf-8') as archivo:
    for num_linea, linea in enumerate(archivo, 1):  # Empieza a contar desde 1
        if ";extension=mysqli" in linea:
            print(f"¡';extension=mysqli' encontrada en la línea {num_linea}!")
            break  # Opcional: Detenerse tras la primera coincidencia
    else:
        print("La palabra ';extension=mysqli' no se encontró en el archivo.")
        
        
        
        
        
        
        