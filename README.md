# Template para programas en C
Un proyecto de práctica para implementar y estudiar algoritmos fundamentales y estructuras de datos utilizando el lenguaje C.

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Prerrequisitos](#-prerrequisitos)
- [Instalación](#-instalación)
- [Compilación](#-compilación)
- [Ejecución](#-ejecución)
- [Testing](#-testing)
- [Depuración](#-depuración)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Configuración](#-configuración)
- [Desarrollo](#-desarrollo)
- [Contribuir](#-contribuir)
- [Licencia](#-licencia)

## ✨ Características

- **Algoritmos de Ordenamiento**: Bubble Sort, Quick Sort, Merge Sort, Heap Sort
- **Algoritmos de Búsqueda**: Búsqueda lineal, binaria, y más
- **Estructuras de Datos**: Listas enlazadas, pilas, colas, árboles binarios
- **Algoritmos de Grafos**: BFS, DFS, Dijkstra
- **Sistema de Medición**: Cronometraje de algoritmos
- **Interfaz de Consola**: Menú interactivo colorizado
- **Testing Integrado**: Pruebas unitarias automáticas
- **Detección de Memory Leaks**: Integración con Valgrind

## 🔧 Prerrequisitos

### Sistema Operativo
- Linux (Ubuntu/Debian, CentOS/RHEL, Arch, etc.)
- macOS
- Windows con WSL2 o MinGW

### Software Requerido
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install build-essential gcc make valgrind

# macOS (requiere Homebrew)
brew install gcc make
brew install --cask valgrind  # Opcional

# CentOS/RHEL
sudo yum groupinstall "Development Tools"
sudo yum install valgrind

# Arch Linux
sudo pacman -S base-devel gcc make valgrind
```

### Versiones Mínimas
- **GCC**: 4.9 o superior (soporte para C11)
- **Make**: 3.81 o superior
- **Valgrind**: 3.10 o superior (opcional, para detección de memory leaks)

## 📥 Instalación

### 1. Clonar o Descargar el Proyecto
```bash
# Si usas Git
git clone https://github.com/ADD-templates/c-console-template.git
cd c-console-template

# O descargar y extraer manualmente
mkdir c-console-template
cd c-console-template
```

### 2. Crear la Estructura de Directorios
```bash
make dirs
```

### 3. Verificar la Instalación
```bash
make info
```

## 🔨 Compilación

### Compilación Básica
```bash
# Compilación optimizada para producción (recomendada)
make

# O explícitamente
make release
```

### Compilación para Desarrollo
```bash
# Compilación con información de debug
make debug
```

### Compilación Limpia
```bash
# Limpiar archivos de compilación
make clean

# Limpieza completa (elimina directorios)
make distclean
```

### Verificar Compilación
```bash
# Mostrar información del proyecto
make info

# El ejecutable se crea en: bin/c-console-program
ls -la bin/
```

## 🚀 Ejecución

### Ejecución Básica
```bash
# Compilar y ejecutar automáticamente
make run

# O ejecutar directamente
./bin/c-console-program
```

### Opciones de Menú
Al ejecutar el programa, verás un menú interactivo:

```
=== Algoritmos y Estructuras de Datos ===
1. Algoritmos de Ordenamiento
2. Estructuras de Datos
3. Algoritmos de Búsqueda
0. Salir
Selecciona una opción:
```

### Ejemplo de Uso
```bash
$ make run
Bienvenido al proyecto de Algoritmos y Estructuras de Datos
Versión: 1.0.0
Compilado en modo: RELEASE

=== Algoritmos y Estructuras de Datos ===
1. Algoritmos de Ordenamiento
2. Estructuras de Datos
3. Algoritmos de Búsqueda
0. Salir
Selecciona una opción: 1

--- Algoritmos de Ordenamiento ---
# Aquí se mostrarán los algoritmos implementados
```

## 🧪 Testing

### Ejecutar Todas las Pruebas
```bash
make test
```

### Compilar Solo las Pruebas
```bash
# Las pruebas se compilan en bin/test_*
ls bin/test_*
```

### Ejecutar Pruebas Específicas
```bash
# Ejecutar prueba de algoritmos
./bin/test_algorithms

# Ejecutar prueba de estructuras de datos
./bin/test_data_structures
```

### Agregar Nueva Prueba
1. Crear archivo en `tests/test_nueva_funcionalidad.c`
2. El Makefile detectará automáticamente el nuevo archivo
3. Ejecutar `make test` para incluir la nueva prueba

## 🐛 Depuración

### Compilación para Debug
```bash
make debug
```

### Usar GDB (GNU Debugger)
```bash
# Compilar en modo debug
make debug

# Ejecutar con GDB
gdb ./bin/c-console-program

# Comandos básicos de GDB
(gdb) break main          # Punto de interrupción en main
(gdb) run                 # Ejecutar programa
(gdb) next                # Siguiente línea
(gdb) step                # Entrar en función
(gdb) print variable      # Imprimir valor de variable
(gdb) backtrace           # Ver pila de llamadas
(gdb) quit                # Salir de GDB
```

### Detección de Memory Leaks con Valgrind
```bash
# Ejecutar con Valgrind automáticamente
make valgrind

# O manualmente
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./bin/c-console-program
```

### Debug con Print Statements
Los mensajes de debug están disponibles en modo debug:
```c
DEBUG_PRINT("Valor de variable: %d\n", variable);
```

## 📁 Estructura del Proyecto

```
c-console-template/
├── Makefile                 # Configuración de compilación
├── README.md               # Este archivo
├── src/                    # Código fuente
│   ├── main.c             # Punto de entrada
│   ├── algorithms/        # Implementaciones de algoritmos
│   │   ├── sorting.c      # Algoritmos de ordenamiento
│   │   ├── searching.c    # Algoritmos de búsqueda
│   │   └── graph.c        # Algoritmos de grafos
│   ├── data_structures/   # Estructuras de datos
│   │   ├── linked_list.c  # Lista enlazada
│   │   ├── stack.c        # Pila (Stack)
│   │   ├── queue.c        # Cola (Queue)
│   │   └── binary_tree.c  # Árbol binario
│   └── utils/             # Utilidades
│       ├── input.c        # Manejo de entrada
│       └── timer.c        # Medición de tiempo
├── include/               # Archivos de cabecera (.h)
│   ├── config.h          # Configuraciones globales
│   ├── algorithms/       # Headers de algoritmos
│   ├── data_structures/  # Headers de estructuras
│   └── utils/            # Headers de utilidades
├── build/                # Archivos objeto (.o)
├── bin/                  # Ejecutables
├── tests/                # Pruebas unitarias
└── docs/                 # Documentación adicional
```

## ⚙️ Configuración

### Configuraciones Globales
Edita `include/config.h` para personalizar:

```c
// Tamaños máximos
#define MAX_ARRAY_SIZE 10000
#define MAX_STRING_LENGTH 256

// Configuraciones de algoritmos
#define ENABLE_TIMING 1
#define SHOW_STEP_BY_STEP 0

// Colores de consola
#define RED     "\033[31m"
#define GREEN   "\033[32m"
// ... más colores
```

### Configuraciones de Compilación
Modifica el Makefile para personalizar:

```makefile
# Cambiar compilador
CC = clang  # En lugar de gcc

# Agregar flags personalizados
CFLAGS += -fsanitize=address  # AddressSanitizer

# Agregar librerías
LDFLAGS += -lpthread  # Para threading
```

### Variables de Entorno
```bash
# Cambiar compilador temporalmente
export CC=clang
make clean && make

# Agregar flags personalizados
export CFLAGS="-Wall -Wextra -O3"
make clean && make
```

## 💻 Desarrollo

### Agregar Nuevo Algoritmo

1. **Crear archivo fuente:**
   ```bash
   touch src/algorithms/mi_algoritmo.c
   touch include/algorithms/mi_algoritmo.h
   ```

2. **Implementar en el header (mi_algoritmo.h):**
   ```c
   #ifndef MI_ALGORITMO_H
   #define MI_ALGORITMO_H
   
   void mi_algoritmo(int arr[], int size);
   
   #endif
   ```

3. **Implementar en el fuente (mi_algoritmo.c):**
   ```c
   #include "algorithms/mi_algoritmo.h"
   #include "config.h"
   
   void mi_algoritmo(int arr[], int size) {
       // Tu implementación aquí
   }
   ```

4. **El Makefile detectará automáticamente el nuevo archivo**

### Agregar Nueva Estructura de Datos

1. **Seguir el mismo patrón en `data_structures/`**
2. **Definir estructura en el header:**
   ```c
   typedef struct {
       int data;
       struct nodo* next;
   } MiEstructura;
   ```

3. **Implementar funciones CRUD:**
   ```c
   MiEstructura* crear();
   void insertar(MiEstructura* estructura, int data);
   void eliminar(MiEstructura* estructura);
   void mostrar(MiEstructura* estructura);
   ```

### Agregar Pruebas

1. **Crear archivo de prueba:**
   ```bash
   touch tests/test_mi_funcionalidad.c
   ```

2. **Implementar pruebas:**
   ```c
   #include <assert.h>
   #include <stdio.h>
   #include "algorithms/mi_algoritmo.h"
   
   void test_mi_algoritmo() {
       // Implementar pruebas
       assert(condicion == true);
       printf("✓ test_mi_algoritmo pasó\n");
   }
   
   int main() {
       test_mi_algoritmo();
       printf("Todas las pruebas pasaron\n");
       return 0;
   }
   ```

## 🔍 Comandos Útiles del Makefile

```bash
make help          # Mostrar ayuda completa
make info          # Información del proyecto
make clean         # Limpiar archivos objeto
make distclean     # Limpieza completa
make dirs          # Crear estructura de directorios
make debug         # Compilar en modo debug
make release       # Compilar en modo release
make test          # Ejecutar todas las pruebas
make run           # Compilar y ejecutar
make valgrind      # Ejecutar con Valgrind
```

## 📊 Análisis de Performance

### Medición de Tiempo
Los algoritmos incluyen medición automática de tiempo de ejecución:

```c
#include "utils/timer.h"

start_timer();
mi_algoritmo(datos, tamaño);
double tiempo = stop_timer();
printf("Tiempo de ejecución: %.6f segundos\n", tiempo);
```

### Análisis con Profiler
```bash
# Compilar con información de profiling
gcc -pg -o programa src/*.c

# Ejecutar programa
./programa

# Analizar con gprof
gprof programa gmon.out > analisis.txt
```

## 🚨 Solución de Problemas Comunes

### Error: "gcc: command not found"
```bash
# Ubuntu/Debian
sudo apt install build-essential

# macOS
xcode-select --install
```

### Error: "make: command not found"
```bash
# Ubuntu/Debian
sudo apt install make

# macOS
brew install make
```

### Error de Compilación: "undefined reference"
1. Verificar que todos los archivos `.c` estén en `src/`
2. Verificar que los headers estén incluidos correctamente
3. Ejecutar `make clean && make debug` para recompilar todo

### Memory Leaks Detectados
1. Ejecutar `make valgrind` para identificar leaks
2. Verificar que cada `malloc()` tenga su `free()`
3. Verificar liberación de estructuras de datos dinámicas

### Programa No Responde
1. Verificar loops infinitos en algoritmos
2. Usar `Ctrl+C` para terminar ejecución
3. Revisar condiciones de terminación en algoritmos recursivos

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 🔗 Enlaces Útiles

- [Documentación de GCC](https://gcc.gnu.org/onlinedocs/)
- [Manual de Make](https://www.gnu.org/software/make/manual/)
- [Guía de Valgrind](https://valgrind.org/docs/manual/quick-start.html)
- [Tutorial de GDB](https://www.gdbtutorial.com/)

---

**Autor**: Tu Nombre  
**Versión**: 1.0.0  
**Última actualización**: Septiembre 2025

## 🚢 Uso con Docker

Puedes compilar y ejecutar el proyecto dentro de un contenedor Docker para evitar contaminación de librerías y dependencias.

### 1. Construir la imagen Docker

```bash
docker build -t algorithms-c-dev .
```

### 2. Entrar al contenedor

```bash
docker run --rm -it -v "$PWD":/home/devuser/app algorithms-c-dev
```

Esto te deja en un shell dentro del contenedor, en el directorio del proyecto.

### 3. Compilar y ejecutar dentro del contenedor

```bash
make
./bin/c-console-program
make test
make valgrind
```

### 4. Compilar y ejecutar fuera del contenedor

Si tienes GCC y Make instalados en tu sistema, puedes usar los mismos comandos fuera del contenedor:

```bash
make
./bin/c-console-program
make test
make valgrind
```

### 5. Notas

- El contenedor incluye GCC, Make y Valgrind.
- Los cambios realizados en el proyecto fuera del contenedor se reflejan dentro si usas el volumen `-v "$PWD":/home/devuser/app`.
- Puedes usar el contenedor para desarrollo seguro y reproducible.