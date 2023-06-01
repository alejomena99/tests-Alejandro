import yaml
import time

# Guardar el tiempo de inicio
start_time = time.time()

file_path = 'envoy.yaml'
insert_content = '''- match:
    prefix: "//"
  route:
    timeout: "//"
    prefix_rewrite: "//"
    cluster: test
'''

# Leer el archivo YAML y encontrar la línea que contiene "routes:"
with open(file_path, 'r') as file:
    lines = file.readlines()

line_index = None
for i, line in enumerate(lines):
    if "routes:" in line:
        line_index = i
        break

# Determinar la indentación de la línea que contiene "routes:"
routes_indentation = len(lines[line_index]) - len(lines[line_index].lstrip())

# Agregar dos espacios adicionales de indentación al contenido
insert_content_indented = ''.join(' ' * (routes_indentation) + line for line in insert_content.splitlines(True))

# Insertar el contenido debajo de la línea encontrada
if line_index is not None:
    lines.insert(line_index + 1, insert_content_indented)

# Escribir las líneas actualizadas en el archivo
with open(file_path, 'w') as file:
    file.writelines(lines)

# Leer el archivo YAML actualizado
with open(file_path, 'r') as file:
    updated_yaml = yaml.safe_load(file)

# Convertir el YAML actualizado a una cadena con indentación
output_yaml_str = yaml.dump(updated_yaml, indent=2)

# Imprimir el YAML actualizado con la indentación
print(output_yaml_str)

# Calcular el tiempo de duración
duration = time.time() - start_time

# Imprimir el tiempo de duración
print("Tiempo de duración:", duration*1000, "mili segundos")